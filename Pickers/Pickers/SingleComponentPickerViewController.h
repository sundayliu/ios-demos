//
//  SingleComponentPickerViewController.h
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleComponentPickerViewController : UIViewController
    <UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView* singlePicker;
@property (strong, nonatomic) NSArray* characterNames;

- (IBAction)buttonPressed;


@end
