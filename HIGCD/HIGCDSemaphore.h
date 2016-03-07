//
//  HIGCDSemaphore.h
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIGCDSemaphore : NSObject

@property (nonatomic, strong, readonly) dispatch_semaphore_t dispatchSemaphore;

#pragma mark - 初始化
- (instancetype)init;
- (instancetype)initWithValue:(long)value;

#pragma mark - 用法
- (BOOL)signal;
- (void)wait;
- (BOOL)wait:(int64_t)delta;

@end
