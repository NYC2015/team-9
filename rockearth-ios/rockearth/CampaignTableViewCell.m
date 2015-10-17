//
//  CampaignTableViewCell.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "CampaignTableViewCell.h"
#import <CompactConstraint/CompactConstraint.h>

@implementation CampaignTableViewCell{
    UIImageView* locationImage;
}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.background = [[UIImageView alloc] init];
    self.background.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.background];
    
    self.overLay = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlay.png"]];
    self.overLay.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.overLay];
    
    self.campaignName = [UILabel new];
    self.campaignName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.campaignName setFont:[UIFont systemFontOfSize:18 weight:12]];
    [self.campaignName setTextColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.campaignName];
    
    self.location = [UILabel new];
    self.location.translatesAutoresizingMaskIntoConstraints = NO;
    [self.location setFont:[UIFont systemFontOfSize:10]];
    [self.location setTextColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.location];
    
    self.sigs = [UILabel new];
    self.sigs.translatesAutoresizingMaskIntoConstraints = NO;
    [self.sigs setTextColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.sigs];

    
    [self.contentView addCompactConstraints:@[
                                              @"background.centerX = self.centerX",
                                              @"background.centerY = self.centerY",
                                              @"background.width = self.width",
                                              @"background.height = self.height",
                                              @"over.centerX = self.centerX",
                                              @"over.centerY = self.centerY",
                                              @"over.width = self.width",
                                              @"over.height = self.height",
                                              @"location.bottom = self.bottom - 5",
                                              @"location.left = self.left + 10",
                                              @"name.bottom = location.top - 5",
                                              @"name.left = location.left",
                                              @"sigs.right = self.right - 10",
                                              @"sigs.bottom = self.bottom - 5",
                                              ]
                                    metrics:@{
                                              
                                              }
                                      views:@{
                                              @"self":self.contentView,
                                              @"background":self.background,
                                              @"over":self.overLay,
                                              @"name":self.campaignName,
                                              @"location":self.location,
                                              @"sigs":self.sigs
                                              }];
    
    [self.contentView updateConstraints];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    // Configure the view for the selected state
}

@end
