//
//  CSNameNaviView.m
//  CSHierarchyView
//
//  Created by e3mo on 16/5/7.
//  Copyright © 2016年 e3mo. All rights reserved.
//

#import "CSNameNaviView.h"

@implementation CSNameNaviView

- (id)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        
        name_array = [[NSMutableArray alloc] init];
        start_color = [UIColor colorWithRed:0 green:0.8 blue:0 alpha:1];
        r_change = 0;
        g_change = -0.06;
        b_change = 0;
        a_change = 0;
        text_color = [UIColor whiteColor];
        text_highlighted_color = [UIColor lightGrayColor];
        
        [self reloadShowView];
    }
    
    return self;
}


- (void)setStartColor:(UIColor*)startColor r:(float)r g:(float)g b:(float)b a:(float)a {
    if (startColor) {
        start_color = startColor;
    }
    r_change = r;
    g_change = g;
    b_change = b;
    a_change = a;
    
    CGPoint off = scrollview.contentOffset;
    [self reloadShowView];
    scrollview.contentOffset = off;
}


- (void)setTextColor:(UIColor*)textColor textHighlightedColor:(UIColor*)highlightedColor textSize:(float)textSize {
    if (textColor) {
        text_color = textColor;
    }
    if (highlightedColor) {
        text_highlighted_color = highlightedColor;
    }
    if (textSize >= 0) {
        text_size = textSize;
    }
    
    CGPoint off = scrollview.contentOffset;
    [self reloadShowView];
    scrollview.contentOffset = off;
}

- (NSArray*)getNameArray {
    return name_array;
}

- (void)addNewName:(NSString*)name {
    [name_array addObject:name];
    
    scrollview.scrollEnabled = NO;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, show_view.frame.size.height)];
    [label setText:name];
    if (text_size > 0) {
        [label setFont:[UIFont systemFontOfSize:text_size]];
    }
    else {
        [label setFont:[UIFont systemFontOfSize:show_view.frame.size.height/2]];
    }
    [label sizeToFit];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(scrollview.contentSize.width-(label.frame.size.width+20), 0, label.frame.size.width+20, show_view.frame.size.height)];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitleColor:text_color forState:UIControlStateNormal];
    [btn setTitleColor:text_highlighted_color forState:UIControlStateHighlighted];
    if (text_size > 0) {
        [btn.titleLabel setFont:[UIFont systemFontOfSize:text_size]];
    }
    else {
        [btn.titleLabel setFont:[UIFont systemFontOfSize:show_view.frame.size.height/2]];
    }
    [btn setBackgroundColor:[self getBgColor:(int)name_array.count-1]];
    [btn addTarget:self action:@selector(btnTouched:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = name_array.count-1+1000;
    [scrollview addSubview:btn];
    
    [scrollview sendSubviewToBack:btn];
    
    scrollview.contentSize = CGSizeMake(scrollview.contentSize.width+btn.frame.size.width, scrollview.contentSize.height);
    
    
    CGPoint off = scrollview.contentOffset;
    if (scrollview.contentSize.width >= scrollview.frame.size.width) {
        off.x = scrollview.contentSize.width-scrollview.frame.size.width;
        
        CGRect frame = btn.frame;
        frame.origin.x = scrollview.contentSize.width - frame.size.width;
        btn.frame = frame;
        
        [UIView animateWithDuration:0.2 animations:^{
            scrollview.contentOffset = off;
        } completion:^(BOOL finished) {
            if (finished) {
                scrollview.scrollEnabled = YES;
            }
        }];
    }
    else {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect frame = btn.frame;
            frame.origin.x = scrollview.contentSize.width - frame.size.width;
            btn.frame = frame;
        } completion:^(BOOL finished) {
            if (finished) {
                scrollview.scrollEnabled = YES;
            }
        }];
    }
}

- (void)removeFromIndex:(int)index {
    int count = (int)name_array.count;
    for (int i=index; i<count; i++) {
        [name_array removeLastObject];
    }
    
    scrollview.scrollEnabled = NO;
    
    float width = 0;
    for (int i=index; i<count; i++) {
        UIButton *btn = (UIButton*)[scrollview viewWithTag:i+1000];
        width += btn.frame.size.width;
    }
    if (scrollview.contentSize.width-width < scrollview.frame.size.width) {
        
        [UIView animateWithDuration:0.2 animations:^{
            CGPoint off = scrollview.contentOffset;
            off.x = 0;
            scrollview.contentOffset = off;
            
            for (int i=index; i<count; i++) {
                UIButton *btn = (UIButton*)[scrollview viewWithTag:i+1000];
                CGRect frame = btn.frame;
                frame.origin.x -= width;
                btn.frame = frame;
            }
            
        } completion:^(BOOL finished) {
            if (finished) {
                for (int i=index; i<count; i++) {
                    UIButton *btn = (UIButton*)[scrollview viewWithTag:i+1000];
                    [btn removeFromSuperview];
                }
                
                scrollview.scrollEnabled = YES;
                
                scrollview.contentSize = CGSizeMake(scrollview.contentSize.width-width, scrollview.contentSize.height);
            }
        }];
    }
    else {
        
        [UIView animateWithDuration:0.2 animations:^{
            scrollview.contentSize = CGSizeMake(scrollview.contentSize.width-width, scrollview.contentSize.height);
            
        } completion:^(BOOL finished) {
            if (finished) {
                for (int i=index; i<count; i++) {
                    UIButton *btn = (UIButton*)[scrollview viewWithTag:i+1000];
                    [btn removeFromSuperview];
                }
                
                scrollview.scrollEnabled = YES;
            }
        }];
    }
}

- (void)reloadShowView {
    if (show_view) {
        [show_view removeFromSuperview];
        show_view = nil;
    }
    
    show_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [show_view setBackgroundColor:[UIColor clearColor]];
    [self addSubview:show_view];
    
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, show_view.frame.size.width, show_view.frame.size.height)];
    [scrollview setBackgroundColor:[UIColor clearColor]];
    [scrollview setScrollEnabled:YES];//能否滑动
    [scrollview setShowsHorizontalScrollIndicator:NO];
    [scrollview setShowsVerticalScrollIndicator:NO];
    [scrollview setPagingEnabled:NO];//设置是否按页翻动
    [scrollview setBounces:NO];//设置是否反弹
    [scrollview setIndicatorStyle:UIScrollViewIndicatorStyleDefault];//设置风格
    [scrollview setDirectionalLockEnabled:NO];//设置是否同时运动
    
    
    float scroll_width = 0;
    for (int i=0; i<name_array.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, show_view.frame.size.height)];
        [label setText:[name_array objectAtIndex:i]];
        if (text_size > 0) {
            [label setFont:[UIFont systemFontOfSize:text_size]];
        }
        else {
            [label setFont:[UIFont systemFontOfSize:show_view.frame.size.height/2]];
        }
        [label sizeToFit];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(scroll_width, 0, label.frame.size.width+20, show_view.frame.size.height)];
        [btn setTitle:[name_array objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:text_color forState:UIControlStateNormal];
        [btn setTitleColor:text_highlighted_color forState:UIControlStateHighlighted];
        if (text_size > 0) {
            [btn.titleLabel setFont:[UIFont systemFontOfSize:text_size]];
        }
        else {
            [btn.titleLabel setFont:[UIFont systemFontOfSize:show_view.frame.size.height/2]];
        }
        [btn setBackgroundColor:[self getBgColor:i]];
        [btn addTarget:self action:@selector(btnTouched:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i+1000;
        [scrollview addSubview:btn];
        
        scroll_width += btn.frame.size.width;
    }
    
    [scrollview setContentSize:CGSizeMake(scroll_width, show_view.frame.size.height)];//设置滑动范围
    [scrollview setContentOffset:CGPointMake(0, 0)];//设置当前显示位置
    [show_view addSubview:scrollview];
}

- (void)btnTouched:(id)sender {
    UIButton *btn = (UIButton*)sender;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(nameNaviView:chooseIndex:)]) {
        [self.delegate nameNaviView:self chooseIndex:(int)btn.tag-1000];
    }
}

- (UIColor*)getBgColor:(int)index {
    CGColorRef s_colorref = [start_color CGColor];
    int s_numComponents = (int)CGColorGetNumberOfComponents(s_colorref);
    if (s_numComponents == 4) {
        const CGFloat *s_components = CGColorGetComponents(s_colorref);
        
        float r = s_components[0] + index*r_change;
        float g = s_components[1] + index*g_change;
        float b = s_components[2] + index*b_change;
        float a = s_components[3] + index*a_change;
        
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    else {
        return start_color;
    }
}

@end
