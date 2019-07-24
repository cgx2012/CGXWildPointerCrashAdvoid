//
//  WPCZombieObject.m
//  WildPointerCheckerDemo
//
//  Created by RenTongtong on 16/8/26.
//  Copyright © 2016年 hdurtt. All rights reserved.
//

#import "WPCZombieObject.h"
#import <objc/runtime.h>
#import "CGXCrashHandler.h"

@implementation WPCZombieObject
- (BOOL)respondsToSelector: (SEL)aSelector
{
    return [self.originClass instancesRespondToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector: (SEL)sel
{
    return [self.originClass instanceMethodSignatureForSelector:sel];
}

- (void)forwardInvocation: (NSInvocation *)invocation
{
    [self _throwMessageSentExceptionWithSelector: invocation.selector];
}


#define MOAZombieThrowMesssageSentException() [self _throwMessageSentExceptionWithSelector: _cmd]
- (Class)class
{
    MOAZombieThrowMesssageSentException();
    return nil;
}

- (BOOL)isEqual:(id)object
{
    MOAZombieThrowMesssageSentException();
    return NO;
}

- (NSUInteger)hash
{
    MOAZombieThrowMesssageSentException();
    return 0;
}

- (id)self
{
    MOAZombieThrowMesssageSentException();
    return nil;
}

- (BOOL)isKindOfClass:(Class)aClass
{
    MOAZombieThrowMesssageSentException();
    return NO;
}

- (BOOL)isMemberOfClass:(Class)aClass
{
    MOAZombieThrowMesssageSentException();
    return NO;
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    MOAZombieThrowMesssageSentException();
    return NO;
}

- (BOOL)isProxy
{
    MOAZombieThrowMesssageSentException();
    
    return NO;
}

- (id)retain
{
    MOAZombieThrowMesssageSentException();
    return nil;
}

- (oneway void)release
{
    MOAZombieThrowMesssageSentException();
}

- (id)autorelease
{
    MOAZombieThrowMesssageSentException();
    return nil;
}

- (void)dealloc
{
    MOAZombieThrowMesssageSentException();
    [super dealloc];
}

- (NSUInteger)retainCount
{
    MOAZombieThrowMesssageSentException();
    return 0;
}

- (NSZone *)zone
{
    MOAZombieThrowMesssageSentException();
    return nil;
}

- (NSString *)description
{
    MOAZombieThrowMesssageSentException();
    return nil;
}


#pragma mark - Private
- (void)_throwMessageSentExceptionWithSelector: (SEL)selector
{
    [CGXCrashHandler reportCrashInfoClass:self.originClass SEL:selector];
//    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"(-[%@ %@]) was sent to a zombie object at address: %p", NSStringFromClass(self.originClass), NSStringFromSelector(selector), self] userInfo:nil];
}

@end
