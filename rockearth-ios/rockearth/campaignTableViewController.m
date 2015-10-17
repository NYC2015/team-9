//
//  campaignTableViewController.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "campaignTableViewController.h"



@interface campaignTableViewController ()

@end

static NSString* cellID = @"campaignCell";

@implementation campaignTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Campaigns"];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];

    [self.tableView registerClass:[CampaignTableViewCell class] forCellReuseIdentifier:cellID];
    
    self.campaigns = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [[locationSingleton sharedLocation] findLocaton];
    [locationSingleton sharedLocation].cDelegate = self;

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((self.view.frame.size.width/16)*9);
}


- (void)recievedLocation:(CLLocation *)location{
    self.location = location;
    
    PFQuery *query = [PFQuery queryWithClassName:@"campaign"];
    
    PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:_location.coordinate.latitude
                                               longitude:_location.coordinate.longitude];
    
    [query whereKey:@"campLocation"
       nearGeoPoint:point
   withinKilometers:100];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {  // The query failed
            NSLog(@"error in geo query!");
        } else {
            // The query is successful
            // 1. Find new posts (those that we did not already have)
            // 2. Find posts to remove (those we have but that we did not get from this query)
            // 3. Configure the new posts
            // 4. Remove the old posts and add the new posts
//            NSLog(@"success in geo query! \n %@", objects);
            [self.campaigns addObjectsFromArray:objects];
            NSLog(@"%@", self.campaigns);
            [self.tableView reloadData];
            
        }
    }];
    
    

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.campaigns.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CampaignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CampaignTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    
    [cell.background setImage:[UIImage imageNamed:@"fallout.jpg"]];
    
    PFObject* dataSourceItem = ((PFObject*)[self.campaigns objectAtIndex:indexPath.row]);
    
    PFFile* image = dataSourceItem[@"backgroundImage"];
    [image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        [cell.background setImage:[UIImage imageWithData:data]];
    }];
    
    
    cell.campaignName.text = dataSourceItem[@"name"];
    
    
    cell.location.text = dataSourceItem[@"areaName"];
    
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
