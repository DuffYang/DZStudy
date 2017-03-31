//
//  DZRuntimeViewController.m
//  DZStudy
//
//  Created by 杨东正 on 2017/3/23.
//  Copyright © 2017年 Dong Zheng Tech. All rights reserved.
//

#import "DZRuntimeViewController.h"
#import "DZBaseViewModel.h"

@interface DZRuntimeViewController ()

@end

@implementation DZRuntimeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *dataArray = [NSMutableArray array];
        {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = @"JSPatch";
            model.controllerName = nil;
            [dataArray addObject:model];
        }
        {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = @"黑魔法";
            model.controllerName = nil;
            [dataArray addObject:model];
        }
        self.dataSource = dataArray;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"initWithNibName");
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initWithCoder");
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"awakeFromNib");
}

- (void)loadView {
    [super loadView];
    
    NSLog(@"loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Runtime";
}

@end
