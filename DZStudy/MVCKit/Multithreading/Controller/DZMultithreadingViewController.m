//
//  DZMultithreadingViewController.m
//  DZStudy
//
//  Created by 杨东正 on 2017/3/23.
//  Copyright © 2017年 Dong Zheng Tech. All rights reserved.
//

#import "DZMultithreadingViewController.h"
#import "DZBaseViewModel.h"

@interface DZMultithreadingViewController ()

@end

@implementation DZMultithreadingViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *dataArray = [NSMutableArray array];
        {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = @"NSThread";
            model.controllerName = nil;
            [dataArray addObject:model];
        }
        {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = @"GCD";
            model.controllerName = nil;
            [dataArray addObject:model];
        }
        {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = @"NSOperation";
            model.controllerName = nil;
            [dataArray addObject:model];
        }
        self.dataSource = dataArray;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Runtime";
}

@end
