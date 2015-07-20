//
//  GetDynaPwdButton.h
//  ELive
//
//  Created by apple on 12-11-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
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

@protocol DynaButtonDelegate <NSObject>

-(void)dynaButtonClick:(UIView*)sender;
-(void)clickTiming;
-(void)timingButton:(id)sender;

@end

@interface DynaButton : UIView

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) int timeInterval;
@property (nonatomic, strong) NSString *buttonCode;
@property (nonatomic, assign) BOOL isTiming;


//按钮设置
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) UIColor * textColor;
@property (nonatomic, strong) UIImage * normalImage;
@property (nonatomic, strong) UIImage * highImage;
//- (id)initWithFrame:(CGRect)frame normalImage:(UIImage*)nImage highImage:(UIImage*)hImage;
+ (NSMutableDictionary *)dataInstance;

- (void)setTitle:(NSString*)title normalImage:(UIImage*)nImage highImage:(UIImage*)hImage;
- (void)setTitle:(NSString*)title textColor:(UIColor*)textColor normalImage:(UIImage*)nImage highImage:(UIImage*)hImage;
- (void)setStyle:(UIColor*)textColor normalImage:(UIImage*)nImage highImage:(UIImage*)hImage;

- (void)beginTimer:(NSString *) buttonCode;
- (void)stopTimer;

@end
