//
//  BannerView.h
//  XinRanApp
//
//  Created by mac on 14/12/11.
//  Copyright (c) 2014年 deshan.com. All rights reserved.
//  封装的首页的头部滚动视图

#import <UIKit/UIKit.h>
//#import "AppBaseUIView.h"

#pragma mark -- 引用布局文件
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
//#import "Masonry.h"

#pragma mark -- 引用公用文件
#import <ProjectAppCommon/CommonDefine.h>

@protocol BannerViewDelegate <NSObject>

-(void)bannerViewWithIndex:(int)index;

@end

@interface BannerView : UIView <UIScrollViewDelegate>
{
    
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) BOOL autoTurning;    //自动翻页标识
@property (nonatomic, assign) UIViewContentMode imageMode;     //图片缩放模式
@property (nonatomic, assign) NSString *placeholderImage;

- (void)startTimer;
- (void)stopTimer;

-(void)initUI;
//-(void)loadBanners:(NSArray*)banners;
-(void)loadImagesUrl:(NSArray*)imagesUrl;
-(void)addTimer;
-(void)refreshContentSize;
@end
