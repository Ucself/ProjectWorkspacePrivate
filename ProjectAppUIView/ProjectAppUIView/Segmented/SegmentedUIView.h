//
//  SegmentedUIView.h
//  XibTableViewTest
//
//  Created by libj on 15/1/13.
//  Copyright (c) 2015年 libj. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark -- 引用布局文件
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@class SegmentedUIView;

//图标类型类型
typedef NS_ENUM(uint32_t, SegmentedSortType) {
    SegmentedSortTypeUp=1,
    SegmentedSortTypeDrop
};

@protocol SegmentedUIViewDelegate <NSObject>

@required
//展示个数
- (NSInteger) numberOfData;
//每个单元的字符串名称
- (NSString *) stringForIndex:(NSInteger) index;
//是否有排序图标,默认不显示
- (UIImage*)segmentedUIView:(NSInteger) indexPath;
@optional
//选中每一个的时候激活的方法
- (void)segmentedUIView:(SegmentedUIView *)segmentedUIView didSelectRowAtIndexPath:(NSInteger) indexPath sortType:(SegmentedSortType)sortType;
//选中的排序类型
- (void)segmentedUIView:(SegmentedUIView *)segmentedUIView didSelectSortAtIndexPath:(NSInteger) indexPath sortType:(SegmentedSortType)sortType;
@end


@interface SegmentedUIView :UIView

#pragma mark --- xib属性
@property (weak, nonatomic) IBOutlet UIScrollView *mainUIScrollView;


#pragma mark --- 自定义属性
@property (retain, nonatomic)  UIImageView *selectedImageView;
@property (assign) id <SegmentedUIViewDelegate> delegate;
//当前选中的index
@property (assign,nonatomic) int selectedIndex;


-(SegmentedUIView *)init;
//外部设置选中项
-(void) setSelectedImageViewOfIndex:(int)index;
-(int) getSelectedIndex;
//设置当前是否向上
-(void)setCurrentIndexIsUp:(BOOL)isUp;

-(void) initInterface;
@end
