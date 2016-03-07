//
//  HIGCDQueue.h
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HIGCDGroup;

@interface HIGCDQueue : NSObject

@property (nonatomic, strong, readonly) dispatch_queue_t dispatchQueue;

+ (HIGCDQueue *)mainQueue;
+ (HIGCDQueue *)globalQueue;
+ (HIGCDQueue *)highPriorityGlobalQueue;
+ (HIGCDQueue *)lowPriorityGlobalQueue;
+ (HIGCDQueue *)backgroundPriorityGlobalQueue;

#pragma mark - 构造方法
+ (void)executeInMainQueue:(dispatch_block_t)block;
+ (void)executeInGlobalQueue:(dispatch_block_t)block;
+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block;
+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block;
+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block;
+ (void)executeInMainQueue:(dispatch_block_t)block afterDelaySeconds:(NSTimeInterval)seconds;
+ (void)executeInGlobalQueue:(dispatch_block_t)block afterDelaySeconds:(NSTimeInterval)seconds;
+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block afterDelaySeconds:(NSTimeInterval)seconds;
+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block afterDelaySeconds:(NSTimeInterval)seconds;
+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block afterDelaySeconds:(NSTimeInterval)seconds;

#pragma mark - 初始化
- (instancetype)init;
- (instancetype)initSerial;
- (instancetype)initSerialWithLabel:(NSString *)label;
- (instancetype)initConcurrent;
- (instancetype)initConcurrentWithLabel:(NSString *)label;

#pragma mark - 用法
- (void)execute:(dispatch_block_t)block;
- (void)execute:(dispatch_block_t)block afterDelay:(int64_t)delta;
- (void)execute:(dispatch_block_t)block afterDelaySeconds:(float)delta;
- (void)waitExecute:(dispatch_block_t)block;
- (void)barrierExecute:(dispatch_block_t)block;
- (void)waitBarrierExecute:(dispatch_block_t)block;
- (void)suspend;
- (void)resume;

#pragma mark - 与HIGCDGroup相关
- (void)execute:(dispatch_block_t)block inGroup:(HIGCDGroup *)group;
- (void)notify:(dispatch_block_t)block inGroup:(HIGCDGroup *)group;

@end
