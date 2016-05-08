//
//  CSNameNaviView.h
//  CSHierarchyView
//
//  Created by e3mo on 16/5/7.
//  Copyright © 2016年 e3mo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CSNameNaviViewDelegate <NSObject>

@optional
- (void)nameNaviView:(id)sender chooseIndex:(int)index;
@end

@interface CSNameNaviView : UIView {
    UIView *show_view;
    UIScrollView *scrollview;
    
    NSMutableArray *name_array;
    
    UIColor *start_color;
    float r_change;
    float g_change;
    float b_change;
    float a_change;
    UIColor *text_color;
    UIColor *text_highlighted_color;
    float text_size;
}
@property (nonatomic,weak) id<CSNameNaviViewDelegate> delegate;

/**
 文字导航条，颜色渐变
 */

/**
 frame：导航的大小
 */
- (id)initWithFrame:(CGRect)frame;

/**
 startColor：第一块的颜色，请用RGBA模式的UIColor
 r、g、b、a：后面块的颜色变化设定，不变为0，可为负，总范围0~1
 */
- (void)setStartColor:(UIColor*)startColor r:(float)r g:(float)g b:(float)b a:(float)a;
/**
 textColor：文字的颜色
 textHighlightedColor：文字点击颜色
 可单独设置其中一个，其他传nil就行，传nil时其他内容不会改变，皆为原来的值或默认值
 textSize：文字大小，可为0，为0时是默认大小，传负数则不改变
 */
- (void)setTextColor:(UIColor*)textColor textHighlightedColor:(UIColor*)highlightedColor textSize:(float)textSize;

- (NSArray*)getNameArray;//获取名字数组
- (void)addNewName:(NSString*)name;//新增一个数据
- (void)removeFromIndex:(int)index;//移除index及以后的所有数据

@end
