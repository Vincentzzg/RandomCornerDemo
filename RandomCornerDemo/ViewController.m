//
//  ViewController.m
//  RandomCornerDemo
//
//  Created by zzg on 2018/5/9.
//  Copyright © 2018年 Hikvision. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"
#import "FrameCustomView.h"
#import "MasonryCustomView.h"

#import "UIView+RandomCorner.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *masonryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //能正常生产圆角
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    [view setCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    
    //自定义视图，画圆角的操作封装在视图内部的initWithFrame方法中
    FrameCustomView *frameCustomView = [[FrameCustomView alloc] initWithFrame:CGRectMake(50, 170, 200, 100)];
    frameCustomView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:frameCustomView];
    
    //使用masonry自动布局
    self.masonryView = [[UIView alloc] init];
    self.masonryView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.masonryView];
    
    [self.masonryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 100));
        make.top.mas_equalTo(self.view.mas_top).offset(300);
        make.centerX.mas_equalTo(self.view);
    }];
    
    //这里加了这句之后就看不到masonryView了
//    [self.masonryView setCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    
    MasonryCustomView *masonryCustomView = [[MasonryCustomView alloc] init];
    masonryCustomView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:masonryCustomView];
    [masonryCustomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view).offset(-20);
        make.height.mas_equalTo(100);
        make.top.mas_equalTo(self.view.mas_top).offset(430);
        make.centerX.mas_equalTo(self.view);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //这里加了这句之后就看不到masonryView了
//    [self.masonryView setCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //加在这里是OK的
    [self.masonryView setCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //加在这里是OK的
//    [self.masonryView setCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
