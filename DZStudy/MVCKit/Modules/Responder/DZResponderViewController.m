//
//  DZResponderViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/19.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZResponderViewController.h"
#import <SafariServices/SafariServices.h>

@interface DZResponderViewController ()

@end

@implementation DZResponderViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *titles = @[@"https://www.cnblogs.com/W-Kr/p/5200463.html"];
        NSMutableArray *dataArray = [NSMutableArray array];
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = obj;
            model.url = obj;
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
    NSURL *url = [NSURL URLWithString:@"https://www.cnblogs.com/W-Kr/p/5200463.html"];
    SFSafariViewController *safariVc = [[SFSafariViewController alloc] initWithURL:url];
    // 官方推荐我们用modal的形式
    [self presentViewController:safariVc animated:NO completion:nil];
}

@end
