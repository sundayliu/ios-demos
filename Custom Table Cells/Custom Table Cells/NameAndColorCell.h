//
//  NameAndColorCell.h
//  Custom Table Cells
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameAndColorCell : UITableViewCell

@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* color;

@property (strong, nonatomic) IBOutlet UILabel* nameValue;
@property (strong, nonatomic) IBOutlet UILabel* colorValue;

@end
