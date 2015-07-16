//
//  ResultDataModel.m
//  XinRanApp
//
//  Created by tianbo on 14-12-9.
//  Copyright (c) 2014年 deshan.com. All rights reserved.
//

#import "ResultDataModel.h"
#import "ProtocolDefine.h"
#import <ProjectAppCommon/CommonDefine.h>

@implementation ResultDataModel

-(void)dealloc
{
    self.desc = nil;
    self.data = nil;
}

-(id)initWithDictionary:(NSDictionary *)dict reqType:(int)reqestType
{
    self = [super init];
    
    if ([dict isKindOfClass:[NSNull class]] || dict == nil) {
        return self;
    }
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return self;
    }

    if (self) {
        self.data = nil;
        self.requestType = reqestType;
        
        int resultCode = [[dict objectForKey:@"result"] intValue];
        self.resultCode = resultCode;
        
        if (resultCode >= 0) {
            self.desc = @"请求成功";
            [self parseData:dict];
        }
        else {
            NSString *msg = [dict objectForKey:@"msg"];
            self.desc = msg ? msg : @"亲，数据获取失败，请重试!";
        }
    }
    
    return self;
}

-(id)initWithErrorInfo:(NSError*)error reqType:(int)reqestType
{
    self = [super init];
    if (self) {
        self.requestType = reqestType;
        self.resultCode = (int)error.code;
        DBG_MSG(@"http request error code: (%d)", self.resultCode);
        
        switch (self.resultCode) {
            case NSURLErrorNotConnectedToInternet:
                self.desc = @"亲，你的网络不给力，请检查网络!";
                break;
            default:
                self.desc = @"亲，数据获取失败，请重试!";
                break;
        }
        self.data = nil;
    }
    
    return self;
}
#pragma mark- 解析数据
-(NSString*)parseErrorCode:(NSInteger)code
{
    NSString *ret = @"";
    switch (code) {

        case 401:
            ret = @"请求失败";
            break;
            
        default:
            break;
    }
    
    return  ret;
}

-(id)parseData:(NSDictionary*)dict
{
    NSDictionary *ret = nil;
    switch (self.requestType) {
        case KReqestType_Index:       //解析字典范例
        {
            [self parseDicData:dict];
        }
            break;
        case KReqestType_Getdefwhouse:   //解析数组范例
        {
            [self parseArrayData:dict];
        }
            break;
        case KReqestType_BSUP:
        {
            [self parseSpecialData:dict];
        }
            break;
        default:
            break;
    }

    return ret;
}

//解析字典
-(void)parseDicData:(NSDictionary *)dict
{
    NSDictionary *data = [dict objectForKey:KJsonElement_Data];
    self.data = data;
}
//解析数组
-(void)parseArrayData:(NSDictionary *)dict
{
    NSArray *array = [dict objectForKey:KJsonElement_Data];
    self.data = array;
}
//返回不符合规则的特殊解析
-(void)parseSpecialData:(NSDictionary *)dict
{
    self.data = dict;
}
@end
