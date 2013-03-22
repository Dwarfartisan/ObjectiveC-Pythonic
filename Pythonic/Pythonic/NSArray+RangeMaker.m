//
//  NSArray+rangeMaker.m
//  DuoQuAnalyzer
//
//  Created by Mars Liu on 13-3-18.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "NSArray+RangeMaker.h"
#import "CodeStickets.h"

@implementation NSArray (RangeMaker)

- (NSArray *)initWithRange:(NSRange) range {
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:range.length];
    for (NSInteger i=0; i<range.length; i++) {
        [data addObject:[NSNumber numberWithInteger:i+range.location]];
    }
    self = [self initWithArray:data];
    [data release];
    return self;
}

- (NSArray *)initWithFrom:(NSInteger)from to:(NSInteger)to {
    if (from == to) {
        return [self init];
    }
    NSInteger step  = (to>from)?1:-1;
    return [self initWithFrom:from to:to step:step];
}

- (NSArray *)initWithTo:(NSInteger)to {
    self = [self initWithFrom:0 to:to];
    return self;
}

- (NSArray *)initWithRange:(NSRange) range step:(NSInteger)step {
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:range.length];
    for (NSInteger i=0; i<range.length; i+=step) {
        [data addObject:[NSNumber numberWithInteger:i+range.location]];
    }
    self = [self initWithArray:data];
    [data release];
    return self;
}

- (NSArray *)initWithFrom:(NSInteger)from to:(NSInteger)to step:(NSInteger)step {
    if (from==to) {
        return [self init];
    }
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:(to - from)/step];
    InRange inRange = MakeInRangeChecker(from, to);
    for (NSInteger i=from; inRange(i); i+= step) {
        [data addObject:[NSNumber numberWithInteger:i]];
    }
    self = [self initWithArray:data];
    [data release];
    return self;
}

- (NSArray *)initWithTo:(NSInteger)to step:(NSInteger)step {
    self = [self initWithFrom:0 to:to step:step];
    return self;
}

+ (NSArray *)arrayWithRange:(NSRange) range {
    return [[[NSArray alloc] initWithRange:range] autorelease];
}

+ (NSArray *)arrayWithFrom:(NSInteger)from to:(NSInteger)to {
    return [[[NSArray alloc] initWithFrom:from to:to] autorelease];
}

+ (NSArray *)arrayWithTo:(NSInteger)to {
    return [[[NSArray alloc] initWithTo:to] autorelease];
}

+ (NSArray *)arrayWithRange:(NSRange) range step:(NSInteger)step {
    return [[[NSArray alloc] initWithRange:range step:step] autorelease];
}

+ (NSArray *)arrayWithFrom:(NSInteger)from to:(NSInteger)to step:(NSInteger)step {
    return [[[NSArray alloc] initWithFrom:from to:to step:step] autorelease];
}

+ (NSArray *)arrayWithTo:(NSInteger)to step:(NSInteger)step {
    return [[[NSArray alloc] initWithTo:to step:step] autorelease];
}

@end
