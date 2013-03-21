//
//  NSArray+Random.m
//  DuoQuAnalyzer
//
//  Created by Mars Liu on 13-3-20.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id) choice {
    NSUInteger idx = arc4random()%self.count;
    return [self objectAtIndex:idx];
}

- (NSArray *) choiceWith:(NSUInteger)count {
    NSUInteger _count = MIN(count, self.count);
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    for (NSUInteger i=0; i< self.count - _count; i++) {
        NSUInteger idx = arc4random()%array.count;
        [array removeObjectAtIndex:idx];
    }
    return array;
}

@end
