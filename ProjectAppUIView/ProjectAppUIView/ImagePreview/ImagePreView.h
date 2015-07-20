//
//  ImagePreView.h
//  XinRanApp
//
//  Created by tianbo on 14-12-30.
//  Copyright (c) 2014年 deshan.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark -- 引用布局文件
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

#pragma mark -- 引用公用文件
#import <ProjectAppCommon/CommonDefine.h>


@protocol ImagePreViewDelegate <NSObject>

-(void)imagePreViewClick;

@end


@interface ImagePreView : UIView <UIScrollViewDelegate>

@property(assign, nonatomic) id delegate;
-(void)loadImages:(NSArray*)images selectIndex:(int)index;
@end
