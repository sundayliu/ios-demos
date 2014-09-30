//
//  DisclosureButtonViewController.h
//  Navigation Bar
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "SecondLevelViewController.h"

@class DisclosureDetailViewController;

@interface DisclosureButtonViewController : SecondLevelViewController

@property (strong, nonatomic) DisclosureDetailViewController* disclosureDetailViewController;
@property (copy, nonatomic) NSArray* movies;

@end
