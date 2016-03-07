//
//  HIGCDSemaphore.m
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import "HIGCDSemaphore.h"

@interface HIGCDSemaphore ()

@property (nonatomic, strong, readwrite) dispatch_semaphore_t dispatchSemaphore;

@end

@implementation HIGCDSemaphore

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.dispatchSemaphore = dispatch_semaphore_create(0);
    }
    
    return self;
}

- (instancetype)initWithValue:(long)value
{
    self = [super init];
    
    if (self) {
        self.dispatchSemaphore = dispatch_semaphore_create(value);
    }
    
    return self;
}

- (BOOL)signal
{
    return dispatch_semaphore_signal(self.dispatchSemaphore) != 0;
}

- (void)wait
{
    dispatch_semaphore_wait(self.dispatchSemaphore, DISPATCH_TIME_FOREVER);
}

- (BOOL)wait:(int64_t)delta
{
    return dispatch_semaphore_wait(self.dispatchSemaphore, dispatch_time(DISPATCH_TIME_NOW, delta)) == 0;
}

@end
