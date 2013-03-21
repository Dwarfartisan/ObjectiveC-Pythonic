//
//  NSArray+Random.h
//  DuoQuAnalyzer
//
//  Created by Mars Liu on 13-3-20.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Random)

- (id) choice;
- (NSArray *) choiceWith:(NSUInteger)count;

@end
