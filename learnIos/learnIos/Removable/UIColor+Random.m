//
//  UIColor+Random.m
//  learnIos
//
//  Created by Cmlu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "UIColor+Random.h"


#define ARC4RANDOM_MAX 0x100000000L

@implementation UIColor (Random)


+(UIColor*) randomColor{
    CGFloat red = (CGFloat)arc4random()/(CGFloat)ARC4RANDOM_MAX;
    CGFloat blue = (CGFloat)arc4random()/(CGFloat)ARC4RANDOM_MAX;
    CGFloat green = (CGFloat)arc4random()/(CGFloat)ARC4RANDOM_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}


@end
