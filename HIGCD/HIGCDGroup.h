//
//  HIGCDGroup.h
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIGCDGroup : NSObject

@property (nonatomic, strong, readonly) dispatch_group_t dispatchGroup;

#pragma mark - 初始化
- (instancetype)init;

#pragma mark - 用法
- (void)enter;
- (void)leave;
- (void)wait;
- (BOOL)wait:(int64_t)delta;

@end
