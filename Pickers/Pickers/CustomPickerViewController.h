//
//  CustomPickerViewController.h
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPickerViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong,nonatomic) NSArray* images;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonSpin;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

- (IBAction)spin:(UIButton *)sender;
@end
