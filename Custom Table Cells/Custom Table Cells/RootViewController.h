//
//  RootViewController.h
//  Custom Table Cells
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSArray* computers;

@end
