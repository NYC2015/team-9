//
//  CampaignTableViewCell.h
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CampaignTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* background;
@property (nonatomic, strong) UIImageView* overLay;
@property (nonatomic, strong) UILabel* campaignName;
@property (nonatomic, strong) UILabel* location;
@property (nonatomic, strong) UILabel* sigs;

@end
