//
//  JsonBuilder.h
//  XinRanApp
//
//  Created by tianbo on 14-12-8.
//  Copyright (c) 2014年 deshan.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonBuilder : NSObject
{
    
}

+(JsonBuilder*)sharedInstance;


//生成请求json数据
-(NSString*)jsonWithLogin:(NSString*)name pwd:(NSString*)pwd type:(int)type;

@end
