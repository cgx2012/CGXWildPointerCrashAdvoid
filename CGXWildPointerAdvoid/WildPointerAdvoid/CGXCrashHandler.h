//
//  CrashHandler.h
//  CGXWildPointerAdvoid
//
//  Created by 陈桂鑫 on 2019/7/24.
//  Copyright © 2019 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGXCrashHandler : NSObject

+ (void)reportCrashInfoClass:(Class)crashCrash SEL:(SEL)method;

+ (NSArray *)backtrace;

@end

NS_ASSUME_NONNULL_END
