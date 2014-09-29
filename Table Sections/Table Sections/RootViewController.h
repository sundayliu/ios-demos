//
//  RootViewController.h
//  Table Sections
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate>

@property (copy, nonatomic) NSDictionary* names;
@property (copy, nonatomic) NSArray* keys;

@end
