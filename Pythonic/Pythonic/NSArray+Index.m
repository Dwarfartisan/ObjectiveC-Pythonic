//
//  NSArray+Index.m
//  Pythonic
//
//  Created by Mars Liu on 13-3-22.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "NSArray+Index.h"

@implementation NSArray (Index)

// convert negative index to index like python split
- (NSInteger)normaric:(NSInteger)index {
    if (labs(index) > self.count) {
        NSException *exp = [NSException exceptionWithName:@"IndexOutRange"
                                                   reason:@"value out array range"
                                                 userInfo:Nil];
        @throw exp;
    }
    if (index < 0) {
        return self.count + index;
    } else {
        return index;
    }
}

- (id) objectAtXIndex:(NSInteger) index {
    return [self objectAtIndex:[self normaric:index]];
}

@end
