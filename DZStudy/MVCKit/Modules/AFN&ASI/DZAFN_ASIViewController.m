//
//  DZAFN_ASIViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/24.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZAFN_ASIViewController.h"

@interface DZAFN_ASIViewController ()

@end

@implementation DZAFN_ASIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"AFN和ASI"];
    NSMutableArray *dataArray = [NSMutableArray array];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZBaseViewModel *model = [DZBaseViewModel new];
        model.title = obj;
        model.url = @"https://blog.csdn.net/iosbird/article/details/52087038";
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
