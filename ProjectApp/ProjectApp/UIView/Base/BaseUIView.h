//
//  BaseUIView.h
//  ProjectApp
//
//  Created by libj on 15/7/20.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark -- 引用布局文件
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//#import <ProjectAppUIView/Masonry.h>

#pragma mark -- 引用公用文件
#import <ProjectAppCommon/CommonDefine.h>
#import <ProjectAppCommon/DataValidation.h>
#import <ProjectAppDataInterface/NetInterFace.h>


@interface BaseUIView : UIView

@end
