//
//  ContentCell.h
//  DialogViewer
//
//  Created by JUN LIU on 2/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UICollectionViewCell

@property(strong, nonatomic) UILabel* label;
@property(copy, nonatomic) NSString* text;

+ (CGSize)sizeForContentString:(NSString*)s;

@end
