//
//  FrameCustomView.m
//  RandomCornerDemo
//
//  Created by zzg on 2018/5/9.
//  Copyright © 2018年 Hikvision. All rights reserved.
//

#import "FrameCustomView.h"

#import "UIView+RandomCorner.h"

@implementation FrameCustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //给self视图添加圆角
        [self setCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
        
        //使用frame创建的子视图，添加圆角
        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        subView.backgroundColor = [UIColor blackColor];
        [self addSubview:subView];
        //添加圆角
        [subView setCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
