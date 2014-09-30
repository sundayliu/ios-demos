//
//  PresidentsViewController.h
//  Navigation Bar
//
//  Created by JUN LIU on 30/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "SecondLevelViewController.h"
#import "PresidentDetailViewController.h"

@interface PresidentsViewController : SecondLevelViewController<PresidentDetailViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray* presidents;

@end
