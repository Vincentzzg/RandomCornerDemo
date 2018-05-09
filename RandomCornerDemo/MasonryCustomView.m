//
//  MasonryCustomView.m
//  RandomCornerDemo
//
//  Created by zzg on 2018/5/9.
//  Copyright © 2018年 Hikvision. All rights reserved.
//

#import "MasonryCustomView.h"

#import "UIView+RandomCorner.h"

@implementation MasonryCustomView

- (void)drawRect:(CGRect)rect {
    [self setCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
}

@end
