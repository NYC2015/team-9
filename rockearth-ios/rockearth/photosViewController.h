//
//  photosViewController.h
//  rockearth
//
//  Created by Rafi Rizwan on 10/17/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "photoCollectionViewCell.h"
#import <Parse/Parse.h>
#import <KLCPopup/KLCPopup.h>
#import <CompactConstraint/CompactConstraint.h>


@interface photosViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (instancetype)initWithPeople:(NSArray*)people;

@property (nonatomic, strong) NSMutableArray* dataSource;
@property (nonatomic, strong) PFObject* campaign;

@end
