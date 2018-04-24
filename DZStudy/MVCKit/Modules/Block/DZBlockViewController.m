//
//  DZBlockViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/18.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZBlockViewController.h"

@interface DZBlockViewController ()

@end

@implementation DZBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"Block原理"];
    NSArray *urls = @[@"https://www.jianshu.com/p/51d04b7639f1"];
    NSMutableArray *dataArray = [NSMutableArray array];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZBaseViewModel *model = [DZBaseViewModel new];
        model.title = obj;
        model.url = urls[idx];
        [dataArray addObject:model];
    }];
    self.dataSource = dataArray;
}

@end
