//
//  HIGCDTimer.h
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HIGCDQueue;

@interface HIGCDTimer : NSObject

@property (nonatomic, strong, readonly) dispatch_source_t dispatchSource;

#pragma mark - 初始化
- (instancetype)init;
- (instancetype)initInQueue:(HIGCDQueue *)queue;

#pragma mark - 用法
- (void)event:(dispatch_block_t)block timeInterval:(uint64_t)interval;
- (void)event:(dispatch_block_t)block timeInterval:(uint64_t)interval delay:(uint64_t)delay;
- (void)event:(dispatch_block_t)block timeIntervalWithSeconds:(float)seconds;
- (void)event:(dispatch_block_t)block timeIntervalWithSeconds:(float)seconds delaySeconds:(float)delaySeconds;
- (void)start;
- (void)destroy;

@end
