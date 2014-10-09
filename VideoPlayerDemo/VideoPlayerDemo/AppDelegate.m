//
//  AppDelegate.m
//  VideoPlayerDemo
//
//  Created by JUN LIU on 9/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "AppDelegate.h"
#import "LoadingViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//    LoadingViewController* loadingViewController = [[LoadingViewController alloc] initWithNibName:@"LoadingViewController" bundle:nil];
//    self.window.rootViewController = loadingViewController;
    [self loadRootView];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) loadRootView{
    FirstViewController* firstViewController = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    UINavigationController* firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    //firstNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    firstNavigationController.tabBarItem.title = @"书架";
    firstNavigationController.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]];
    
    SecondViewController* twoViewController = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    UINavigationController* twoNavigationController = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    //twoNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    twoNavigationController.tabBarItem.title = @"书城";
    twoNavigationController.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"]];
    
    ThreeViewController* threeViewController = [[ThreeViewController alloc]init];
    UINavigationController* threeNavigationController = [[UINavigationController alloc] initWithRootViewController:threeViewController];
    //threeNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    threeNavigationController.tabBarItem.title = @"种子";
    threeNavigationController.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]];
    
    FourViewController* fourViewController = [[FourViewController alloc]initWithNibName:@"FourViewController" bundle:nil];
    UINavigationController* fourNavigationController = [[UINavigationController alloc] initWithRootViewController:fourViewController];
    //fourNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    fourNavigationController.tabBarItem.title = @"游戏";
    fourNavigationController.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4" ofType:@"png"]];
    
    FiveViewController* fiveViewController = [[FiveViewController alloc]initWithNibName:@"FiveViewController" bundle:nil];
    UINavigationController* fiveNavigationController = [[UINavigationController alloc] initWithRootViewController:fiveViewController];
    //fiveNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    fiveNavigationController.tabBarItem.title = @"我";
    fiveNavigationController.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5" ofType:@"png"]];
    
    self.mainTabBarController = [[UITabBarController alloc] init];
    self.mainTabBarController.viewControllers = [NSArray arrayWithObjects:firstNavigationController,
                                                 twoNavigationController,
                                                 threeNavigationController,
                                                 fourNavigationController,
                                                 fiveNavigationController,
                                                 nil];
    self.window.rootViewController = self.mainTabBarController;
    
    //[self.window bringSubviewToFront:self.]
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1];
//    
//    LoadingViewController* loadingViewController = (LoadingViewController*)self.window.rootViewController;
//    loadingViewController.view.alpha = 0;
//    self.window.rootViewController = self.mainTabBarController;
//    
//    [UIView commitAnimations];
}


@end
