//
//  LHYULaunchAdController.m
//  LHYULeadingPageController
//
//  Created by 小宇 on 2016/12/19.
//  Copyright © 2016年 刘占宇. All rights reserved.
//

#import "LHYULaunchAdController.h"

@interface LHYULaunchAdController ()

//启动图片
@property (strong, nonatomic) UIImage *launchImage;
//全屏显示启动图片
@property (strong, nonatomic) UIImageView *launchImageView;
//显示广告图片
@property (strong, nonatomic) UIImageView *adImageView;
//跳过按钮
@property (strong, nonatomic) UIButton *skipBtn;
//倒计时
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation LHYULaunchAdController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self startTimer];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self stopTimer];
}
- (void)dealloc {
    [self stopTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)adImageView{
    if (!_adImageView) {
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeScaleToFill;
        //将超出部分剪切掉
        imageView.clipsToBounds = YES;
    }
    return _adImageView;
}

- (UIImageView *)launchImageView{
    if(_launchImageView){
    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.clipsToBounds = YES;
    _launchImageView = imageView;
    }
    return _launchImageView;
}

- (UIButton *)skipBtn {
    if (!_skipBtn) {
        UIButton *skipBtn = [UIButton new];
        skipBtn.layer.masksToBounds = YES;
        skipBtn.layer.cornerRadius = 10.f;
        skipBtn.backgroundColor = [UIColor blackColor];
        [skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        skipBtn.titleLabel.font = [UIFont systemFontOfSize:16.f];
        [skipBtn addTarget:self action:@selector(skipBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        _skipBtn = skipBtn;
    }
    return _skipBtn;
}


// 开启timer
- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandler:) userInfo:nil repeats:YES];
    // 添加到运行循环中
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}
// 停止timer
- (void)stopTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
