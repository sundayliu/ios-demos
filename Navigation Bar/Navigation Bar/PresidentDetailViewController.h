//
//  PresidentDetailViewController.h
//  Navigation Bar
//
//  Created by JUN LIU on 30/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDPresident;
@protocol PresidentDetailViewControllerDelegate;

@interface PresidentDetailViewController : UITableViewController<UITextFieldDelegate>

@property (copy, nonatomic) BIDPresident* president;
@property (weak, nonatomic) id<PresidentDetailViewControllerDelegate> delegate;
@property (assign, nonatomic) NSInteger row;

@property (strong, nonatomic) NSArray* fieldLabels;

- (IBAction) cancel:(id)sender;
- (IBAction) save:(id)sender;
- (IBAction) textFieldDone:(id)sender;

@end

@protocol PresidentDetailViewControllerDelegate <NSObject>

- (void) presidentDetailViewController:(PresidentDetailViewController*)controller
                    didUpdatePresident:(BIDPresident*)president;

@end
