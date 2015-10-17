//
//  campaignFormTableViewController.h
//  rockearth
//
//  Created by Rafi Rizwan on 10/17/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <VGParallaxHeader/UIScrollView+VGParallaxHeader.h>

@interface campaignFormTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray* options;

@end
