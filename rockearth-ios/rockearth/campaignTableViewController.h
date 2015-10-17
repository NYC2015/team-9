//
//  campaignTableViewController.h
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "locationSingleton.h"
#import "CampaignTableViewCell.h"
#import <Parse/Parse.h>
#import "campaignFormViewController.h"
#import "campaignFormTableViewController.h"

@interface campaignTableViewController : UITableViewController <centralLocationDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray* campaigns;
@property (nonatomic, strong) CLLocation* location;
@property (nonatomic, strong) NSMutableArray* campaignImages;

@end
