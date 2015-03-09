//
//  ViewController.m
//  UINavigationController
//
//  Created by hx_leichunxiang on 14-11-23.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  内容：设置UINavigationController的导航栏、工具栏
//  实现的管理者型属性：1、self.navigationController.navigationBar，管理导航栏；2、1、self.navigationController.toolBar，管理工具栏。
//  重点：导航控制器的层次结构。
/*
 总结：
 1、UINavigationController给它所拥有的所有视图控制器，提供了一个共有的navigationBar、toolBar视图.
 2、通过设置UINavigationController的navigationBar的属性，来改变所有UINavigationController的视图控制器为当前视图控制器时，navigationBar的效果。同理，toolBar也是。可以看出，1-1、1-2、1-3、1-4的方法都是通过navigationBar调用方法或者设置属性来实现的。
 3、UINavigationController所拥有的所有视图控制器没有navigationBar、toolBar两个属性。

 
 扩展总结：
 1、要管理一个对象，把这个对象变为管理者的属性就好；例如，把导航栏navigationBar变成UINavigationController的属性。
 
 写demo总结：
 1、单个功能的快速学习：只要知道管理对象是谁，掌握常用的一种方法就可以了。
 列如 1-2：设置导航栏背景色，管理对象是navigationBar，掌握用图片资源可以背景色就可以了。因为知道管理对象了，就可以想出用什么资源，调其他方法也可以实现了，就没必要都写出来了。实现功能时参杂太多东西，反而把简单功能复杂化了，越写越晕，单个功能快速学习怎么简单怎么写demo。
 2、单个功能的多种实现方法的学习：先单种方法简单实现，然后用swich语句，并封装成单个方法。列如，1-2.
*/


#import "ViewController.h"
#import "ItemViewController.h"

@interface ViewController ()
{
    BOOL _isHidden;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    //navigationBar
    [self setNavigationBarStyle:0];
    [self setNavigationBarBackground:2];
    [self addSubviewInNavigationBar];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(0, 220, 120, 60);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn setTitle:@"隐藏/显示导航栏" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(setNavigationBarHidden) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    //toolBar
    [self showSystemToolBar];
    
    //ToNectVC
    [self.view addSubview:[self getCustomButton]];//跳转到下一个控制器
}

- (UIButton *)getCustomButton{
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(0, 100, 120, 60);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn setTitle:@"pushNextVC" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(pushNextVC) forControlEvents:UIControlEventTouchUpInside];
    return testBtn;
}

- (void)pushNextVC{
    ItemViewController *vc = [[ItemViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 1 设置导航栏的风格、背景

#pragma mark - 1-1 style即风格

- (void)setNavigationBarStyle:(NSInteger)methodNum
{
    switch (methodNum) {
        case 0:
            //    1-1 一般用这个方法设置导航栏风格
            //当translucent = NO: 原点y坐标下移动44，且变为完全透明。
            self.navigationController.navigationBar.translucent = NO;//translucent：透亮的、半透明的。
            break;
        case 1:
            //    1-2 此方法基本不用
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;//半透明的
    }
    
}

#pragma mark - 1-2 背景色、背景图片

- (void)setNavigationBarBackground:(NSInteger)methodNum
{
    switch (methodNum) {
        case 0:
            //UIColor
            [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
            break;
        case 1:
            //图片生产UIColor
            [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_bar_image2"]]];
            break;
        case 2:
            //高分辨率@2x图片
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_image2"] forBarMetrics:UIBarMetricsDefault];
            break;
        default:
            break;
    }
}

#pragma mark - 1-3 导航栏navigationbar作为父视图，添加子势图，遮盖原有导航栏的部分或者全部

- (void)addSubviewInNavigationBar
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
    v.backgroundColor = [UIColor purpleColor];
    [self.navigationController.navigationBar addSubview:v];
}

#pragma mark - 1-4  隐藏导航栏navigationbar

- (void)setNavigationBarHidden
{
    _isHidden = !_isHidden;
    [self.navigationController.navigationBar setHidden:_isHidden];
}

#pragma mark - 2 设置工具栏：toolBar一般不用

#pragma mark - 2-1 显示工具栏

//默认隐藏toolBar
- (void)showSystemToolBar
{
    [self.navigationController setToolbarHidden:NO];
    self.navigationController.toolbar.barStyle = UIBarStyleDefault;
    [self.navigationController.toolbar setTintColor:[UIColor greenColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
