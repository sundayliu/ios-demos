//
//  DependentPickerViewController.m
//  Pickers
//
//  Created by JUN LIU on 28/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "DependentPickerViewController.h"

@interface DependentPickerViewController ()

@end

@implementation DependentPickerViewController

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
    NSBundle* bundle = [NSBundle mainBundle];
    NSURL* plistURL = [bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    self.stateZips = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray* allStates = [self.stateZips allKeys];
    NSArray* sortedStates = [allStates sortedArrayUsingSelector:@selector(compare:)];
    self.states = sortedStates;
    NSString* selectedState = self.states[0];
    self.zips = self.stateZips[selectedState];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (IBAction)buttonPressed:(UIButton *)sender {
    NSInteger stateRow = [self.dependentPicker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [self.dependentPicker selectedRowInComponent:kZipComponent];
    
    NSString* state = self.states[stateRow];
    NSString* zip = self.zips[zipRow];
    
    NSString* title = [[NSString alloc] initWithFormat:@"You selected zip code %@.", zip];
    NSString* msg = [[NSString alloc] initWithFormat:@"%@ is in %@.",zip,state];
    
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

#pragma mark -
#pragma mark Pickers Data Source Methods
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == kStateComponent){
        return [self.states count];
    }
    else{
        return [self.zips count];
    }
}
#pragma mark Pickers Delegate Methods
- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == kStateComponent){
        return self.states[row];
    }
    else{
        return self.zips[row];
    }
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == kStateComponent){
        NSString* selectedState = self.states[row];
        self.zips = self.stateZips[selectedState];
        [self.dependentPicker reloadComponent:kZipComponent];
        [self.dependentPicker selectRow:0 inComponent:kZipComponent animated:YES];
    }
}

- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == kStateComponent){
        return 200;
    }
    else{
        return 90;
    }
}
@end
