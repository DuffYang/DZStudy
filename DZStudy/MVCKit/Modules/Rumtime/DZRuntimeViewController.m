//
//  DZRuntimeViewController.m
//  DZStudy
//
//  Created by 杨东正 on 2017/3/23.
//  Copyright © 2017年 Dong Zheng Tech. All rights reserved.
//

#import "DZRuntimeViewController.h"

#import "DemoObj.h"
#include <objc/runtime.h>
#import <SafariServices/SafariServices.h>

@interface DZRuntimeViewController ()

@end

@implementation DZRuntimeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *titles = @[@"runtime十种用法",
                            @"1.将某些OC代码转为运行时代码，探究底层，比如block的实现原理（上边已讲到）；",
                            @"2.拦截系统自带的方法调用（Swizzle 黑魔法）,也可以说成对系统的方法进行替换",
                            @"3.实现分类也可以增加属性",
                            @"4.实现NSCoding的自动归档和自动解档",
                            @"5.实现字典和模型的自动转换",
                            @"6.动态增加方法  (动态的为某个类或对象增加一个方法,摘录文章中有详细介绍)",
                            @"7.动态变量控制  (动态对某个对象的变量的值进行替换,摘录文章有详细介绍)",
                            @"8.实现万能控制器跳转",
                            @"9.插件开发",
                            @"10.Jspath 热更新 也是使用运行时，jspatch 基本上算是黑科技，在线修复版本bug，微信都使用了这个技术，详情百度“JSPatch”，此处省略30000字"];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSURL *url = [NSURL URLWithString:@"https://www.jianshu.com/p/3182646001d1"];
    SFSafariViewController *safariVc = [[SFSafariViewController alloc] initWithURL:url];
    // 官方推荐我们用modal的形式
    [self presentViewController:safariVc animated:NO completion:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

///动态替换方法
- (IBAction)replaceMethod {
    DemoObj *obj = [DemoObj new];
    
    [obj replaceMethod];
    
    [obj eat];
}


static const char associatedKey;
///动态挂载对象
- (IBAction)addObject {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"我是DemoObj动态挂载的" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    DemoObj *obj = [DemoObj new];
    objc_setAssociatedObject(obj, &associatedKey, alert, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getAssociatedObject:obj];
    });
    
}

- (void)getAssociatedObject:(DemoObj *)obj {
    
    UIAlertView *alert = objc_getAssociatedObject(obj, &associatedKey);
    [alert show];
}


- (IBAction)createCalss:(id)sender {
    
    const char *className = "MyClass";
    
    ///声明类
    Class MyClass = objc_getClass(className);
    if (!MyClass) {
        Class supercls = [NSObject class];
        MyClass = objc_allocateClassPair(supercls, className, 0);
    }
    
    
    ///添加一个属性
    objc_property_attribute_t type = { "T", "@\"NSString\"" };
    objc_property_attribute_t ownership = { "C", "" }; // C = copy
    objc_property_attribute_t backingivar  = { "V", "aProperty" };
    objc_property_attribute_t attribute[] = { type, ownership, backingivar };
    class_addIvar(MyClass, "aProperty", sizeof(NSString *), 0, "@");
    class_addProperty(MyClass, "aProperty", attribute, 1);
    class_addMethod(MyClass, @selector(aProperty), (IMP)aProperty, "@@:");
    class_addMethod(MyClass, @selector(setAPriperty:), (IMP)setAPriperty, "v@:@");
    
    
    ///添加一个变量
    class_addIvar(MyClass, "aIvar", sizeof(NSString *), 0, "@");
    
    
    ///添加一个方法
    class_addMethod(MyClass, @selector(aMethod:), (IMP)aMethod, "v@:@");
    objc_registerClassPair(MyClass);
    
    
    //替换方法
    class_replaceMethod(MyClass, @selector(description), (IMP)description, "@@:");
    
    
    //***********类的实例化*************
    
    id myObj = [MyClass new];
    
    Ivar ivar = class_getInstanceVariable(MyClass, "aIvar");
    object_setIvar( myObj, ivar, @"你好我是iVar");
    
    [myObj setAPriperty:@"这是property_____"];
    
    NSLog(@"----%@===",[myObj aProperty]);
    
    [myObj aMethod:100];
    
    
    NSString *des = [myObj description];
    //    id instence = getObjectFrom
    NSLog(@"------%@", des);
    
}

//*******************属性的添加***********************
///get方法
NSString *aProperty(id SELF, SEL _cmd) {
    Ivar ivar = class_getInstanceVariable([SELF class], "aProperty");
    return object_getIvar(SELF, ivar);
}

- (NSString *)aProperty {
    return @"";
}
///set方法
void setAPriperty(id SELF, SEL _cmd, NSString *aProperty) {
    Ivar ivar = class_getInstanceVariable([SELF class], "aProperty");
    id oldName = object_getIvar(SELF, ivar);
    if (oldName != aProperty){
        object_setIvar(SELF, ivar, [aProperty copy]);
    }
}

- (void)setAPriperty:(NSString *)aPriperty {
    
}


//*********************方法的添加****************************

void aMethod(id SELF, SEL _cmd, int a) {
    NSLog(@"调用好了方法...\n传入的参数为:%d", a);
    
    [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"传入值为%d", a] message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
}

- (void)aMethod:(int )a {
    
}


//*********************方法的替换**************************

NSString *description(id SELF, SEL _cmd) {
    
    
    
    
    return @"fasdfasdfasdfsdf";
}


@end
