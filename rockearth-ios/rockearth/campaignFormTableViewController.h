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
#import "campaignOptionsTableViewCell.h"
#import "campaignFormViewController.h"
#import "photosViewController.h"
#import "detailViewController.h"

@interface campaignFormTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray* options;

- (instancetype)initWithImage:(UIImage*)image;
@property (nonatomic, strong) PFObject* campaign;
- (instancetype)initWithImage:(UIImage*)image andCampaign:(PFObject*)campaign;

@end
