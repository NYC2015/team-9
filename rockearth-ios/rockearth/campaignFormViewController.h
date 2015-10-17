//
//  campaignFormViewController.h
//  
//
//  Created by Rafi Rizwan on 10/17/15.
//
//

#import <UIKit/UIKit.h>
#import <FastttCamera/FastttCamera.h>
#import <ZFCheckbox/ZFCheckbox.h>
#import <Parse/Parse.h>

@interface campaignFormViewController : UIViewController<FastttCameraDelegate, UITextFieldDelegate>

- (instancetype)initPreload;

@end
