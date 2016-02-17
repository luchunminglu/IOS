//
//  MainViewController.m
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end


/**
 *  这是一个通用的ViewController
 */
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIApplication* app = [UIApplication sharedApplication];//返回application实例
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




/**
 *  当程序将要到InActive时执行
 *
 *  @param notification <#notification description#>
 */
-(void) applicationWillResignActive:(NSNotification*) notification{
    
}
















































































































































































































































































@end
