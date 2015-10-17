//
//  campaignFormTableViewController.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/17/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "campaignFormTableViewController.h"

@interface campaignFormTableViewController ()

@end

@implementation campaignFormTableViewController

- (instancetype)initWithCampaign:(PFObject*)campaign{
    self = [super initWithStyle:UITableViewStylePlain];
    
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yosemite.jpg"]];
    
    [self.tableView setParallaxHeaderView:image
                                      mode:VGParallaxHeaderModeFill // For more modes have a look in UIScrollView+VGParallaxHeader.h
                                    height:200];

//    [self.tableView.parallaxHeader set];
    
    self.tableView.parallaxHeader.stickyViewPosition = VGParallaxHeaderStickyViewPositionBottom; // VGParallaxHeaderStickyViewPositionTop

    
    self.options = [NSMutableArray new];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.options = [@[@"1", @"2", @"3", @"4"] mutableCopy];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.options.count;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // This must be called in order to work
    [self.tableView shouldPositionParallaxHeader];
    
    // scrollView.parallaxHeader.progress - is progress of current scroll
    NSLog(@"Progress: %f", scrollView.parallaxHeader.progress);
    
    // This is how you can implement appearing or disappearing of sticky view
    [scrollView.parallaxHeader.stickyView setAlpha:scrollView.parallaxHeader.progress];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"otherCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"otherCell"];
    }
    
    
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
