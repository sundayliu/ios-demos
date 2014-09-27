//
//  ViewController.m
//  HelloWorld
//
//  Created by JUN LIU on 24/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString* title = [sender titleForState:UIControlStateNormal];
    NSString* plainText = [NSString stringWithFormat:@"%@ button pressed.",title];
    //_statusLabel.text = plainText;
    
    NSMutableAttributedString* styledText = [[NSMutableAttributedString alloc]initWithString:plainText];
    NSDictionary* attributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:_statusLabel.font.pointSize]};
    
    NSRange nameRange = [plainText rangeOfString:title];
    [styledText setAttributes:attributes range:nameRange];
    _statusLabel.attributedText = styledText;
    
}
@end
