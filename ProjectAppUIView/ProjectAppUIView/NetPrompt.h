//
//  NetPrompt.h
//  XinRanApp
//
//  Created by tianbo on 15-3-12.
//  Copyright (c) 2015年 deshan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark -- 引用布局文件
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

#pragma mark -- 引用公用文件
#import <ProjectAppCommon/CommonDefine.h>

@protocol NetPromptDelegate <NSObject>

-(void)requestNetReloadClick;

@end

@interface NetPrompt : NSObject

//顶部网络提示
@property (nonatomic) UIView *topUIView;
//中部请求提示
@property (nonatomic) UIView *middleUIView;

@property (nonatomic,assign) BOOL isShowTopUIView;
@property (nonatomic,assign) BOOL isShowMiddleUIView;

@property (nonatomic,assign) int top;

//协议
@property (nonatomic, assign) id<NetPromptDelegate> delegate;


- (instancetype)initWithView:(UIView *)uiView;


- (instancetype)initWithView:(UIView *)uiView
               showTopUIView:(BOOL)showTopUIView
            showMiddleUIView:(BOOL)showMiddleUIView;
@end
