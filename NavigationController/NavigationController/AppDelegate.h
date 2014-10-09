//
//  AppDelegate.h
//  NavigationController
//
//  Created by JUN LIU on 8/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) RootViewController* rootViewController;

@end
