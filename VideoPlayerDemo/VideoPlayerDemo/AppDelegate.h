//
//  AppDelegate.h
//  VideoPlayerDemo
//
//  Created by JUN LIU on 9/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class LoadingViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) LoadingViewController* loadingViewController;
@property (strong, nonatomic) UITabBarController* mainTabBarController;

- (void) loadRootView;

@end
