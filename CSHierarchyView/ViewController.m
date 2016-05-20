//
//  ViewController.m
//  CSHierarchyView
//
//  Created by e3mo on 16/5/6.
//  Copyright © 2016年 e3mo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *test_arr = @[
                          @{@"name":@"数据0",@"array":@[
                                    @{@"name":@"活动00", @"array":@[
                                              @{@"name":@"选项000", @"array":@[
                                                        @{@"name":@"材料0000", @"array":@[
                                                                  @{@"name":@"设定00000", @"array":@[
                                                                            @{@"name":@"款式000000", @"array":@[
                                                                                      @{@"name":@"模板0000000", @"array":@[
                                                                                                @{@"name":@"编号0000000-00", @"array":@[
                                                                                                          @{@"name":@"位置0000000-000"},
                                                                                                          @{@"name":@"位置0000000-001"},
                                                                                                          @{@"name":@"位置0000000-002"},
                                                                                                          @{@"name":@"位置0000000-003"},
                                                                                                          @{@"name":@"位置0000000-004"},
                                                                                                          @{@"name":@"位置0000000-005"},
                                                                                                          ]},
                                                                                                @{@"name":@"编号0000000-01"},
                                                                                                @{@"name":@"编号0000000-02"},
                                                                                                @{@"name":@"编号0000000-03"},
                                                                                                @{@"name":@"编号0000000-04"},
                                                                                                @{@"name":@"编号0000000-05"},
                                                                                                @{@"name":@"编号0000000-06"},
                                                                                                @{@"name":@"编号0000000-07"},
                                                                                                @{@"name":@"编号0000000-08"},
                                                                                                @{@"name":@"编号0000000-09"},
                                                                                                @{@"name":@"编号0000000-10"},
                                                                                                @{@"name":@"编号0000000-11"},
                                                                                                @{@"name":@"编号0000000-12"},
                                                                                                @{@"name":@"编号0000000-14"},
                                                                                                @{@"name":@"编号0000000-15"},
                                                                                                @{@"name":@"编号0000000-16"},
                                                                                                @{@"name":@"编号0000000-17"},
                                                                                                @{@"name":@"编号0000000-18"},
                                                                                                @{@"name":@"编号0000000-19"},
                                                                                                @{@"name":@"编号0000000-20"},
                                                                                                @{@"name":@"编号0000000-21"},
                                                                                                @{@"name":@"编号0000000-22"},
                                                                                                @{@"name":@"编号0000000-23"},
                                                                                                @{@"name":@"编号0000000-24"},
                                                                                                @{@"name":@"编号0000000-25"},
                                                                                                @{@"name":@"编号0000000-26"},
                                                                                                @{@"name":@"编号0000000-27"},
                                                                                                @{@"name":@"编号0000000-28"},
                                                                                                @{@"name":@"编号0000000-29"},
                                                                                                ]},
                                                                                      @{@"name":@"模板0000001"},
                                                                                      @{@"name":@"模板0000002"},
                                                                                      @{@"name":@"模板0000003"},
                                                                                      @{@"name":@"模板0000004"},
                                                                                      @{@"name":@"模板0000005"},
                                                                                      @{@"name":@"模板0000006"},
                                                                                      @{@"name":@"模板0000007"},
                                                                                      ]},
                                                                            @{@"name":@"款式000001"},
                                                                            @{@"name":@"款式000002"},
                                                                            @{@"name":@"款式000003"},
                                                                            @{@"name":@"款式000004"},
                                                                            @{@"name":@"款式000005"},
                                                                            @{@"name":@"款式000006"},
                                                                            @{@"name":@"款式000007"},
                                                                            @{@"name":@"款式000008"},
                                                                            @{@"name":@"款式000009"},
                                                                            ]},
                                                                  @{@"name":@"设定00001"},
                                                                  @{@"name":@"设定00002"}
                                                                  ]},
                                                        @{@"name":@"材料0001"},
                                                        @{@"name":@"材料0002"},
                                                        @{@"name":@"材料0003"},
                                                        @{@"name":@"材料0004"},
                                                        @{@"name":@"材料0005"},
                                                        @{@"name":@"材料0006"},
                                                        @{@"name":@"材料0007"},
                                                        @{@"name":@"材料0008"},
                                                        @{@"name":@"材料0009"},
                                                        @{@"name":@"材料0010"},
                                                        @{@"name":@"材料0011"},
                                                        @{@"name":@"材料0012"},
                                                        @{@"name":@"材料0013"},
                                                        @{@"name":@"材料0014"},
                                                        @{@"name":@"材料0015"},
                                                        @{@"name":@"材料0016"},
                                                        @{@"name":@"材料0017"},
                                                        @{@"name":@"材料0018"},
                                                        @{@"name":@"材料0019"},
                                                        @{@"name":@"材料0020"},
                                                        @{@"name":@"材料0021"},
                                                        @{@"name":@"材料0022"},
                                                        @{@"name":@"材料0023"},
                                                        @{@"name":@"材料0024"},
                                                        @{@"name":@"材料0025"},
                                                        @{@"name":@"材料0026"},
                                                        @{@"name":@"材料0027"},
                                                        @{@"name":@"材料0028"},
                                                        @{@"name":@"材料0029"},
                                                        @{@"name":@"材料0030"},
                                                        @{@"name":@"材料0031"},
                                                        @{@"name":@"材料0032"},
                                                        @{@"name":@"材料0033"},
                                                        @{@"name":@"材料0034"},
                                                        @{@"name":@"材料0035"},
                                                        @{@"name":@"材料0036"},
                                                        @{@"name":@"材料0037"},
                                                        @{@"name":@"材料0038"},
                                                        @{@"name":@"材料0039"},
                                                        @{@"name":@"材料0040"},
                                                        @{@"name":@"材料0041"},
                                                        @{@"name":@"材料0042"},
                                                        @{@"name":@"材料0043"},
                                                        @{@"name":@"材料0044"},
                                                        ]},
                                              @{@"name":@"选项001", @"array":@[
                                                        @{@"name":@"材料0010"},@{@"name":@"材料0011"},@{@"name":@"材料0012"},@{@"name":@"材料0013"}
                                                        ]},
                                              @{@"name":@"选项002", @"array":@[
                                                        @{@"name":@"材料0020"},@{@"name":@"材料0021"},@{@"name":@"材料0022"}
                                                        ]},
                                              ]},
                                    @{@"name":@"活动01", @"array":@[
                                              @{@"name":@"选项010"},@{@"name":@"选项011"},@{@"name":@"选项012"},@{@"name":@"选项013"}
                                              ]},
                                    @{@"name":@"活动02", @"array":@[
                                              @{@"name":@"选项020"},@{@"name":@"选项021"}
                                              ]},
                                    ]},
                          @{@"name":@"数据1",@"array":@[
                                    @{@"name":@"活动10", @"array":@[
                                              @{@"name":@"选项100"},@{@"name":@"选项101"},@{@"name":@"选项102"}
                                              ]},
                                    @{@"name":@"活动11", @"array":@[
                                              @{@"name":@"选项110"},@{@"name":@"选项111"}
                                              ]},
                                    @{@"name":@"活动12", @"array":@[
                                              @{@"name":@"选项120"},@{@"name":@"选项121"},@{@"name":@"选项122"}
                                              ]},
                                    @{@"name":@"活动13", @"array":@[
                                              @{@"name":@"选项130"},@{@"name":@"选项131"},@{@"name":@"选项132"},@{@"name":@"选项133"},@{@"name":@"选项134"}
                                              ]},
                                    ]},
                          
                          @{@"name":@"数据2",@"array":@[
                                    @{@"name":@"活动20", @"array":@[
                                              @{@"name":@"选项200"},@{@"name":@"选项201"}
                                              ]},
                                    @{@"name":@"活动21", @"array":@[
                                              @{@"name":@"选项210"},@{@"name":@"选项211"},@{@"name":@"选项202"}
                                              ]},
                                    ]},
                          ];
    
    CGSize winsize = [[UIScreen mainScreen] bounds].size;
//    CSHierarchyView *view = [[CSHierarchyView alloc] initWithFrame:CGRectMake(0, 20, winsize.width, winsize.height-20) array:test_arr bgColor:nil highlightedColor:nil labelColor:nil lineColor:nil textSize:0];
    CSHierarchyOneTableView *view = [[CSHierarchyOneTableView alloc] initWithFrame:CGRectMake(0, 20, winsize.width, winsize.height-20) array:test_arr bgColor:nil highlightedColor:nil labelColor:nil lineColor:nil textSize:0];
    [view setBackgroundColor:[UIColor clearColor]];
    view.delegate = self;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"11111111");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hierarchyView:(id)sender chooseIndexs:(NSArray *)indexs {
    NSLog(@"indexs = %@",indexs);
}

- (void)hierarchyOneTableView:(id)sender chooseIndexs:(NSArray *)indexs {
    NSLog(@"indexs = %@",indexs);
}

@end
