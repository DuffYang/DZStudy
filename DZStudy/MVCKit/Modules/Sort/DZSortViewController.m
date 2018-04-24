//
//  DZSortViewController.m
//  DZStudy
//
//  Created by Yang,Dongzheng on 2018/4/18.
//  Copyright © 2018年 Dong Zheng Tech. All rights reserved.
//

#import "DZSortViewController.h"
#import "SortUtil.h"
#import "DZBaseViewModel.h"

@interface DZSortViewController ()

@end

@implementation DZSortViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *titles = @[@"插入排序",
                            @"希尔排序",
                            @"选择排序",
                            @"堆排序",
                            @"冒泡排序",
                            @"快速排序",
                            @"归并排序",
                            @"基数排序",];
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
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self inserSort:nil];
            break;
        case 1:
            [self shellSort:nil];
            break;
        case 2:
            [self selectSort:nil];
            break;
        case 3:
            [self heapSort:nil];
            break;
        case 4:
            [self bubbleSort:nil];
            break;
        case 5:
            [self quickSort:nil];
            break;
        case 6:
            [self megerSort:nil];
            break;
        case 7:
            [self radixSort:nil];
            break;
        default:
            break;
    }
}

#pragma mark --- 插入排序
- (IBAction)inserSort:(id)sender {
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObjectsFromArray:@[@4,@1,@2,@5]];
    [SortUtil inserSort:sortArray];
}
#pragma mark --- 希尔排序
- (IBAction)shellSort:(id)sender {
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObjectsFromArray:@[@9,@1,@2,@5,@7,@4,@8,@6,@3,@5]];
    [SortUtil shellSort:sortArray];
}
#pragma mark --- 选择排序
- (IBAction)selectSort:(id)sender {
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObjectsFromArray:@[@9,@1,@2,@5,@7,@4,@8,@6,@3,@5]];
    [SortUtil selectSort:sortArray];
}
#pragma mark --- 堆排序
- (IBAction)heapSort:(id)sender {
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObjectsFromArray:@[@1,@3,@4,@5,@2,@6,@9,@7,@8,@0]];
    [SortUtil heapSort:sortArray];
}
#pragma mark --- 冒泡排序
- (IBAction)bubbleSort:(id)sender {
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObjectsFromArray:@[@4,@3,@1,@2,@5]];
    [SortUtil bubbleSort:sortArray];
    
}
#pragma mark --- 快速排序
- (IBAction)quickSort:(id)sender {
    int a[] = {4, 6, 5, 7, 2, 1, 3};
    quickSort(a, 0, sizeof(a) / sizeof(a[0]) - 1);/*这里原文第三个参数要减1否则内存越界*/
}
#pragma mark --- 归并排序
- (IBAction)megerSort:(id)sender {
//    NSMutableArray *sortArray = [NSMutableArray array];
//    [sortArray addObjectsFromArray:@[@8,@4,@7,@7,@1,@3,@6,@2]];
//    [SortUtil megerSort:sortArray];
    
    int a[8] = {4, 3, 2, 1, 6, 5, 8, 7};
    int i, b[8];
    MergeSort(a, b, 0, 7);
    for(i=0; i<8; i++)
        printf("%d ", a[i]);
    printf("\n");
}
#pragma mark --- 基数排序
- (IBAction)radixSort:(id)sender {
    NSMutableArray *sortArray = [NSMutableArray array];
    [sortArray addObjectsFromArray:@[@73,@22,@93,@43,@55,@14,@28,@65,@39,@81]];
    [SortUtil radixSort:sortArray];
}


@end
