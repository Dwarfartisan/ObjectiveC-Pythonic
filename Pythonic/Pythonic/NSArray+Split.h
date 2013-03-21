//
//  NSArray+Split.h
//  Cute Notify
//
//  Created by Mars Liu on 13-3-16.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Split)

- (NSArray *) arrayWithRange:(NSRange) range;
- (NSArray *) arrayWithFrom:(NSInteger)from to:(NSInteger)to;
- (NSArray *) arrayWithFrom:(NSInteger)from;
- (NSArray *) arrayWithTo:(NSInteger)to;
- (NSArray *) arrayWithRange:(NSRange) range step:(NSInteger) step;
- (NSArray *) arrayWithFrom:(NSInteger)from to:(NSInteger)to step:(NSInteger) step;
- (NSArray *) arrayWithFrom:(NSInteger)from step:(NSInteger) step;
- (NSArray *) arrayWithTo:(NSInteger)to step:(NSInteger) step;

@end
