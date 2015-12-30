//
//  JsonUtils.m
//  ProjectAppCommon
//
//  Created by libj on 15/6/23.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import "JsonUtils.h"
#import "CommonDefine.h"

@implementation JsonUtils

/**
 *  字典转为json
 *
 *  @param dcit 字典类型数据
 *
 *  @return json字符串
 */
+ (NSString*) dictToJson:(NSDictionary*)dcit
{
    if(![NSJSONSerialization isValidJSONObject:dcit]){
        return nil;
    }
    
    NSError* error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dcit options:NSJSONWritingPrettyPrinted error:&error];
    NSString* json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (error) {
        DBG_MSG(@"dictToJson failed: %@", error.description);
    }
    return json;
}

/**
 *  json字符串转为字典
 *
 *  @param json json字符串
 *
 *  @return 字典类型数据
 */
+ (NSDictionary*) jsonToDcit:(NSString*)json
{
    if (!json || json.length == 0) {
        return nil;
    }
    
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
    
    if (error) {
        DBG_MSG(@"jsonToDcit failed: %@", error.description);
    }
    
    return dict;
}

/**
 *  json data 转为字典
 *
 *  @param json json data
 *
 *  @return 字典类型数据
 */
+ (NSDictionary*) jsonDataToDcit:(NSData *)data
{
    if (!data) {
        return nil;
    }
    
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        DBG_MSG(@"jsonDataToDcit failed: %@", error.description);
    }
    
    return dict;
}


@end
