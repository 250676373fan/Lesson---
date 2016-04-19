//
//  ViewController.m
//  Lesson -(多线程)
//
//  Created by lanou3g on 16/4/8.
//  Copyright © 2016年 范佳琛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //[NSThread currentThread] 获取当前线程
   // NSLog(@"current ==== %@",[NSThread currentThread]);
    //[NSThread mainThread] 获取主线程
   // NSLog(@"main ==== %@",[NSThread mainThread]);
    //[NSThread isMainThread] 判断当前线程是否为主线程
   // NSLog(@"isMainThread = %d",[NSThread isMainThread]);
    //NSObject 开辟子线程
    //第一个参数:selector ,子线程执行的代码
    //第二个:表示 selector传递的参数
#pragma mark -NSObject开辟子线程
//    [self performSelectorInBackground:@selector(sayHi) withObject:@"aaa"];
//    self.view.backgroundColor = [UIColor redColor];
#pragma mark -NSThread手动开辟子线程
    //使用NSThread开辟一个子线程
    //第一个参数:target
    //第二个:action
    //第三个:传参
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(sayHi) object:nil];
//    //让子线程开始
//    [thread start];
    
    //取消线程 不会真正取消线程,而是标记 这个被取消了
    //[thread cancel];
#pragma mark -使用NSThread自动的开辟一个线程
    //使用NSThread自动的开辟一个线程
    //不需要手动地开启线程
    [NSThread detachNewThreadSelector:@selector(sayHi) toTarget:self withObject:nil];
    
}


- (void)sayHi{
//    NSLog(@"%@",[NSThread currentThread]);
//    
//    NSLog(@"%@", [NSThread mainThread]);
    float i =10000000000;
    int count =0;
    while (i > 1) {
         i = i/2;
        count ++;
        
    }
    
    NSLog(@"count = %d",count);
    
    //写在哪里 哪个线程就关闭了(之后的代码不执行),注意 不要随意使用它.使用的时候一定要注意当前的线程是不是主线程
    //[NSThread exit];
    //NSObject中回到主线程去做某些事情
    //第一个参数:回到主线程做的事情
    //第二个:传递的参数
    //第三个:直到当前的线程已经结束才去做
    [self performSelectorOnMainThread:@selector(onMainThread) withObject:nil waitUntilDone:YES];
    
}
- (void)onMainThread{
    
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"main = %@", [NSThread mainThread]);
    NSLog(@"current = %@", [NSThread currentThread]);
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
