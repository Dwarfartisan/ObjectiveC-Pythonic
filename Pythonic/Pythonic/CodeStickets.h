//
//  CodeStickets.h
//  Pythonic
//
//  Created by Mars Liu on 13-3-22.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#ifndef PYTHONIC_CODESTICKETS_H
#define PYTHONIC_CODESTICKETS_H

#import <Foundation/Foundation.h>

typedef BOOL (^InRange)(NSInteger);

NS_INLINE InRange MakeInRangeChecker(NSInteger from, NSInteger to) {
    InRange ret;
    if (from == to) {
        return ^(NSInteger i){return NO;};
    }
    if (from < to) {
        ret = ^(NSInteger i){return (BOOL)((from<=i)&&(i<to));};
    } else {
        ret =  ^(NSInteger i){return (BOOL)((to<i)&&(i<=from));};
    }
    return ret;
};

#endif