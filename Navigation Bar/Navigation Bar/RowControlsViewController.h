//
//  RowControlsViewController.h
//  Navigation Bar
//
//  Created by JUN LIU on 30/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "SecondLevelViewController.h"

@interface RowControlsViewController : SecondLevelViewController

@property(copy, nonatomic) NSArray* characters;

- (IBAction)tappedButton:(UIButton*)sender;

@end
