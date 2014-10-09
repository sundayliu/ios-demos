//
//  LoadingViewController.m
//  VideoPlayerDemo
//
//  Created by JUN LIU on 9/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "LoadingViewController.h"

#import "AppDelegate.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

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
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,20,320,460)];
    backgroundImageView.backgroundColor = [UIColor clearColor];
    backgroundImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loading" ofType:@".png"] ];
    [self.view addSubview:backgroundImageView];
    
    self->activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 400, 20, 20)];
    self->activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    self->activityIndicatorView.hidesWhenStopped = YES;
    [self->activityIndicatorView startAnimating];
    
    [self.view addSubview:self->activityIndicatorView];
    
    [self performSelector:@selector(loadingDone) withObject:nil afterDelay:2]; // 2 seconds;
    
    
}

- (void) loadingDone{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [(AppDelegate*)[UIApplication sharedApplication].delegate loadRootView];
    [self->activityIndicatorView stopAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
