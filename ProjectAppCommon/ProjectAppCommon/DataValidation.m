//
//  DataValidation.m
//  ProjectAppCommon
//
//  Created by libj on 15/6/23.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import "DataValidation.h"
#import "CommonDefine.h"

@implementation DataValidation

/*
 *  用正则判断用户名，是否2－16位
 */
+ (BOOL) checkUserName:(NSString *)text
{
    NSString *Regex = @"^\\w{2,16}$";
    NSPredicate *userName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [userName evaluateWithObject:text];
}


/*
 *  用正则判断邮箱
 */
+ (BOOL) checkEmail:(NSString *)text
{
    NSString *Regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *email = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [email evaluateWithObject:text];
}

/*
 *  请输入6-16位字母和数字,符号两种以上组合
 */
+ (BOOL) checkPassword:(NSString *)text
{
    NSString *Regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z\\-\\/\\:\\;\\(\\)\\$\\&\\@\\”\\.\\,\\?\\!\\’\\[\\]\\{\\}\\#\\%\\^\\*\\+\\=\\_\\|\\~\\<\\>\\€\\£\\¥\\•]{6,16}$";
    NSPredicate *password = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [password evaluateWithObject:text];
}

/*
 *  得到字符串长度 中英文混合情况下
 */
+(int)lengthToInt:(NSString*)string;
{
    //去掉空格
    NSString *st = [string  stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    int strlength = 0;
    char* p = (char*)[st cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[st lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}


+(BOOL) isAllPhoneNumber:(NSString *)mobileNum
{
    //手机，11位 ，1开头，第二位3、4、5、8，
    NSString *phoneMobile = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,1-9])|(17[0-9]))\\d{8}$";
    //带区号座机，区号和号码之间用‘-’连接
   	NSString *phoneWithZip = @"^[0][1-9]{2,3}[0-9]{5,10}$";//"^[0][1-9]{2,3}-[0-9]{5,10}$"
    //无区号座机
   	NSString *phoneWithoutZip = @"^[1-9]{1}[0-9]{6,8}$";
    //免费电话
   	NSString *phone400Or800 = @"^(400|800)[0-9]{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneMobile];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneWithZip];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneWithoutZip];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phone400Or800];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|4[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|7[0-9]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/*
 *  URL解码
 */
+ (NSString *)URLDecodedString:(NSString*)stringURL
{
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                 (CFStringRef)stringURL,
                                                                                                 CFSTR(""),
                                                                                                 kCFStringEncodingUTF8);
}

/*
 *  判断字符串是否是数字组成
 */
+ (BOOL)isNumberStr:(NSString*)string
{
    NSString *number =@"0123456789";
    NSCharacterSet * cs =[[NSCharacterSet characterSetWithCharactersInString:number]invertedSet];
    NSString * comparStr = [[string componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
    return [string isEqualToString:comparStr];
}

/*
 *  判断手机型号是否是iPhone5；
 */
+ (BOOL)isiPhone5Height:(NSInteger)height
{
    if (height>481){
        return YES;
    }
    else{
        return NO;
    }
}

/*
 *  判断是否是身份证
 *  需要-(BOOL)isNumberStr:(NSString*)string配合
 */
+(BOOL)isPersonCard:(NSString*)string
{
    //    DBG_MSG(@"%d",[self length]);
    if ([string length]!= 15 && [string length] != 18)
    {
        return NO;
    }
    else if ( ([string length] == 18 ||[string length] ==15) && [self isNumberStr:string])
    {
        return YES;
    }
    else if ([string length] == 18  && ([self isNumberStr:[string substringToIndex:17] ] && ([string hasSuffix:@"X"] || [string hasSuffix:@"x"])))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

/**
 *  判断字符串是否全是数字与字母
 */
+(BOOL)isNumberAndLetterStr:(NSString*)string
{
    NSString *number =@"0123456789abcefghijklmnopqrstuvwxyzABCEFGHIJKLMNOPQRSTUVWXYZ";
    NSCharacterSet *cs =[[NSCharacterSet characterSetWithCharactersInString:number]invertedSet];
    NSString *comparStr = [[string componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
    return [string isEqualToString:comparStr];
}
/*
 *  判断是否为中文字符
 */
+ (BOOL)isChineseStr:(NSString *)string
{
    NSString *Regex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *textString = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [textString evaluateWithObject:string];
}

/**
 *  判断字符串是否包含中文
 */
+(BOOL)isHasChineseCharacter:(NSString*)string
{
    BOOL ret = NO;
    for(int i=0; i< [string length];i++){
        int a = [string characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
            ret = YES;
    }
    
    return ret;
}
/**
 *  验证电话号码省市区
 */
+ (void) phoneRegionQuery:(NSString*)phonenumber finished:(void(^)(NSString *addr))finished{
    //使用淘宝的查询api
    //http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=15850781443
    
    NSString *url =@"http://tcc.taobao.com/cc/json/mobile_tel_segment.htm";
    url = [NSString stringWithFormat:@"%@?tel=%@", url, phonenumber];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setTimeoutInterval:10.0];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   DBG_MSG(@"获取手机号归属地失败!");
                                   if (finished) {
                                       finished(@"");
                                   }
                               }else{
                                   NSData *recData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                                   if (recData) {
                                       //服务器正常返回数据
                                       //GBK编码
                                       NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
                                       NSString *strings = [[NSString alloc] initWithData:recData encoding:gbkEncoding];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"__GetZoneResult_ =" withString:@""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"mts" withString:@"\"mts\""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"province" withString:@"\"province\""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"catName" withString:@"\"catName\""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"telString" withString:@"\"telString\""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"areaVid" withString:@"\"areaVid\""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"ispVid" withString:@"\"ispVid\""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"carrier" withString:@"\"carrier\""];
                                       strings= [strings stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
                                       //解析json数据
                                       NSError *error = nil;
                                       NSDictionary *dicInfor = [NSJSONSerialization JSONObjectWithData:[strings dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
                                       if (finished && [[dicInfor allKeys] containsObject:@"province"]) {
                                           finished([dicInfor objectForKey:@"province"]);
                                           return;
                                       }
                                       if (finished) {
                                           finished(@"");
                                       }
                                   }
                               }
                           }];
}

@end
