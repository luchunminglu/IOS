//
//  DialogHelper.m
//  learnIos
//
//  Created by chunminglu on 16/3/13.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "DialogHelper.h"

@implementation DialogHelper

/**
 *  展示对话框
 *
 *  @param controller 要展示对话框的ViewController
 */
+(void) showDialog:(UIViewController*) controller{
    //UIAlertControllerStyleAlert样式是在屏幕中间
    //UIAlertControllerStyleActionSheet样式是在屏幕底部
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"提示内容" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        //取消响应
    }];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        //[controller.navigationController popToRootViewControllerAnimated:YES];
        
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:defaultAction];
    [controller presentViewController:alertController animated:YES completion:nil];
    
    
}

@end
