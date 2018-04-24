//
//  DZSDWebImageViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/24.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZSDWebImageViewController.h"

@interface DZSDWebImageViewController ()

@end

@implementation DZSDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"SDWebImage原理", @"SDWebImage源码解析", @"SDWebImageDecoder引发的思考"];
    NSArray *urls = @[
                      @"https://www.cnblogs.com/jys509/p/5199997.html",
                      @"https://www.jianshu.com/p/bf7a6a16af06",
                      @"https://www.jianshu.com/p/c245f409c74b"];
    NSMutableArray *dataArray = [NSMutableArray array];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZBaseViewModel *model = [DZBaseViewModel new];
        model.title = obj;
        model.url = urls[idx];
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
