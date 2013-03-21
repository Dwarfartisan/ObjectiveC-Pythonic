//
//  NSArray+Split.m
//  Cute Notify
//
//  Created by Mars Liu on 13-3-16.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "NSArray+Split.h"

typedef BOOL (^InRange)(NSInteger);

@interface NSArray (Private)

- (NSInteger) normaric:(NSInteger) index;
- (InRange) inRangeFrom:(NSInteger)from to:(NSInteger)to;

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
    InRange inRange = [self inRangeFrom:_from to:_to];
    
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

// convert negative index to index like python split
- (NSInteger)normaric:(NSInteger)index {
    if (labs(index) > self.count -1) {
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

- (InRange)inRangeFrom:(NSInteger)from to:(NSInteger)to {
    NSInteger low = MIN(from, to);
    NSInteger top = MAX(from, to);
    InRange ret = ^(NSInteger index){return (BOOL)((low<=index)&&(index<top));};
    return ret;
}

@end
