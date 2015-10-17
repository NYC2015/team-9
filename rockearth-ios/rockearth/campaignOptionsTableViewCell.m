//
//  campaignOptionsTableViewCell.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/17/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "campaignOptionsTableViewCell.h"
#import <CompactConstraint/CompactConstraint.h>

@implementation campaignOptionsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.image = [UIImageView new];
    self.image.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.image];
    
    self.label = [UILabel new];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:22]];
    [self.contentView addSubview:self.label];
    
    
    [self.contentView addCompactConstraints:@[
                                              @"image.height = 60",
                                              @"image.width = 60",
                                              @"image.left = self.left + 16",
                                              @"image.centerY = self.centerY",
                                              @"text.left = image.right + 16",
                                              @"text.centerY = self.centerY"
                                              ]
                                    metrics:@{
                                              
                                              }
                                      views:@{
                                              @"self":self.contentView,
                                              @"image":self.image,
                                              @"text":self.label
                                              }];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
