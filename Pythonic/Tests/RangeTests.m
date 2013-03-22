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
    NSInteger count = array.count;
    GHAssertEquals((NSInteger)5, count, @"array should has 5 items, but now it is %ld", count);
    for (NSInteger idx=0; idx<5; idx++) {
        NSNumber *value = [array objectAtIndex:idx];
        GHAssertEquals(idx, [value integerValue], @"%ld should equal %@", idx, value);
    }
}

-(void) testRangeFromTo {
    NSArray *array = [[NSArray alloc] initWithFrom:3 to:12];
    NSInteger count = array.count;
    GHAssertEquals((NSInteger)9, count, @"array should has 9 items, but now it is %ld", count);
    for (NSInteger idx=0; idx<9; idx++) {
        NSNumber *value = [array objectAtIndex:idx];
        GHAssertEquals(idx+3, [value integerValue], @"%ld should equal %@", idx, value);
    }
}

-(void) testRangeFromToStep {
    NSArray *array = [[NSArray alloc] initWithFrom:2 to:20 step:2];
    NSInteger count = array.count;
    GHAssertEquals((NSInteger)9, count, @"array should has 9 items, but now it is %ld", count);
    for (NSInteger idx=0; idx<9; idx++) {
        NSNumber *value= [array objectAtIndex:idx];
        NSInteger n = (idx+1)*2;
        GHAssertEquals(n, [value integerValue], @"%ld should equal %@", n, value);
    }
}

-(void) testRange {
    NSRange range = NSMakeRange(0, 11);
    NSArray *array = [[NSArray alloc] initWithRange:range];
    NSInteger count = array.count;
    GHAssertEquals((NSInteger)11, count, @"array should has 11 items, but now it is %ld", count);
    for (NSInteger idx=0; idx<11; idx++) {
        NSNumber *value= [array objectAtIndex:idx];
        GHAssertEquals(idx, [value integerValue], @"%ld should equal %@", idx, value);
    }
}

@end
