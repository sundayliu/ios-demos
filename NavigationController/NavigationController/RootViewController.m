//
//  RootViewController.m
//  NavigationController
//
//  Created by JUN LIU on 8/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    UIBarButtonItem* left = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                             target:self
                             action:@selector(selectLeftButton:)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem* right = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                              target:self
                              action:@selector(selectRightButton:)];
    self.navigationItem.rightBarButtonItem = right;
    
    UIBarButtonItem* back = [[UIBarButtonItem alloc]
                             initWithTitle:@"Home" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;
    NSArray* arraySegmented = @[@"One",@"Two",@"Three"];
    UISegmentedControl* segmentedController = [[UISegmentedControl alloc] initWithItems:arraySegmented];
    segmentedController.segmentedControlStyle = UISegmentedControlSegmentCenter;
    [segmentedController addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedController;
    
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    UIBarButtonItem* one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem* two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem* three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIBarButtonItem* four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem* flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self setToolbarItems:[NSArray arrayWithObjects:flex,one,flex,two,flex,three,flex,four,flex, nil]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) selectLeftButton:(id)sender{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                    message:@"You select left button"
                                                   delegate:nil
                                          cancelButtonTitle:@"Done"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void) selectRightButton:(id)sender{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                    message:@"You select right button"
                                                   delegate:nil
                                          cancelButtonTitle:@"Done"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void) segmentAction:(UISegmentedControl*)sender{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            
            break;
            
        default:
            break;
    }
}

- (IBAction)gotoSecondView:(UIButton *)sender {
    SecondViewController* viewController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.title = @"Second View";
}
@end
