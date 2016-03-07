//
//  HIGCDTimer.m
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import "HIGCDTimer.h"
#import "HIGCDQueue.h"

@interface HIGCDTimer ()

@property (nonatomic, strong, readwrite) dispatch_source_t dispatchSource;

@end

@implementation HIGCDTimer

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    }
    
    return self;
}

- (instancetype)initInQueue:(HIGCDQueue *)queue
{
    self = [super init];
    
    if (self) {
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue.dispatchQueue);
    }
    
    return self;
}

- (void)event:(dispatch_block_t)block timeInterval:(uint64_t)interval
{
    NSParameterAssert(block);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
    dispatch_source_set_event_handler(self.dispatchSource, block);
}

- (void)event:(dispatch_block_t)block timeInterval:(uint64_t)interval delay:(uint64_t)delay
{
    NSParameterAssert(block);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, delay), interval, 0);
    dispatch_source_set_event_handler(self.dispatchSource, block);
}

- (void)event:(dispatch_block_t)block timeIntervalWithSeconds:(float)seconds
{
    NSParameterAssert(block);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), NSEC_PER_SEC * seconds, 0);
    dispatch_source_set_event_handler(self.dispatchSource, block);
}

- (void)event:(dispatch_block_t)block timeIntervalWithSeconds:(float)seconds delaySeconds:(float)delaySeconds
{
    NSParameterAssert(block);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * delaySeconds), NSEC_PER_SEC * seconds, 0);
    dispatch_source_set_event_handler(self.dispatchSource, block);
}

- (void)start
{
    dispatch_resume(self.dispatchSource);
}

- (void)destroy
{
    dispatch_source_cancel(self.dispatchSource);
}

@end
