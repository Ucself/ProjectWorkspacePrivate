//
//  JsonBuilder.m
//  XinRanApp
//
//  Created by tianbo on 14-12-8.
//  Copyright (c) 2014年 deshan.com. All rights reserved.
//

#import "JsonBuilder.h"
#import "ProtocolDefine.h"
#import <ProjectAppCommon/JsonUtils.h>

@interface JsonBuilder ()

@end

@implementation JsonBuilder

+(JsonBuilder*)sharedInstance
{
    static JsonBuilder *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark- 生成json数据
-(NSString*)generateJsonWithDictionary:(NSDictionary*)dict;
{
    if (!dict) {
        return nil;
    }
    
    return [JsonUtils dictToJson:dict];
}

#pragma  mark- 生成请求数据
-(NSString*)getVersion
{
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSRange range = [version rangeOfString:@"."];
    NSString *mainVersion = [version substringToIndex:range.location];
    NSString *temp = [version substringFromIndex:range.location+1];
    NSString *subVersion = [[temp componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@""];;
    return [NSString stringWithFormat:@"%@.%@", mainVersion, subVersion];
}

-(NSString*)jsonWithLogin:(NSString*)name pwd:(NSString*)pwd type:(int)type
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:1];
    [dict setObject:[self getVersion] forKey:KJsonElement_Version];
    [dict setObject:KTerminalCode forKey:KJsonElement_Terminal];
    [dict setObject:name forKey:KJsonElement_Name];
    [dict setObject:pwd forKey:KJsonElement_Pwd];
    [dict setObject:[NSString stringWithFormat:@"%d", type] forKey:KJsonElement_Type];
    
    NSString *jsonString = [self generateJsonWithDictionary:dict];
    return jsonString;
}
@end
