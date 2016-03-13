//
//  ViewController.m
//  learnIos
//
//  Created by chunminglu on 16/2/16.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "ViewController.h"
#import "DialogHelper.h"
#include "SoundHelper.h"
#include "ThreadUtils.h"
#include "NotificationUtils.h"
#include "MessageBarUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/**
 *  Button响应
 *
 *  @param sender <#sender description#>
 */
- (IBAction)btnClick:(id)sender {

    [MessageBarUtils showMessage:@"title" content:@"content"];

}
@end
