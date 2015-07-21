//
//  BaseUIViewController.h
//  ProjectApp
//
//  Created by libj on 15/7/21.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetInterfaceManager.h"
#import "ResultDataModel.h"
#import <ProjectAppDataInterface/Reachability.h>
//#import <ProjectAppUIView/NetPrompt.h>
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
//#import "Masonry.h"
//#import <ProjectAppUIView/Masonry.h>

#pragma mark -- 引用公用文件
#import <ProjectAppCommon/CommonDefine.h>

@interface BaseUIViewController : UIViewController

@end
