//
//  ViewController.h
//  Simple Table
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray* dwarves;

@end
