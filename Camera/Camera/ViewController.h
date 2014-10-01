//
//  ViewController.h
//  Camera
//
//  Created by JUN LIU on 1/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *takePictureButton;
- (IBAction)shootPictureOrVideo:(UIButton *)sender;
- (IBAction)selectExistingPictureOrVideo:(UIButton *)sender;

@end
