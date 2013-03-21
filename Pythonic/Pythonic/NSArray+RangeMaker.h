//
//  NSArray+rangeMaker.h
//  DuoQuAnalyzer
//
//  Created by Mars Liu on 13-3-18.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RangeMaker)

- (id)initWithRange:(NSRange) range;
- (id)initWithFrom:(NSInteger)from to:(NSInteger)to;
- (id)initWithTo:(NSInteger)to;
- (id)initWithRange:(NSRange) range step:(NSInteger)step;
- (id)initWithFrom:(NSInteger)from to:(NSInteger)to step:(NSInteger)step;
- (id)initWithTo:(NSInteger)to step:(NSInteger)step;

+ (NSArray *)arrayWithRange:(NSRange) range;
+ (NSArray *)arrayWithFrom:(NSInteger)from to:(NSInteger)to;
+ (NSArray *)arrayWithTo:(NSInteger)to;
+ (NSArray *)arrayWithRange:(NSRange) range step:(NSInteger)step;
+ (NSArray *)arrayWithFrom:(NSInteger)from to:(NSInteger)to step:(NSInteger)step;
+ (NSArray *)arrayWithTo:(NSInteger)to step:(NSInteger)step;

@end
