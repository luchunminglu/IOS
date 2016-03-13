//
//  DialogHelper.h
//  learnIos
//
//  Created by chunminglu on 16/3/13.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DialogHelper : NSObject

/**
 *  展示一个对话框
 *
 *  @param controller 要展示对话框的ViewController
 */
+(void) showDialog:(UIViewController*) controller;

@end
