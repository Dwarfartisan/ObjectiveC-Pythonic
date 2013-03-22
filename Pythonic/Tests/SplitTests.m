//
//  SplitTests.m
//  Pythonic
//
//  Created by Mars Liu on 13-3-22.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "SplitTests.h"
#import "NSArray+Split.h"
#import "NSArray+RangeMaker.h"

@implementation SplitTests

-(void) testSplitFrom {
    NSArray *array = [[NSArray alloc] initWithTo:10];
    NSArray *new_array = [array arrayWithFrom:5];
    NSInteger l = 5;
    NSInteger count = new_array.count;
    GHAssertEquals(l, count, @"There should has %ld items but %ld", l, count);
    for (NSInteger idx=0; idx<new_array.count; idx++) {
        NSInteger value = [[new_array objectAtIndex:idx] integerValue];
        NSInteger n = idx+5;
        GHAssertEquals(value, n, @"value should be %ld but %ld", n, value);
    }
}

-(void) testSplitTo {
    NSArray *array = [[NSArray alloc] initWithTo:10];
    NSArray *new_array = [array arrayWithTo:5];
    NSInteger l = 5;
    NSInteger count = new_array.count;
    GHAssertEquals(l, count, @"There should has %ld items but %ld", l, count);
    for (NSInteger idx=0; idx<new_array.count; idx++) {
        NSInteger value = [[new_array objectAtIndex:idx] integerValue];
        NSInteger n = idx;
        GHAssertEquals(value, n, @"value should be %ld but %ld", n, value);
    }
}

-(void) testSplitFromTo {
    NSArray *array = [[NSArray alloc] initWithTo:10];
    NSArray *new_array = [array arrayWithFrom:2 to:7];
    NSInteger l = 5;
    NSInteger count = new_array.count;
    GHAssertEquals(l, count, @"There should has %ld items but %ld", l, count);
    for (NSInteger idx=0; idx<5; idx++) {
        NSInteger value = [[new_array objectAtIndex:idx] integerValue];
        NSInteger n = idx+2;
        GHAssertEquals(value, n, @"value should be %ld but %ld", n, value);
    }
}

-(void) testSplitFromToReverse {
    NSArray *array = [[NSArray alloc] initWithTo:10];
    NSArray *new_array = [array arrayWithFrom:7 to:2];
    NSInteger l = 5;
    NSInteger count = new_array.count;
    GHAssertEquals(l, count, @"There should has %ld items but %ld", l, count);
    for (NSInteger idx=0; idx<5; idx++) {
        NSInteger value = [[new_array objectAtIndex:idx] integerValue];
        NSInteger n = 7-idx;
        GHAssertEquals(value, n, @"value should be %ld but %ld", n, value);
    }
}

@end
