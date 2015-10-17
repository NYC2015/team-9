//
//  campaignFormTableViewController.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/17/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "campaignFormTableViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface campaignFormTableViewController ()

@property (nonatomic, strong) UIImage* image;

@end

@implementation campaignFormTableViewController

- (instancetype)initWithCampaign:(PFObject*)campaign{
    self = [super initWithStyle:UITableViewStylePlain];
    
    
    
    return self;
}

- (instancetype)initWithImage:(UIImage*)image{
    self = [super initWithStyle:UITableViewStylePlain];
    self.image = image;
    return self;
}

- (instancetype)initWithImage:(UIImage*)image andCampaign:(PFObject*)campaign{
    self = [super initWithStyle:UITableViewStylePlain];
    self.image = image;
    self.campaign = campaign;
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem* bye = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonSystemItemCancel target:self action:@selector(done)];
    self.navigationItem.leftBarButtonItem = bye;

    [self.navigationItem setTitle:self.campaign[@"name"]];

    
    UIImageView* image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yosemite.jpg"]];
    if (self.image) {
        [self.tableView setParallaxHeaderView:[[UIImageView alloc] initWithImage:self.image]
                                         mode:VGParallaxHeaderModeCenter // For more modes have a look in UIScrollView+VGParallaxHeader.h
                                       height:self.view.frame.size.height*.35];
    } else {
        [self.tableView setParallaxHeaderView:image
                                         mode:VGParallaxHeaderModeCenter // For more modes have a look in UIScrollView+VGParallaxHeader.h
                                       height:self.view.frame.size.height*.35];
    }

//    [self.tableView.parallaxHeader set];
    
    self.tableView.parallaxHeader.stickyViewPosition = VGParallaxHeaderStickyViewPositionBottom; // VGParallaxHeaderStickyViewPositionTop
    
    [self.tableView registerClass:[campaignOptionsTableViewCell class] forCellReuseIdentifier:@"thingthing"];
    
    self.options = [NSMutableArray new];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.options = [@[@"1", @"2", @"3"] mutableCopy];
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((self.view.frame.size.width/16)*9) - 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    campaignOptionsTableViewCell *cell = [[campaignOptionsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"thingthing"];
    if (cell == nil) {
        cell = [[campaignOptionsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"thingthing"];
    }
    
    [cell.image setImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)indexPath.row]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    NSArray* colors = @[[UIColor purpleColor], UIColorFromRGB(0x10F7F0),
                        [[UIColor redColor] colorWithAlphaComponent:0.60], [UIColor redColor]];
    [cell.image setTintColor:[colors objectAtIndex:indexPath.row]];
    
    NSArray* text = @[@"Sign Petition", @"Campaign Photos", @"Campaign Notes"];
    [cell.label setText:[text objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        campaignFormViewController* form = [[campaignFormViewController alloc] initPreloadWithCampaign:self.campaign];
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:form];
        [self presentViewController:nav animated:YES completion:nil];
    } else if (indexPath.row == 1){
        
            PFQuery* query = [PFQuery queryWithClassName:@"signees"];
            [query whereKey:@"campaignID" equalTo:self.campaign.objectId];
            [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                
                if (error == nil) {
                    NSLog(@"%@", objects);
                    
                    photosViewController* photos = [[photosViewController alloc] initWithPeople:objects];
                    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:photos];
                    [self presentViewController:nav animated:YES completion:nil];
                }
            }];
    } else if (indexPath.row == 2){
        
        detailViewController* detail = [[detailViewController alloc] initWithNibName:@"detailViewController" bundle:nil];
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:detail];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
}


- (void)done{
    [self dismissViewControllerAnimated:YES completion:nil];
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
