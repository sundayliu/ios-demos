//
//  DependentPickerViewController.h
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStateComponent 0
#define kZipComponent 1

@interface DependentPickerViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) NSDictionary* stateZips;
@property (strong, nonatomic) NSArray* states;
@property (strong, nonatomic) NSArray* zips;
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;

@end
