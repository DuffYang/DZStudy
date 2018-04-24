//
//  DZJSPatchViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/24.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZJSPatchViewController.h"

@interface DZJSPatchViewController ()

@end

@implementation DZJSPatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *titles = @[@"JSPatch原理"];
    NSMutableArray *dataArray = [NSMutableArray array];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZBaseViewModel *model = [DZBaseViewModel new];
        model.title = obj;
        model.url = @"http://blog.cnbang.net/tech/2808/";
        [dataArray addObject:model];
    }];
    self.dataSource = dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
