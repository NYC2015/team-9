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

@interface campaignTableViewController : UITableViewController <centralLocationDelegate>

@property (nonatomic, strong) NSMutableArray* campaigns;

@end
