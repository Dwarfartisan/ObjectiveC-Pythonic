//
//  NSArray+Trim.m
//  DuoQuAnalyzer
//
//  Created by Mars Liu on 13-3-19.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "NSArray+Trim.h"

#define kEmptyItems @[@0,@"",@NO]

@implementation NSArray (Trim)

- (NSArray *) arrayByLTrim {
    NSMutableArray *ret = [[[NSMutableArray alloc] initWithArray:self] autorelease];
    for (id item in self) {
        if ([kEmptyItems indexOfObject:item]!=NSNotFound) {
            [ret removeObjectAtIndex:0];
        } else {
            break;
        }
    }
    return ret;
}

- (NSArray *) arrayByRTrim {
    NSMutableArray *ret = [[[NSMutableArray alloc] initWithArray:self] autorelease];
    for (id item in [self reverseObjectEnumerator]) {
        if ([kEmptyItems indexOfObject:item]!=NSNotFound) {
            [ret removeLastObject];
        } else {
            break;
        }
    }
    return ret;
}

- (NSArray *) arrayByTrim {
    return [[self arrayByLTrim] arrayByRTrim];
}
@end
