//
//  DZUtils.m
//  DZStudy
//
//  Created by 杨东正 on 2017/3/24.
//  Copyright © 2017年 Dong Zheng Tech. All rights reserved.
//

#import "DZUtils.h"
#import "DZBaseViewModel.h"

@implementation DZUtils

+ (NSArray *)arrayWithPlistFileName:(NSString *)name {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

+ (NSArray *)dataSourceWithFileName:(NSString *)name {
    NSArray *originArray = [self arrayWithPlistFileName:name];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *itemInfo in originArray) {
        DZBaseViewModel *model = [DZBaseViewModel new];
        model.title = [itemInfo objectForKey:@"title"];
        model.controllerName = [itemInfo objectForKey:@"protocol"];;
        [dataArray addObject:model];
    }
    return dataArray;
}

@end
