//
//  LHYULeadingPageController.m
//  LHYULeadingPageController
//
//  Created by 小宇 on 2016/11/28.
//  Copyright © 2016年 刘占宇. All rights reserved.
//

#import "LHYULeadingPageController.h"
#import "UIImageView+WebCache.h"

@interface LHYULeadingPageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property (copy,nonatomic)LHYULeadingPageFinishHandler finishHandler;

@property (strong, nonatomic)UICollectionView *collectionView;

@property (strong, nonatomic)UIPageControl *pageControl;

@property (strong, nonatomic)NSArray *pagesArray;
@end

static NSString *const LHYULeadingPageCellId = @"LHYULeadingPageCellId";

@implementation LHYULeadingPageController

- (instancetype)initWithPagesArray:(NSArray *)pagesArray finishHandler:(LHYULeadingPageFinishHandler)finishHandler{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _pagesArray = pagesArray;
        _finishHandler = [finishHandler copy];
        [self.view addSubview:self.collectionView];
        [self.view addSubview:self.pageControl];
        //注册cell
        [self.collectionView registerClass:[LHYULeadingPageCell class] forCellWithReuseIdentifier:LHYULeadingPageCellId];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pagesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LHYULeadingPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LHYULeadingPageCellId forIndexPath:indexPath];
    //设置图片
    [cell.leadingImgView sd_setImageWithURL:[NSURL URLWithString:self.pagesArray[indexPath.row]] placeholderImage:[UIImage imageNamed:self.pagesArray[indexPath.item]]];
    // 设置按钮属性
    [cell.leadingBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [cell.leadingBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    //设置按钮显示的状态
    if (indexPath.row != self.pagesArray.count-1) {
        cell.leadingBtn.hidden = YES;
    }
    else {
        // 随后一页 显示按钮, 并且添加响应方法
        cell.leadingBtn.hidden = NO;
        [cell.leadingBtn addTarget:self action:@selector(finishBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}


- (void)finishBtnOnClick:(UIButton *)finishBtn {
    if (self.finishHandler) {
        self.finishHandler(finishBtn);
    }
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //向下取整
    NSInteger currentPage = scrollView.contentOffset.x/scrollView.bounds.size.width + 0.5;
    if (self.pageControl.currentPage != currentPage) {
        self.pageControl.currentPage = currentPage;
    }
}

#pragma mark -getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = self.pagesArray.count;
        pageControl.currentPage = 0;
        CGSize pageControlSize = [pageControl sizeForNumberOfPages:self.pagesArray.count];
        CGFloat pageControlX = (self.view.bounds.size.width - pageControlSize.width)/2;
        // 距离屏幕下方为 50 请根据具体情况修改吧
        CGFloat pageControlY = (self.view.bounds.size.height - pageControlSize.height - 50.f);
        pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlSize.width, pageControlSize.height);
        _pageControl = pageControl;
    }
    return _pageControl;
}

@end
