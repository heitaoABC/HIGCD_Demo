//
//  ViewController.m
//  HIGCD
//
//  Created by HomerIce on 16/3/7.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

#import "ViewController.h"
#import "HIGCD.h"

@interface ViewController ()

@property (nonatomic, strong) HIGCDTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 这是最常用的在 子线程处理业务，回到主线程刷新UI
    
    [HIGCDQueue executeInGlobalQueue:^{
        
        NSLog(@"这是在子线程中处理");
        
       [HIGCDQueue executeInMainQueue:^{
           NSLog(@"这是在主线程中刷新UI");
       }];
        
    }];
    
    
    
    
    // 将3个线程加入到group，前2个线程并发执行，不能确定谁先执行完毕；通过notify保证group中的前2个线程执行完毕后在执行 线程3
    
    // init group
    HIGCDGroup *group = [HIGCDGroup new];
    
    // add to group
    [[HIGCDQueue globalQueue] execute:^{
        
        // task one
        NSLog(@"我在执行1");
        
    } inGroup:group];
    
    // add to group
    [[HIGCDQueue globalQueue] execute:^{
        
        // task one
        NSLog(@"我在执行2");
        
    } inGroup:group];
    
    // notify in mainQueue
    [[HIGCDQueue mainQueue] notify:^{
        
        // task three
        NSLog(@"我在执行3");
        
    } inGroup:group];
    
    
    
    // GCD定时器，没有NSTimer准确，但误差也都是毫秒级别
    // 延迟10s开始执行，没1s执行一次
    
    // init timer
    self.timer = [[HIGCDTimer alloc] initInQueue:[HIGCDQueue mainQueue]];
    
    // timer event
    [self.timer event:^{
        
        // task
        NSLog(@"我在执行GCD定时器");
        
    } timeIntervalWithSeconds:1.f delaySeconds:10.f];
    
    // star timer
    [self.timer start];
    
    
    
    
    
    // signal 和 wait 配对使用，保证signal前的线程先执行完毕在执行 wait后边的
    
    // init semaphore
    HIGCDSemaphore *semaphore = [HIGCDSemaphore new];
    
    //wait
    [HIGCDQueue executeInGlobalQueue:^{
        
        [semaphore wait];
        
        // todo something else
        
        NSLog(@"我在执行线程1");
        
    }];
    
    // signal
    [HIGCDQueue executeInGlobalQueue:^{
        
        // do something
        NSLog(@"我在执行线程2");
        
        [semaphore signal];
        
    }];
    
}

@end
