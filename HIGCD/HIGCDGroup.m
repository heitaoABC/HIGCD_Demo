//
//  HIGCDGroup.m
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import "HIGCDGroup.h"

@interface HIGCDGroup ()

@property (nonatomic, strong, readwrite) dispatch_group_t dispatchGroup;

@end

@implementation HIGCDGroup

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.dispatchGroup = dispatch_group_create();
    }
    
    return self;
}

- (void)enter
{
    dispatch_group_enter(self.dispatchGroup);
}

- (void)leave
{
    dispatch_group_leave(self.dispatchGroup);
}

- (void)wait
{
    dispatch_group_wait(self.dispatchGroup, DISPATCH_TIME_FOREVER);
}

- (BOOL)wait:(int64_t)delta
{
    return dispatch_group_wait(self.dispatchGroup, dispatch_time(DISPATCH_TIME_NOW, delta));
}

@end
