//
//  President.h
//  Navigation Bar
//
//  Created by JUN LIU on 30/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDPresident : NSObject<NSCoding,NSCopying>

@property (assign, nonatomic) NSInteger number;
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* fromYear;
@property (copy, nonatomic) NSString* toYear;
@property (copy, nonatomic) NSString* party;

@end
