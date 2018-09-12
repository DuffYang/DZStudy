//
//  DZJIanShuViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/25.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZJIanShuViewController.h"

@interface DZJIanShuViewController ()

@end

@implementation DZJIanShuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"2018 iOS 面试法宝+绝密文件",
                        @"HTTP深入浅出 http请求"];
    NSArray *urls = @[@"https://www.jianshu.com/p/a5e2246b07be",
                      @"https://www.jianshu.com/p/425123b94bb5"];
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
