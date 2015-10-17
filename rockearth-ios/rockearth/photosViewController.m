//
//  photosViewController.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/17/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "photosViewController.h"

static NSString * const reuseIdentifier = @"Cell";

@interface photosViewController ()

@end

@implementation photosViewController{
    UICollectionView* collectionView;
}

- (instancetype)initWithCampaign:(PFObject*)campaign{
    self = [super init];
    self.campaign = campaign;
    return self;
}

- (instancetype)initWithPeople:(NSArray*)people{
    self = [super init];
    self.dataSource = [people mutableCopy];
    return self;
}

- (void)viewDidLoad {
    
    [self.navigationItem setTitle:@"Photoshop"];
    
    UIBarButtonItem* bye = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonSystemItemCancel target:self action:@selector(done)];
    self.navigationItem.leftBarButtonItem = bye;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [collectionView registerClass:[photoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:collectionView];
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    photoCollectionViewCell* cell = [cv dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[photoCollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    cell.backgroundColor = [UIColor whiteColor];
    PFObject* datasourceitem = (PFObject*)[self.dataSource objectAtIndex:indexPath.row];
    NSLog(@"%@", datasourceitem[@"name"]);
    
    PFFile* image = datasourceitem[@"picture"];
    [image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
//        NSLog(@"%@", data);
        [cell.personPicture setImage:[UIImage imageWithData:data]];
    }];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
    UIView* present = [self getConfirmForIndex:indexPath.row];
    KLCPopup* popup = [KLCPopup popupWithContentView:present showType:KLCPopupShowTypeGrowIn dismissType:KLCPopupDismissTypeShrinkOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:YES];
    [popup show];
    
}


#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

- (void)done{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIView*)getConfirmForIndex:(NSInteger)index{
    
    
    UIView* confirm = [[UIView alloc] init];
    [confirm setBackgroundColor:[UIColor whiteColor]];
    [confirm setFrame:CGRectMake(0, 0, self.view.frame.size.width-28, self.view.frame.size.width-28)];
    UIImageView* checkMark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check.png"]];
    checkMark.translatesAutoresizingMaskIntoConstraints = NO;
    [confirm addSubview:checkMark];
    UILabel* success = [UILabel new];
    success.translatesAutoresizingMaskIntoConstraints = NO;
    [success setText:@"Success"];
    [confirm addSubview:success];
    [confirm addCompactConstraints:@[
                                     @"check.height = self.width * 0.8",
                                     @"check.width = self.width * 0.8",
                                     @"check.centerX = self.centerX",
                                     @"check.centerY = self.centerY",
                                     @"success.top = check.bottom + 7.5",
                                     @"success.centerX = self.centerX"
                                     ]
                           metrics:@{
                                     
                                     }
                             views:@{
                                     @"self":confirm,
                                     @"check":checkMark,
                                     @"success":success
                                     }];
    [confirm updateConstraints];
    
    confirm.layer.cornerRadius =10;
    confirm.clipsToBounds = YES;
    
    PFObject* datasourceitem = (PFObject*)[self.dataSource objectAtIndex:index];
    NSLog(@"%@", datasourceitem[@"name"]);
    
    [success setText:datasourceitem[@"name"]];
    
    PFFile* image = datasourceitem[@"picture"];
    [image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        //        NSLog(@"%@", data);
        [checkMark setImage:[UIImage imageWithData:data]];
    }];

    
    return confirm;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
