//
//  HeaderCell.m
//  DialogViewer
//
//  Created by JUN LIU on 2/10/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.label.backgroundColor = [UIColor yellowColor];
        self.label.textColor = [UIColor blackColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (UIFont*) defaultFont{
    return [UIFont boldSystemFontOfSize:17];
}

@end
