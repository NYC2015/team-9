//
//  loginViewController.h
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "ViewController.h"
#import "locationSingleton.h"
#import <Parse/Parse.h>

@interface loginViewController : ViewController 

@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) CLLocation* location;

@end
