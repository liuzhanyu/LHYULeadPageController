//
//  LHYULeadingPageController.h
//  LHYULeadingPageController
//
//  Created by 小宇 on 2016/11/28.
//  Copyright © 2016年 刘占宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHYULeadingPageCell.h"

typedef void(^LHYULeadingPageFinishHandler)(UIButton *finishBtn);

@interface LHYULeadingPageController : UIViewController

- (instancetype)initWithPagesArray:(NSArray *)pagesArray finishHandler:(LHYULeadingPageFinishHandler)finishHandler;

@property (strong,nonatomic,readonly)UIPageControl *pageControl;

@property (strong,nonatomic,readonly)UICollectionView *collectionView;

@property (strong,nonatomic,readonly)NSArray *pagesArray;




@end
