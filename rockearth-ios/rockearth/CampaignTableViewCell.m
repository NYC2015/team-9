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
    [self.contentView addCompactConstraints:@[
                                              @"background.centerX = self.centerX",
                                              @"background.centerY = self.centerY",
                                              @"background.width = self.width",
                                              @"background.height = self.height"
                                              ]
                                    metrics:@{
                                              
                                              }
                                      views:@{
                                              @"self":self.contentView,
                                              @"background":self.background
                                              }];
    
    [self.contentView updateConstraints];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    // Configure the view for the selected state
}

@end
