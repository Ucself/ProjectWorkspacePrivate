//
//  WaitView.h
//  GTunes
//
//  Created by huangzan on 09-5-4.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark -- 引用布局文件
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

#pragma mark -- 引用公用文件
#import <ProjectAppCommon/CommonDefine.h>

@interface WaitView : UIView


+ (WaitView *) sharedInstance ;
-(void)start;
-(void)stop;

-(void)setStateText:(NSString*)text;
@end
