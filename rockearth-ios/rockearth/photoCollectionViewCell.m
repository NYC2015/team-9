//
//  photoCollectionViewCell.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/17/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "photoCollectionViewCell.h"

@implementation photoCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.personPicture = [[UIImageView alloc] initWithFrame:self.contentView.frame];
    [self.contentView addSubview:self.personPicture];
    return self;
}

@end
