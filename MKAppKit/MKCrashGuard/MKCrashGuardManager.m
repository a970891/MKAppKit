/**
 *
 * Created by https://github.com/mythkiven/ on 19/05/29.
 * Copyright © 2019年 mythkiven. All rights reserved.
 *
 */

#import "MKCrashGuardManager.h"






@implementation MKCrashGuardManager


#pragma mark - public

/**
 * 启动 App 守护,守护所有类型的crash
 */
+ (void)executeAppGuard {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ 
        [NSArray crashGuardExchangeMethod];
        [NSMutableArray crashGuardExchangeMethod];
        [NSDictionary crashGuardExchangeMethod];
        [NSMutableDictionary crashGuardExchangeMethod];
        [NSString crashGuardExchangeMethod];
        [NSMutableString crashGuardExchangeMethod];
        [NSAttributedString crashGuardExchangeMethod];
        [NSMutableAttributedString crashGuardExchangeMethod];
        
        [NSObject guardUnrecognizedSelectorCrash];
        [NSTimer guardTimerCrash];
        [NSNotificationCenter guardNotificationCrash];
        [NSObject guardKVOCrash];
        [NSObject guardKVCCrash];
        
        [UINavigationController guardNavigationController];
    });
}
/**
 * 自行配置守护的类型
 */
+ (void)configAppGuard:(MKCrashGuardType)crashGuardType {
    
}


#pragma mark - private

// 类方法的交换
+ (void)exchangeClassMethod:(Class)anClass systemSelector:(SEL)systemSelector swizzledSelector:(SEL)swizzledSelector {
    Method method1 = class_getClassMethod(anClass, systemSelector);
    Method method2 = class_getClassMethod(anClass, swizzledSelector);
    method_exchangeImplementations(method1, method2);
}

// 对象方法的交换
+ (void)exchangeInstanceMethod:(Class)anClass systemSelector:(SEL)systemSelector swizzledSelector:(SEL)swizzledSelector {
    Method originalMethod = class_getInstanceMethod(anClass, systemSelector);
    Method swizzledMethod = class_getInstanceMethod(anClass, swizzledSelector);
    BOOL didAddMethod =
    class_addMethod(anClass,
                    systemSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(anClass,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

 
@end

