//
//  ViewController.m
//  Camera
//
//  Created by JUN LIU on 1/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface ViewController ()

@property(strong, nonatomic) MPMoviePlayerController* moviePlayerController;
@property(strong, nonatomic) UIImage* image;
@property(strong, nonatomic) NSURL* movieURL;

@property(copy, nonatomic) NSString* lastChosenMediaType;

@end

@implementation ViewController

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
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.takePictureButton.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateDisplay];
}

- (void) updateDisplay{
    if ([self.lastChosenMediaType isEqualToString:(NSString*)kUTTypeImage]){
        self.imageView.image = self.image;
        self.imageView.hidden = NO;
        self.moviePlayerController.view.hidden = YES;
    }
    else if ([self.lastChosenMediaType isEqualToString:(NSString*)kUTTypeMovie]){
        [self.moviePlayerController.view removeFromSuperview];
        self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:self.movieURL];
        [self.moviePlayerController play];
        UIView* movieView = self.moviePlayerController.view;
        movieView.frame = self.imageView.frame;
        movieView.clipsToBounds = YES;
        [self.view addSubview:movieView];
        self.imageView.hidden = YES;
    }
}

- (void) pickMediaFromSource:(UIImagePickerControllerSourceType)sourceType{
    NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] && [mediaTypes count] > 0){
        NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else{
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error accessing media"
                                                        message:@"Device doesn't support that media source"
                                                       delegate:nil
                                              cancelButtonTitle:@"Drat!"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (UIImage*) shrinkImage:(UIImage*)original toSize:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [original drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* final = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return final;
}
- (IBAction)shootPictureOrVideo:(UIButton *)sender {
    [self pickMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)selectExistingPictureOrVideo:(UIButton *)sender {
    [self pickMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark - Image Picker Controller delegate methods
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    self.lastChosenMediaType = info[UIImagePickerControllerMediaType];
    if ([self.lastChosenMediaType isEqualToString:(NSString*)kUTTypeImage]){
        UIImage* chosenImage = info[UIImagePickerControllerEditedImage];
        UIImage* shrunkenImage = [self shrinkImage:chosenImage toSize:self.imageView.bounds.size];
        self.image = shrunkenImage;
    }
    else if ([self.lastChosenMediaType isEqualToString:(NSString*)kUTTypeMovie]){
        self.movieURL = info[UIImagePickerControllerMediaURL];
    }
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
