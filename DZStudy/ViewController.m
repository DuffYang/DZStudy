//
//  ViewController.m
//  DZStudy
//
//  Created by 杨东正 on 2017/3/21.
//  Copyright © 2017年 Dong Zheng Tech. All rights reserved.
//

#import "ViewController.h"

#import "DZRuntimeViewController.h"
#import "DZMultithreadingViewController.h"
#import "DZRuntimeViewController.h"

#import "DZBaseViewModel.h"

#import "DZUtils.h"

@interface ViewController ()
@end

@implementation ViewController

- (instancetype)initWithCoder:aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.dataSource = [DZUtils dataSourceWithFileName:@"HomeViewDataSource"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"基本知识";
}

@end
