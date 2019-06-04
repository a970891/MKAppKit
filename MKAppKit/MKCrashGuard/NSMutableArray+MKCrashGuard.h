/**
 *
 * Created by https://github.com/mythkiven/ on 19/05/29.
 * Copyright © 2019年 mythkiven. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MKCrashGuardProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (MKCrashGuard)<MKCrashGuardProtocol>

/** 防护：
 *
 *  - (id)objectAtIndex:(NSUInteger)index
 *  - (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
 *  - (void)removeObjectAtIndex:(NSUInteger)index
 *  - (void)insertObject:(id)anObject atIndex:(NSUInteger)index
 *  - (void)getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
 */

@end

NS_ASSUME_NONNULL_END

