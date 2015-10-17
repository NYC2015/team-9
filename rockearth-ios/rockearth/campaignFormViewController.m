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

@end

@implementation campaignFormViewController{
    UITextField* name;
    UITextField* email;
    UITextField* zipcode;
    
    NSArray* checkfields;
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //    [self.view setBackgroundColor:[UIColor colorWithRed:152.0f/255.0f green:200.0f/255.0f blue:99.0f/255.0f alpha:1.0f]];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIBarButtonItem* bye = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonSystemItemCancel target:self action:@selector(done)];
    self.navigationItem.leftBarButtonItem = bye;
    
    
    //    UISwipeGestureRecognizer* tap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(done)];
    ////    [tap setNumberOfTapsRequired:2];
    //    [tap setDirection:UISwipeGestureRecognizerDirectionDown];
    //    [self.view addGestureRecognizer:tap];
    
    UIScrollView* scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, self.view.frame.size.height)];
    [self.view addSubview:scroller];
    
    NSLog(@"%f", scroller.frame.size.height);
    
    [self.navigationItem setTitle:@"Add a Book"];
    
    name = [UITextField new];
    name.translatesAutoresizingMaskIntoConstraints = NO;
    name.backgroundColor = [UIColor whiteColor];
    name.layer.cornerRadius = 10;
    UILabel* nameL = [UILabel new];
    nameL.translatesAutoresizingMaskIntoConstraints = NO;
    [nameL setFont:[UIFont fontWithName:@"Roboto-Medium" size:18]];
    [nameL setTintColor:[UIColor whiteColor]];
    [nameL setTextColor:[UIColor darkGrayColor]];
    nameL.text = @"Name";
    [scroller addSubview:nameL];
    [scroller addSubview:name];
    email = [UITextField new];
    email.translatesAutoresizingMaskIntoConstraints = NO;
    email.backgroundColor = [UIColor whiteColor];
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
    zipcode.translatesAutoresizingMaskIntoConstraints = NO;
    zipcode.backgroundColor = [UIColor whiteColor];
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
                                      @"nlabel.top = self.top + 20",
                                      @"nlabel.left = self.left + 16",
                                      @"alabel.top = name.bottom + ratioDifference",
                                      @"alabel.left = self.left + 16",
                                      @"plabel.top = email.bottom + ratioDifference",
                                      @"plabel.left = self.left + 16",
                                      ]
                            metrics:@{
                                      @"ratioDifference":@(self.view.frame.size.height/32)
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
    [scroller updateConstraints];
    [scroller setContentSize:CGSizeMake(self.view.frame.size.width, 800)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
