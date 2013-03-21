//
//  RangeTests.m
//  Pythonic
//
//  Created by Mars Liu on 13-3-21.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "RangeTests.h"
#import "NSArray+RangeMaker.h"

@implementation RangeTests

-(void) testRangeTo {
    NSArray * array = [[NSArray alloc] initWithTo:5];
    for (NSInteger idx=0; idx<5; idx++) {
        NSNumber *value = [array objectAtIndex:idx];
        GHAssertEquals(idx, [value integerValue], @"%ld should equal %@", idx, value);
    }
}

@end
