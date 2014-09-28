//
//  ViewController.h
//  View Switcher
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlueViewController;
@class YellowViewController;

@interface ViewController : UIViewController

@property (strong, nonatomic) BlueViewController* blueViewController;
@property (strong, nonatomic) YellowViewController* yellowViewController;

- (IBAction)switchViews:(id)sender;

@end
