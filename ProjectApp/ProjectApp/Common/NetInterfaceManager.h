//
//  NetInterfaceManager.h
//  XinRanApp
//
//  Created by tianbo on 14-12-8.
//  Copyright (c) 2014年 deshan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetInterfaceManager : NSObject


+(NetInterfaceManager*)sharedInstance;

/**
 *  设置网络请求标识
 *
 *  @param controller name
 */
-(void)setReqControllerId:(NSString*)cId;
-(NSString*)getReqControllerId;

/**
 *  重新加载一次数据
 */
-(void) reloadRecordData;

/**
 *  登录接口
 *
 *  @param name 用户手机号或邮箱
 *  @param pwd  密码
 *  @param type 1：手机号码；2：邮箱
 */
-(void)login:(NSString*)name pwd:(NSString*)pwd type:(int)type;
@end
