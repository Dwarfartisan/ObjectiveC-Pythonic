//
//  NSArray+Split.m
//  Cute Notify
//
//  Created by Mars Liu on 13-3-16.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "NSArray+Split.h"
#import "CodeStickets.h"
#import "NSArray+Index.h"

@interface NSArray (Private)

@end

@implementation NSArray (Split)

- (NSArray *) arrayWithRange:(NSRange) range {
    return [self arrayWithFrom:range.location to:range.location+range.length];
}

- (NSArray *) arrayWithFrom:(NSInteger)from to:(NSInteger)to {
    NSInteger _from = [self normaric:from];
    NSInteger _to = [self normaric:to];
    if (_from == _to) {
        return @[];
    }
    NSInteger step = (_to>_from)?1:-1;
    return [self arrayWithFrom:_from to:_to step:step];
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
    NSInteger _from = [self normaric:from];
    NSInteger _to = [self normaric:to];
    if (_from == _to) {
        return @[];
    }
    NSInteger length = labs(_to - _from);
    NSMutableArray *ret = [[[NSMutableArray alloc] initWithCapacity:length] autorelease];
    void (^next)(NSInteger* idx) = ^(NSInteger* idx){(*idx)+=step;};
    InRange inRange = MakeInRangeChecker(from, to);
    
    for (NSInteger i=_from; inRange(i); next(&i)) {
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
