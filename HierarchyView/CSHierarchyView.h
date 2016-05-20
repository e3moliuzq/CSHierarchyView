//
//  CSHierarchyView.h
//  CSHierarchyView
//
//  Created by e3mo on 16/5/7.
//  Copyright © 2016年 e3mo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSNameNaviView.h"


@protocol CSHierarchyViewDelegate <NSObject>

@optional
- (void)hierarchyView:(id)sender chooseIndexs:(NSArray*)indexs;
@end

@interface CSHierarchyView : UIView <UITableViewDelegate,UITableViewDataSource,CSNameNaviViewDelegate> {
    NSMutableArray *picker_choose_indexs;
    NSArray *picker_array;
    
    UIColor *bg_color;
    UIColor *cell_label_color;
    UIColor *cell_line_color;
    UIColor *highlighted_color;
    float cell_text_size;
    
    NSMutableArray *table_views_array;
    
}
@property (nonatomic,weak) id<CSHierarchyViewDelegate> delegate;
@property (nonatomic,strong) CSNameNaviView* name_navi_view;

/**
 多个table切换的多层级菜单，有页面叠加效果
 */

/**
 frame：菜单的位置大小
 array：传入数据，array中为数组，数组为dict，key：name-当前级显示内容，array-下一级的数组
 bgColor：列表背景颜色，可为空，为空为白色
 highlightedColor：点击效果颜色，可为空，为空无点击效果
 labelColor：列表背景颜色，可为空，为空为[UIColor blackColor]
 lineColor：列表背景颜色，可为空，为空为[UIColor lightGrayColor]
 textSize：文字大小，小于等于0时是默认大小16
 */
- (id)initWithFrame:(CGRect)frame array:(NSArray*)info_array;
- (id)initWithFrame:(CGRect)frame array:(NSArray*)info_array bgColor:(UIColor*)bgColor highlightedColor:(UIColor*)highlightedColor labelColor:(UIColor*)labelColor lineColor:(UIColor*)lineColor textSize:(float)textSize;

- (NSArray*)getNowChooseIndexs;
- (NSArray*)getInfoArray;

@end
