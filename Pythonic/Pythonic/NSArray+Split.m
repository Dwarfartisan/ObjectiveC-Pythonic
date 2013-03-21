//
//  NSArray+Split.m
//  Cute Notify
//
//  Created by Mars Liu on 13-3-16.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "NSArray+Split.h"

@implementation NSArray (Split)

- (NSArray *) arrayWithRange:(NSRange) range {
    return [self arrayWithFrom:range.location to:range.location+range.length];
}

- (NSArray *) arrayWithFrom:(NSInteger)from to:(NSInteger)to {
    NSInteger length = to - from;
    NSMutableArray *ret = [[[NSMutableArray alloc] initWithCapacity:length] autorelease];
    for (NSInteger i=from; i < MIN(to, [self count]); i++) {
        [ret addObject:[self objectAtIndex:i]];
    }
    return ret;
}

- (NSArray *) arrayWithFrom:(NSInteger)from {
    return [self arrayWithFrom:from to:[self count]];
}

- (NSArray *) arrayWithTo:(NSInteger)to {
    return [self arrayWithFrom:0 to:to];
}

- (NSArray *) arrayWithRange:(NSRange) range step:(NSInteger) step {
    return [self arrayWithFrom:range.location to:range.location+range.length step:step];
}

- (NSArray *) arrayWithFrom:(NSInteger)from to:(NSInteger)to step:(NSInteger) step {
    NSInteger length = to - from;
    NSMutableArray *ret = [[[NSMutableArray alloc] initWithCapacity:length] autorelease];
    for (NSInteger i=from; i < MIN(length, [self count]); i+=step) {
        [ret addObject:[self objectAtIndex:i]];
    }
    return ret;
}

- (NSArray *) arrayWithFrom:(NSInteger)from step:(NSInteger) step {
    return [self arrayWithFrom:from to:[self count] step:step];
}

- (NSArray *) arrayWithTo:(NSInteger)to step:(NSInteger) step {
    return [self arrayWithFrom:0 to:to step:step];
}

@end
