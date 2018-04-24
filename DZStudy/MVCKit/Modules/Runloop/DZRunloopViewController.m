//
//  DZRunloopViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/18.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZRunloopViewController.h"
#import "DZBaseViewModel.h"
#import <SafariServices/SafariServices.h>

@interface DZRunloopViewController ()

@end

@implementation DZRunloopViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *titles = @[@"https://github.com/fanren5119/iOS-runloop"];
        NSMutableArray *dataArray = [NSMutableArray array];
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = obj;
            [dataArray addObject:model];
        }];
        self.dataSource = dataArray;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSURL *url = [NSURL URLWithString:@"https://github.com/fanren5119/iOS-runloop"];
    SFSafariViewController *safariVc = [[SFSafariViewController alloc] initWithURL:url];
    // 官方推荐我们用modal的形式
    [self presentViewController:safariVc animated:NO completion:nil];
}

@end
