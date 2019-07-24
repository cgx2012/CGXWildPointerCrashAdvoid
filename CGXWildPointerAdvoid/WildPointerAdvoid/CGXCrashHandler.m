//
//  CrashHandler.m
//  CGXWildPointerAdvoid
//
//  Created by 陈桂鑫 on 2019/7/24.
//  Copyright © 2019 ZY. All rights reserved.
//

#import "CGXCrashHandler.h"
#include <execinfo.h>
const NSInteger UncaughtExceptionHandlerSkipAddressCount = 6;
const NSInteger UncaughtExceptionHandlerReportAddressCount = 5;

@implementation CGXCrashHandler

+ (void)reportCrashInfoClass:(Class)crashCrash SEL:(SEL)method {
    NSLog(@"%@",[NSString stringWithFormat:@"(-[%@ %@]) was sent to a zombie object at address: %p", NSStringFromClass(crashCrash), NSStringFromSelector(method), self]);
    NSLog(@"%@",[self backtrace]);
}

+ (NSArray *)backtrace
{
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, frames);
    
    int i;
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for (
         i = UncaughtExceptionHandlerSkipAddressCount;
         i < UncaughtExceptionHandlerSkipAddressCount +
         UncaughtExceptionHandlerReportAddressCount;
         i++)
    {
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
    
    return backtrace;
}

@end
