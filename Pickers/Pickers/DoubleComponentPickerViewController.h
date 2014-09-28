//
//  DoubleComponentPickerViewController.h
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentPickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView* doublePicker;
@property (strong, nonatomic) NSArray* fillingTypes;
@property (strong, nonatomic) NSArray* breadTypes;

- (IBAction)buttonPressed;



@end
