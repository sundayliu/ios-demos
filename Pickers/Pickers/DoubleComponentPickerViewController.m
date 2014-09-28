//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

@interface DoubleComponentPickerViewController ()

@end

@implementation DoubleComponentPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter",
                          @"Tuna Salad", @"Chicken Salad", @"Roast Beef", @"Vegemite"];
    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye",
                        @"Sourdough", @"Seven Grain"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonPressed{
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadComponent];
    
    NSString* filling = self.fillingTypes[fillingRow];
    NSString* bread = self.breadTypes[breadRow];
    
    NSString* msg = [[NSString alloc] initWithFormat:@"Your %@ on %@ bread will be right up.",filling,bread];
    
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle:@"Thank you for your order"
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Greate!"
                              otherButtonTitles:nil];
    [alertView show];
}

#pragma mark -
#pragma mark Picker View Data Source Methods
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == kFillingComponent){
        return [self.fillingTypes count];
    }
    else{
        return [self.breadTypes count];
    }
}
#pragma mark Picker View Delegate Methods

- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == kFillingComponent){
        return self.fillingTypes[row];
    }
    else{
        return self.breadTypes[row];
    }
}

@end
