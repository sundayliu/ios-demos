//
//  BlueViewController.m
//  View Switcher
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)blueButtonPressed:(UIButton *)sender {
     UIAlertView* alertView = [[UIAlertView alloc]
                               initWithTitle:@"Blue View Button Pressed"
                               message:@"You pressed the button on the blue view"
                               delegate:nil
                               cancelButtonTitle:@"Yep,I did"
                               otherButtonTitles:nil];
    [alertView show];
}
@end
