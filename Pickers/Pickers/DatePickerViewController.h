//
//  DatePickerViewController.h
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)buttonPressed:(UIButton *)sender;

@end
