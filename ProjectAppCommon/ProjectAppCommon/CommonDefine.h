//
//  CommonDefine.h
//  ProjectAppCommon
//
//  Created by libj on 15/6/23.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#ifndef ProjectAppCommon_CommonDefine_h
#define ProjectAppCommon_CommonDefine_h

//颜色转换
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColor_DefGreen    UIColorFromRGB(0x00a489)
#define UIColor_DefOrange   UIColorFromRGB(0xff5700)
#define UIColor_Background  UIColorFromRGB(0xF2F2F2)
#define UIColor_NavigationBarBackground  UIColorFromRGB(0x00A9E6)

#define degreesToRadian(x) (M_PI * x / 180.0)

//调试信息打印使用
#ifdef DEBUG  //调试阶段
#define DBG_MSG(msg, ...)\
{\
NSLog(@"%@ <- %@ ->",[NSString stringWithUTF8String:__FUNCTION__], [NSString stringWithFormat:(msg), ##__VA_ARGS__]);\
}
#else //发布阶段
#define DBG_MSG(msg, ...)
#endif

//设备的相关信息
#define SYSVERSION  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define ISIOS7LATER   ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 )
#define ISIOS8BEFORE   ( [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0 )
#define deviceWidth  [UIScreen mainScreen].bounds.size.width
#define deviceHeight  [UIScreen mainScreen].bounds.size.height
#define deviceUUID  [[[UIDevice currentDevice] identifierForVendor] UUIDString]

#define KNotifyEnterBackGround   @"enterBackGround"
#define KNotifyBecomeActive      @"becomeActive"


#endif
