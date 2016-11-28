//
//  LHYULeadingPageCell.m
//  LHYULeadingPageController
//
//  Created by 小宇 on 2016/11/28.
//  Copyright © 2016年 刘占宇. All rights reserved.
//

#import "LHYULeadingPageCell.h"

@implementation LHYULeadingPageCell
- (instancetype)init{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    [self.contentView addSubview:self.leadingImgView];
    [self.contentView addSubview:self.leadingBtn];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.leadingImgView.frame = self.contentView.bounds;
    //根据字数自动调整宽高
    [self.leadingBtn sizeToFit];
    CGFloat margin = 10.0f;
    
    CGFloat btnHeight = self.leadingBtn.bounds.size.height + margin/2;
    CGFloat btnWidth = self.leadingBtn.bounds.size.width + margin;
    CGFloat btnX= (self.bounds.size.width - btnWidth)/2;
    // 距离屏幕下方的距离为 100
    CGFloat btnY = self.bounds.size.height - 100.f - btnHeight;
    self.leadingBtn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
}


- (UIButton *)leadingBtn{
    if (!_leadingBtn) {
        UIButton *btn = [[UIButton alloc]init];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 10.0f;
        _leadingBtn = btn;
    }
    return _leadingBtn;
}

- (UIImageView *)leadingImgView{
    if (!_leadingImgView) {
        _leadingImgView = [[UIImageView alloc]init];
        _leadingImgView.contentMode = UIViewContentModeScaleToFill;
    }
    return _leadingImgView;
}














@end
