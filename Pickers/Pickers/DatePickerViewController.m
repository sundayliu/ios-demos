//
//  DatePickerViewController.m
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSDate* now = [NSDate date];
    [self.datePicker setDate:now animated:NO];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSDate* selected = [self.datePicker date];
    NSString* msg = [[NSString alloc] initWithFormat:@"The date and time you selected is:%@", selected];
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle:@"Date and Time Selected"
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Yes,I did"
                              otherButtonTitles:nil];
    [alertView show];
}
@end
