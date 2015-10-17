
//
//  loginViewController.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [[locationSingleton sharedLocation] findLocaton];
    [locationSingleton sharedLocation].cDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)recievedLocation:(CLLocation *)location{
    self.location = location;
    
    PFQuery *query = [PFQuery queryWithClassName:@"campaign"];
    
    PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:_location.coordinate.latitude
                                               longitude:_location.coordinate.longitude];
    
    [query whereKey:@"location"
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
            NSLog(@"success in geo query! \n %@", objects);
            
        }
    }];



}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
