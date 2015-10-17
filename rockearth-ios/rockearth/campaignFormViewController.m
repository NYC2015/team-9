//
//  campaignFormViewController.m
//
//
//  Created by Rafi Rizwan on 10/17/15.
//
//

#import "campaignFormViewController.h"
#import <CompactConstraint/CompactConstraint.h>


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface campaignFormViewController ()
@property (nonatomic, strong) FastttCamera *fastCamera;



@end

@implementation campaignFormViewController{
    UITextField* name;
    UITextField* email;
    UITextField* zipcode;
    NSArray* checkfields;
    UIImageView* photo;
    UIButton* capture;
    UIButton* cancelPhoto;
    ZFCheckbox* check;
    CGRect originalFrame;
    UIScrollView* scroller;
    BOOL isRaised;
    
    UIImage* imagepotato;
    KLCPopup* popup;
    
    UIButton* flipCam;
    
    BOOL front;
}

- (instancetype)initPreloadWithCampaign:(PFObject*)campaign{
    self = [super init];
    
    self.campaign = campaign;
    
    _fastCamera = [FastttCamera new];
    
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //    [self.view setBackgroundColor:[UIColor colorWithRed:152.0f/255.0f green:200.0f/255.0f blue:99.0f/255.0f alpha:1.0f]];
    
    UITapGestureRecognizer* dismissKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboardCustom)];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIBarButtonItem* bye = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonSystemItemCancel target:self action:@selector(done)];
    self.navigationItem.leftBarButtonItem = bye;
    
     scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, self.view.frame.size.height)];
    [self.view addSubview:scroller];
    [scroller setCanCancelContentTouches:YES];
    [scroller addGestureRecognizer:dismissKeyboard];

    originalFrame = scroller.frame;
    isRaised = NO;
    
    front = NO;
    
    NSLog(@"%f", scroller.frame.size.height);
    
    [self.navigationItem setTitle:@"Join Our Cause"];
    
    name = [UITextField new];
    [name setDelegate:self];
    name.translatesAutoresizingMaskIntoConstraints = NO;
    name.backgroundColor = [UIColor lightGrayColor];
    name.layer.cornerRadius = 10;
    UILabel* nameL = [UILabel new];
    nameL.translatesAutoresizingMaskIntoConstraints = NO;
    [nameL setFont:[UIFont fontWithName:@"Roboto-Medium" size:18]];
    [nameL setTintColor:[UIColor whiteColor]];
    [nameL setTextColor:[UIColor darkGrayColor]];
    nameL.text = @"Name";
    [scroller addSubview:nameL];
    [scroller addSubview:name];
    
    
    //-------------- camera point --------------
    if (_fastCamera == nil) {
        _fastCamera = [FastttCamera new];
    }
    self.fastCamera.delegate = self;
//    [self fastttAddChildViewController:_fastCamera belowSubview:nameL];
    self.fastCamera.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    [self addChildViewController:_fastCamera];
    [scroller addSubview:_fastCamera.view];
    
    photo = [[UIImageView alloc] init];
    [photo setFrame:_fastCamera.view.frame];
    [_fastCamera.view addSubview:photo];
    
    
    
    capture = [UIButton buttonWithType:UIButtonTypeCustom];
    [capture addTarget:self action:@selector(snap) forControlEvents:UIControlEventTouchUpInside];
    [capture setBackgroundColor:[UIColor whiteColor]];
    capture.translatesAutoresizingMaskIntoConstraints = NO;
    [_fastCamera.view addSubview:capture];
    
    cancelPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelPhoto addTarget:self action:@selector(cancelPhoto) forControlEvents:UIControlEventTouchUpInside];
    [cancelPhoto setBackgroundImage:[[UIImage imageNamed:@"cancel30.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:normal];
    [cancelPhoto setTintColor:[UIColor redColor]];
    cancelPhoto.translatesAutoresizingMaskIntoConstraints = NO;
    [cancelPhoto setAlpha:0.0];
    [_fastCamera.view addSubview:cancelPhoto];
    
    flipCam = [UIButton buttonWithType:UIButtonTypeCustom];
    [flipCam addTarget:self action:@selector(flip) forControlEvents:UIControlEventTouchUpInside];
    [flipCam setBackgroundImage:[[UIImage imageNamed:@"flip.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:normal];
    [flipCam setTintColor:[UIColor whiteColor]];
    flipCam.translatesAutoresizingMaskIntoConstraints = NO;
    [_fastCamera.view addSubview:flipCam];

    
    
    [_fastCamera.view addCompactConstraints:@[
                                              @"button.bottom = self.bottom - 15",
                                              @"button.centerX = self.centerX",
                                              @"button.height = 60",
                                              @"button.width = 60",
                                              @"cancel.bottom = self.bottom - 15",
                                              @"cancel.centerX = self.centerX",
                                              @"cancel.height = 45",
                                              @"cancel.width = 45",
                                              @"flip.right = self.right - 10",
                                              @"flip.top = self.top + 10",
                                              @"flip.height = 30",
                                              @"flip.width = 30"
                                              ]
                                    metrics:@{
                                              
                                              }
                                      views:@{
                                              @"self":_fastCamera.view,
                                              @"button":capture,
                                              @"cancel":cancelPhoto,
                                              @"flip":flipCam
                                              }];
    
    capture.layer.cornerRadius = 30;
    capture.clipsToBounds = YES;
    

    
    email = [UITextField new];
    [email setDelegate:self];
    email.translatesAutoresizingMaskIntoConstraints = NO;
    email.backgroundColor = [UIColor lightGrayColor];
    email.layer.cornerRadius = 10;
    UILabel* emailL = [UILabel new];
    emailL.translatesAutoresizingMaskIntoConstraints = NO;
    [emailL setFont:[UIFont fontWithName:@"Roboto-Medium" size:18]];
    [emailL setTintColor:[UIColor whiteColor]];
    [emailL setTextColor:[UIColor darkGrayColor]];
    [scroller addSubview:emailL];
    emailL.text = @"Email";
    [scroller addSubview:email];
    zipcode = [UITextField new];
    [zipcode setDelegate:self];
    zipcode.translatesAutoresizingMaskIntoConstraints = NO;
    zipcode.backgroundColor = [UIColor lightGrayColor];
    zipcode.layer.cornerRadius = 10;
    UILabel* zipcodeL = [UILabel new];
    zipcodeL.translatesAutoresizingMaskIntoConstraints = NO;
    [zipcodeL setFont:[UIFont fontWithName:@"Roboto-Medium" size:18]];
    zipcodeL.text = @"Zipcode";
    [zipcodeL setTextColor:[UIColor darkGrayColor]];
    //    zipcodeL.
    [zipcodeL setTintColor:[UIColor whiteColor]];
    [scroller addSubview:zipcodeL];
    [scroller addSubview:zipcode];
    
    UILabel* final = [UILabel new];
    final.translatesAutoresizingMaskIntoConstraints = NO;
    [final setText:@"I acknowldege that I would like to support this campaign and receive more information about it."];
    [final setNumberOfLines:0];
    [final setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:final];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    check = [[ZFCheckbox alloc] init];
    check.lineWidth = 2.0;
    check.translatesAutoresizingMaskIntoConstraints = NO;
    [check addTarget:self action:@selector(uploadDisBitch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:check];
    [check setUserInteractionEnabled:YES];
    
    [scroller addCompactConstraints:@[
                                      @"name.centerX = self.centerX",
                                      @"name.top = nlabel.bottom + 5",
                                      @"name.height = 40",
                                      @"name.width = self.width - 32",
                                      @"email.centerX = name.centerX",
                                      @"email.top = alabel.bottom + 5",
                                      @"email.width = self.width - 32",
                                      @"email.height = 40",
                                      @"zipcode.centerX = name.centerX",
                                      @"zipcode.top = plabel.bottom + 5",
                                      @"zipcode.width = self.width - 32",
                                      @"zipcode.height = 40",
                                      @"nlabel.top = self.top + startPoint",
                                      @"nlabel.left = self.left + 16",
                                      @"alabel.top = name.bottom + ratioDifference",
                                      @"alabel.left = self.left + 16",
                                      @"plabel.top = email.bottom + ratioDifference",
                                      @"plabel.left = self.left + 16",

                                      ]
                            metrics:@{
                                      @"ratioDifference":@(self.view.frame.size.height/32),
                                      @"startPoint":@(screen.size.width + 20)
                                      }
                              views:@{
                                      @"self":scroller,
                                      @"name":name,
                                      @"email":email,
                                      @"zipcode":zipcode,
                                      @"nlabel":nameL,
                                      @"alabel":emailL,
                                      @"plabel":zipcodeL,
                                      }];
    
    [self.view addCompactConstraints:@[
                                       @"check.height = 60",
                                       @"check.width = 60",
                                       @"check.top = zipcode.bottom + 100",
                                       @"check.centerX = self.centerX",
                                       @"final.bottom = check.top - 10",
                                       @"final.centerX = self.centerX",
                                       @"final.width = self.width - 28"
                                       ]
                             metrics:@{
                                       
                                       }
                               views:@{
                                       @"self":self.view,
                                       @"check":check,
                                       @"zipcode":zipcode,
                                       @"final":final
                                       }];
    
    check.layer.cornerRadius = 30;
    check.clipsToBounds = YES;
    
    [scroller updateConstraints];
    [scroller setContentSize:CGSizeMake(self.view.frame.size.width, 900)];
    
    
    // Listen for keyboard appearances and disappearances
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)done{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)flip{
    
    if (front) {
        front = NO;
        if ([FastttCamera isCameraDeviceAvailable:FastttCameraDeviceRear]) {
            [self.fastCamera setCameraDevice:FastttCameraDeviceRear];
        }
    } else {
        front = YES;
        if ([FastttCamera isCameraDeviceAvailable:FastttCameraDeviceFront]) {
            [self.fastCamera setCameraDevice:FastttCameraDeviceFront];
        }
    }
    
}

- (void)snap{
    [_fastCamera takePicture];
    [UIView animateWithDuration:0.5 animations:^{
        [capture setAlpha:0.0];
        [cancelPhoto setAlpha:1.0];
    }];
    
}

- (void)cancelPhoto{
    [UIView animateWithDuration:0.5 animations:^{
        [capture setAlpha:1.0];
        [cancelPhoto setAlpha:0.0];
    }];
    photo.image = nil;
}

- (void)checkedOff{
    
}

#pragma mark - IFTTTFastttCameraDelegate

- (void)cameraController:(FastttCamera *)cameraController
 didFinishCapturingImage:(FastttCapturedImage *)capturedImage
{
    /**
     *  Here, capturedImage.fullImage contains the full-resolution captured
     *  image, while capturedImage.rotatedPreviewImage contains the full-resolution
     *  image with its rotation adjusted to match the orientation in which the
     *  image was captured.
     */
}

- (void)cameraController:(FastttCamera *)cameraController
didFinishScalingCapturedImage:(FastttCapturedImage *)capturedImage
{
    /**
     *  Here, capturedImage.scaledImage contains the scaled-down version
     *  of the image.
     */
}

- (void)cameraController:(FastttCamera *)cameraController
didFinishNormalizingCapturedImage:(FastttCapturedImage *)capturedImage
{
    /**
     *  Here, capturedImage.fullImage and capturedImage.scaledImage have
     *  been rotated so that they have image orientations equal to
     *  UIImageOrientationUp. These images are ready for saving and uploading,
     *  as they should be rendered more consistently across different web
     *  services than images with non-standard orientations.
     */
    [photo setImage:capturedImage.fullImage];
    
    imagepotato = capturedImage.scaledImage;
    
    UIImageWriteToSavedPhotosAlbum(capturedImage.fullImage, nil, nil, nil);

    
//    [capturedImage ]
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [name resignFirstResponder];
    [zipcode resignFirstResponder];
    [email resignFirstResponder];
}

- (void)keyboardDidShow: (NSNotification *) notif{
    // Do something here
    if (!isRaised) {
        isRaised = YES;
        [UIView animateWithDuration:0.2 animations:^{
            scroller.frame = CGRectOffset(scroller.frame, 0, -180);
            [self.view layoutSubviews];
        }];
    }
}

- (void)keyboardDidHide: (NSNotification *) notif{
    // Do something here
    if (isRaised) {
        isRaised = NO;
        [UIView animateWithDuration:0.2 animations:^{
            scroller.frame = originalFrame;
            [self.view layoutSubviews];
        }];
    }
}


- (void)dismissKeyboardCustom{
    [name resignFirstResponder];
    [zipcode resignFirstResponder];
    [email resignFirstResponder];
}

- (UIView*)getConfirm{
    UITapGestureRecognizer* taptap = [[UITapGestureRecognizer alloc] init];
    [taptap addTarget:self action:@selector(lefin)];
    UIView* confirm = [[UIView alloc] init];
    [confirm setBackgroundColor:[UIColor whiteColor]];
    [confirm setFrame:CGRectMake(0, 0, 120, 120)];
    [confirm addGestureRecognizer:taptap];
    UIImageView* checkMark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check.png"]];
    checkMark.translatesAutoresizingMaskIntoConstraints = NO;
    [confirm addSubview:checkMark];
    UILabel* success = [UILabel new];
    success.translatesAutoresizingMaskIntoConstraints = NO;
    [success setText:@"Success"];
    [confirm addSubview:success];
    [confirm addCompactConstraints:@[
                                     @"check.height = 60",
                                     @"check.width = 60",
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
    
    return confirm;
}


- (void)uploadDisBitch{
    if (![name.text isEqualToString:@""] && ![email.text isEqualToString:@""] && ![zipcode.text isEqualToString:@""]) {
        PFObject *signature = [PFObject objectWithClassName:@"signees"];
        signature[@"name"] = name.text;
        signature[@"email"] = email.text;
        signature[@"zipcode"] = zipcode.text;
        signature[@"locationName"] = @"New York, NY";
        
        signature[@"campaign"] = self.campaign;
        signature[@"campaignID"] = self.campaign.objectId;
        
        
        NSData* data = UIImageJPEGRepresentation(imagepotato, 0.5f);
        PFFile *imageFile = [PFFile fileWithName:[[NSString stringWithFormat:[name text]] stringByAppendingString:@".jpg"] data:data];
        [signature setObject:imageFile forKey:@"picture"];

        [signature saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                NSLog(@"saved!");
                [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (!error) {
                        // The image has now been uploaded to Parse. Associate it with a new object
                    } else {
                        
                    }
                }];
                NSMutableArray* array = self.campaign[@"signees"];
                self.campaign[@"signees"] = [array arrayByAddingObject:signature.objectId];
                
                [self.campaign saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                    if (succeeded) {
                        NSLog(@"yay");
                    } else {
                        [self.campaign saveEventually];
                    }
                }];
                
                popup = [KLCPopup popupWithContentView:[self getConfirm] showType:KLCPopupShowTypeGrowIn dismissType:KLCPopupDismissTypeShrinkOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:NO dismissOnContentTouch:NO];
                [popup show];
                
            } else {
                [signature pin];
                [signature saveEventually];
            }
        }];
    }
}

- (void)lefin{
    [popup dismiss:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
