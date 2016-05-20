//
//  CSHierarchyOneTableView.m
//  CSHierarchyOneTableView
//
//  Created by e3mo on 16/5/7.
//  Copyright © 2016年 e3mo. All rights reserved.
//

#import "CSHierarchyOneTableView.h"

@implementation CSHierarchyOneTableView

- (id)initWithFrame:(CGRect)frame array:(NSArray *)info_array {
    return [self initWithFrame:frame array:info_array bgColor:nil highlightedColor:nil labelColor:nil lineColor:nil textSize:0];
}

- (id)initWithFrame:(CGRect)frame array:(NSArray *)info_array bgColor:(UIColor *)bgColor highlightedColor:(UIColor *)highlightedColor labelColor:(UIColor *)labelColor lineColor:(UIColor *)lineColor textSize:(float)textSize {
    if ([super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        
        picker_array = [NSArray arrayWithArray:info_array];
        if (bgColor) {
            bg_color = bgColor;
        }
        else {
            bg_color = [UIColor whiteColor];
        }
        
        if (highlightedColor) {
            highlighted_color = highlightedColor;
        }
        
        if (labelColor) {
            cell_label_color = labelColor;
        }
        else {
            cell_label_color = [UIColor blackColor];
        }
        
        if (lineColor) {
            cell_line_color = lineColor;
        }
        else {
            cell_line_color = [UIColor lightGrayColor];
        }
        
        if (textSize <= 0) {
            cell_text_size = 16;
        }
        else {
            cell_text_size = textSize;
        }
        
        picker_choose_indexs = [[NSMutableArray alloc] init];
        
        
        _name_navi_view = [[CSNameNaviView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-44, self.frame.size.width, 44)];
        [_name_navi_view setBackgroundColor:bg_color];
        _name_navi_view.delegate = self;
        [_name_navi_view setTextColor:nil textHighlightedColor:nil textSize:14];
        [self addSubview:_name_navi_view];
        _name_navi_view.hidden = YES;
        
        [self createTableView:(int)picker_choose_indexs.count];
    }
    
    return self;
}

- (NSArray*)getNowChooseIndexs {
    return picker_choose_indexs;
}

- (NSArray*)getInfoArray {
    return picker_array;
}

- (void)createTableView:(int)index {
    if (table_view) {
        [table_view removeFromSuperview];
        table_view = nil;
    }
    
    if (index == 0) {
        table_view = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    }
    else {
        table_view = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-_name_navi_view.frame.size.height) style:UITableViewStylePlain];
    }
    
    [table_view setDataSource:self];
    [table_view setDelegate:self];
    [table_view setBackgroundColor:bg_color];
    table_view.showsVerticalScrollIndicator = NO;
    table_view.showsHorizontalScrollIndicator = NO;
    table_view.bounces = NO;
    table_view.separatorStyle = UITableViewCellSeparatorStyleNone;
    table_view.rowHeight = 44;
    table_view.tag = index;
    table_view.clipsToBounds = NO;
    [self addSubview:table_view];
    //不能和加圆角同时使用
    table_view.layer.shadowColor = [UIColor lightGrayColor].CGColor;//shadowColor阴影颜色
    table_view.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移x，y向下偏移y，默认(0, -3),这个跟shadowRadius配合使用
    table_view.layer.shadowOpacity = 0.7;//阴影透明度，默认0
    table_view.layer.shadowRadius = 3;//阴影半径，默认3
    
    [self sendSubviewToBack:table_view];
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {//行数
    if (tableView.tag == 0) {
        return picker_array.count;
    }
    else {
        NSArray *array = [NSMutableArray arrayWithArray:picker_array];
        for (int i=0; i<tableView.tag; i++) {
            int index = [[picker_choose_indexs objectAtIndex:i] intValue];
            NSDictionary *dict = [array objectAtIndex:index];
            array = [NSArray arrayWithArray:[dict objectForKey:@"array"]];
        }
        return array.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = (int)indexPath.row;
    int section = (int)indexPath.section;
    
    UITableViewCell *cell;
    NSString *identifierStr = [NSString stringWithFormat:@"Cell_%d_%d",section,index];
    cell = [tableView dequeueReusableCellWithIdentifier:identifierStr];
    
    if (cell) {
    }
    else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierStr];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.backgroundColor = [UIColor clearColor];
        
        if (highlighted_color) {
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            UIView *bg_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
            [bg_view setBackgroundColor:highlighted_color];
            [cell setSelectedBackgroundView:bg_view];
        }
        
        NSDictionary *dict;
        if (tableView.tag == 0) {
            dict = [picker_array objectAtIndex:index];
        }
        else {
            NSArray *array = [NSMutableArray arrayWithArray:picker_array];
            for (int i=0; i<tableView.tag; i++) {
                int index = [[picker_choose_indexs objectAtIndex:i] intValue];
                NSDictionary *dict = [array objectAtIndex:index];
                array = [NSArray arrayWithArray:[dict objectForKey:@"array"]];
            }
            dict = [array objectAtIndex:index];
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, tableView.frame.size.width-30, 20)];
        [label setText:[dict objectForKey:@"name"]];
        [label setTextColor:cell_label_color];
        [label setTextAlignment:NSTextAlignmentLeft];
        [label setFont:[UIFont systemFontOfSize:cell_text_size]];
        [label setBackgroundColor:[UIColor clearColor]];
        [cell addSubview:label];
        
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(10, 44-0.5, tableView.frame.size.width-20, 1)];
        [line setBackgroundColor:cell_line_color];
        [cell addSubview:line];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (tableView.tag != picker_choose_indexs.count) {
        return;
    }
    
    int index = (int)indexPath.row;
    NSDictionary *dict;
    if (tableView.tag == 0) {
        dict = [picker_array objectAtIndex:index];
    }
    else {
        NSArray *array = [NSMutableArray arrayWithArray:picker_array];
        for (int i=0; i<tableView.tag; i++) {
            int index = [[picker_choose_indexs objectAtIndex:i] intValue];
            NSDictionary *dict = [array objectAtIndex:index];
            array = [NSArray arrayWithArray:[dict objectForKey:@"array"]];
        }
        dict = [array objectAtIndex:index];
    }
    NSArray *arr = [dict objectForKey:@"array"];
    if (arr && arr.count > 0) {
        [picker_choose_indexs addObject:[NSString stringWithFormat:@"%d",index]];
        
        _name_navi_view.hidden = NO;
        NSString *name = [dict objectForKey:@"name"];
        [_name_navi_view addNewName:name];
        
        [self createTableView:(int)picker_choose_indexs.count];
        CGRect frame = table_view.frame;
        frame.origin.x = frame.size.width;
        table_view.frame = frame;
        [UIView animateWithDuration:0.2 animations:^{
            CGRect frame = table_view.frame;
            frame.origin.x = 0;
            table_view.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
    }
    else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(hierarchyOneTableView:chooseIndexs:)]) {
            NSMutableArray *indexs = [[NSMutableArray alloc] initWithArray:picker_choose_indexs];
            [indexs addObject:[NSString stringWithFormat:@"%d",index]];
            
            [self.delegate hierarchyOneTableView:self chooseIndexs:indexs];
        }
    }
}

#pragma mark - NameNaviView delegate
- (void)nameNaviView:(id)sender chooseIndex:(int)index {
    CSNameNaviView *navi = (CSNameNaviView*)sender;
    [navi removeFromIndex:index];
    
    
    int count = (int)picker_choose_indexs.count;
    for (int i=index; i<count; i++) {
        [picker_choose_indexs removeLastObject];
    }
    [self createTableView:index];
    CGRect frame = table_view.frame;
    frame.origin.x = -frame.size.width;
    table_view.frame = frame;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = table_view.frame;
        frame.origin.x = 0;
        table_view.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}


@end
