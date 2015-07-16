//
//  NetInterfaceManager.m
//  XinRanApp
//
//  Created by tianbo on 14-12-8.
//  Copyright (c) 2014年 deshan.com. All rights reserved.
//

#import "NetInterfaceManager.h"
#import "JsonBuilder.h"
#import "ResultDataModel.h"
#import "ProtocolDefine.h"
#import <ProjectAppDataInterface/NetInterFace.h>
#import <ProjectAppCommon/JsonUtils.h>


@interface NetInterfaceManager ()
{
    NSString *recordUrl;
    NSString *recordBody;
    RequestType recordRequestType;
    int recordIsPost;
    
    NSString *controllerId;
}

@property(nonatomic, copy) void (^successBlock)(NSString* msg);
@property(nonatomic, copy) void (^failedBlock)(NSString* msg);
@end

@implementation NetInterfaceManager

+(NetInterfaceManager*)sharedInstance
{
    static NetInterfaceManager *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(void)dealloc
{
    self.successBlock = nil;
    self.failedBlock = nil;
}

-(void)setSuccessBlock:(void (^)(NSString*))success failedBlock:(void (^)(NSString*))failed
{
    self.successBlock = success;
    self.failedBlock = failed;
}

#pragma mark-

//重新加载上一次的请求
-(void) reloadRecordData {
    
    if (recordUrl && recordBody) {
        switch (recordIsPost) {
            case 1:
                [self postRequst:recordUrl body:recordBody requestType:recordRequestType];
                break;
            case 0:
                [self getRequst:recordUrl body:recordBody requestType:recordRequestType];
                break;
            default:
                break;
        }
    }
    
}

#pragma mark---
-(void)postRequst:(NSString*)url body:(NSString*)body requestType:(int)type
{
    //记录一次请求数据
    recordUrl = url;
    recordBody = body;
    recordRequestType = type;
    recordIsPost = 1;
    
    [[NetInterface sharedInstance] httpPostRequest:url body:body suceeseBlock:^(NSString *msg){
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            //转化josn数据到ResultDataModel
            ResultDataModel *result = [[ResultDataModel alloc] initWithDictionary:[JsonUtils jsonToDcit:msg] reqType:type];
            
            if (result.resultCode == 401 || result.resultCode == 403) {
                
                return ;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                //通知页面
                [[NSNotificationCenter defaultCenter] postNotificationName:KNotification_RequestFinished object:result];
            });
        });
        
    }failedBlock:^(NSError *error) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //转化错误信息到ResultDataModel
            ResultDataModel *result = [[ResultDataModel alloc] initWithErrorInfo:error reqType:type];
            
            if (result.resultCode == 401 || result.resultCode == 403) {
                return ;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
            //通知页面
                [[NSNotificationCenter defaultCenter] postNotificationName:KNotification_RequestFailed object:result];
            });
            
        });
       
    }];
}

-(void)getRequst:(NSString*)url body:(NSString*)body requestType:(int)type
{
    //记录一次请求数据
    recordUrl = url;
    recordBody = body;
    recordRequestType = type;
    recordIsPost = 0;
    
    [[NetInterface sharedInstance] httpGetRequest:url body:body suceeseBlock:^(NSString *msg){
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //转化josn数据到ResultDataModel
            ResultDataModel *result = [[ResultDataModel alloc] initWithDictionary:[JsonUtils jsonToDcit:msg] reqType:type];
            
            if (result.resultCode == 401 || result.resultCode == 403) {
                return ;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //通知页面
                [[NSNotificationCenter defaultCenter] postNotificationName:KNotification_RequestFinished object:result];
            });
            
        });
        
    }failedBlock:^(NSError *error) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //转化错误信息到ResultDataModel
            ResultDataModel *result = [[ResultDataModel alloc] initWithErrorInfo:error reqType:type];
            
            if (result.resultCode == 401 || result.resultCode == 403) {
                return ;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //通知页面
                [[NSNotificationCenter defaultCenter] postNotificationName:KNotification_RequestFailed object:result];
            });
            
        });
    }];
}

/**
 *  设置当前的ViewController
 *
 *  @param controller name
 */
-(void)setReqControllerId:(NSString*)cId
{
    //DBG_MSG(@"--controllerid=%@", cId)
    controllerId= cId;
}

-(NSString*)getReqControllerId
{
    return controllerId;
}

#pragma mark --
/**
 *  登录接口
 *
 *  @param name 用户手机号或邮箱
 *  @param pwd  密码
 */
-(void)login:(NSString*)name pwd:(NSString*)pwd type:(int)type
{
    NSString *body = [[JsonBuilder sharedInstance] jsonWithLogin:name pwd:pwd type:type];
    NSString *url = [NSString stringWithFormat:@"%@%@", KServerAddr, KUrl_Login];
    //url = @"http://www.baidu.com";
    
    [self postRequst:url body:body requestType:KReqestType_Login];
    
}

@end
