//
//  President.m
//  Navigation Bar
//
//  Created by JUN LIU on 30/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "President.h"

static NSString* const kPresidentNumberKey = @"President";
static NSString* const kPresidentNameKey = @"Name";
static NSString* const kPresidentFromKey = @"FromYear";
static NSString* const kPresidentToKey = @"ToYear";
static NSString* const kPresidentPartyKey = @"Party";

@implementation BIDPresident

#pragma mark - NSCoding
- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.number forKey:kPresidentNumberKey];
    [aCoder encodeObject:self.name forKey:kPresidentNameKey];
    [aCoder encodeObject:self.fromYear forKey:kPresidentFromKey];
    [aCoder encodeObject:self.toYear forKey:kPresidentToKey];
    [aCoder encodeObject:self.party forKey:kPresidentPartyKey];
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]){
        self.number = [aDecoder decodeIntForKey:kPresidentNumberKey];
        self.name = [aDecoder decodeObjectForKey:kPresidentNameKey];
        self.fromYear = [aDecoder decodeObjectForKey:kPresidentFromKey];
        self.toYear = [aDecoder decodeObjectForKey:kPresidentToKey];
        self.party = [aDecoder decodeObjectForKey:kPresidentPartyKey];
        
    }
    return self;
}
#pragma mark - NSCopying

- (id) copyWithZone:(NSZone *)zone{
    BIDPresident* copy = [[BIDPresident alloc] init];
    copy.number = self.number;
    copy.name = self.name;
    copy.fromYear = self.fromYear;
    copy.toYear = self.toYear;
    copy.party = self.party;
    return copy;
}

@end
