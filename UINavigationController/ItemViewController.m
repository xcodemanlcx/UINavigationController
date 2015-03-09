//
//  ItemViewController.m
//  UINavigationController
//
//  Created by hx_leichunxiang on 14-11-23.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  内容：设置 导航控制器管理的 视图控制器在导航栏、工具栏上 特有的 视图或者效果。
//  实现的管理者型属性：1、视图控制器的navigationItem属性；2、以及navigationItem的UIBarButtonItem属性；3、视图控制器的toolBarItems属性。
//  注意：视图控制器是有(管理者型属性)navigationItem，没有属性navigationBar；导航控制器(有管理者型属性)navigationBar，没有属性navigationItem。

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1 self.navigationItem的UIBarButtonItem等属性
    
    //1-1 设置标题
    [self setTitleFortViewControllerNavBar:0];
    
    //1-2 设置UIBarButtonItem,即在navigationBar上设置或添加属于当前视图控制器的特有视图。
    self.navigationItem.rightBarButtonItem = [self setBarButtonItemForViewControllerNavBar:1];
    
    //1-3 隐藏系统返回按钮
    UIButton *testBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn1.frame = CGRectMake(0, 100+120, 200, 60);
    testBtn1.backgroundColor = [UIColor redColor];
    [testBtn1 setTitle:@"隐藏系统返回按钮" forState:UIControlStateNormal];
    [testBtn1 addTarget:self action:@selector(hiddenVCBackButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn1];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(0, 100, 200, 60);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn setTitle:@"popToPreviousVC" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(popToPreviousVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    //2  添加自定义的toolBar上的Items
    [self getNewToolbar];
    
    [self getSysToolbar];


}

- (void)popToPreviousVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 1 设置视图控制器在导航栏上 特有视图或者效果：标题、UIBarButtonItem、隐藏默认返回按钮

#pragma mark - 1-1 标题

- (void)setTitleFortViewControllerNavBar:(NSInteger )methodNum{
    switch (methodNum) {
        case 0:
            //1-1
            self.title = @"self.title";
            break;
        case 1:
            //1-2
            self.navigationItem.title = @"self.navigationItem.title";
            break;
        case 2:
            //1-3 自定义title视图。
        {
            UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
            titleView.backgroundColor = [UIColor orangeColor];
            titleView.text = @"自定义titleView";
            self.navigationItem.titleView = titleView;
        }
            break;
        default:
            break;
    }
}

#pragma mark - 1-2 UIBarButtonItem

- (UIBarButtonItem *)setBarButtonItemForViewControllerNavBar:(NSInteger)methodNum{
    switch (methodNum) {
        case 0:
            //2-0 图片设置
        {
            return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_praise"] style:UIBarButtonItemStylePlain target:self action:@selector(pushNextVC)];
        }
            break;
        case 1:
            //2-1 标题设置
        {
            return [[UIBarButtonItem alloc] initWithTitle:@"PushToNextVC" style:UIBarButtonItemStylePlain target:self action:@selector(pushNextVC)];
        }
            break;
        case 2:
            //2-2 系统图标
        {
            return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pushNextVC)];
        }
            break;
        case 3:
        {
            //2-3 自定义
            return [[UIBarButtonItem alloc] initWithCustomView:[self getCustomButton]];
        }
            break;
        default:
            return nil;
            break;
    }
}

- (void)pushNextVC
{
    ItemViewController *vc = [[ItemViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)getCustomButton{
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(0, 0, 120, 30);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn setTitle:@"自定义" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(pushNextVC) forControlEvents:UIControlEventTouchUpInside];
    return testBtn;
}

#pragma mark - 1-3 隐藏默认返回按钮

- (void)hiddenVCBackButton
{
    [self.navigationItem setHidesBackButton:YES animated:YES];
}

#pragma mark - 2 toolBar

#pragma mark - 2-1-1 自定义与系统的toolBar

//自定义
- (void )getNewToolbar
{
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 44)];
    toolbar.barTintColor = [UIColor  orangeColor];
    [self.view addSubview:toolbar];
    
    [toolbar setItems:[self getItems]];
}

//系统
- (void)getSysToolbar
{
    [self setToolbarItems:[self getItems]];
}

#pragma mark - 2-2 toolbarItems间隔 的调整

- (NSArray *)getItems
{
    // 系统自动调整的 toolbar间隔
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //  自定义 toolbar间隔
    UIBarButtonItem *fixSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    fixSpace.width = 5;
    
    UIBarButtonItem *item0 = [self setBarButtonItemForViewControllerNavBar:0];
    UIBarButtonItem *item1 = [self setBarButtonItemForViewControllerNavBar:0];
    UIBarButtonItem *item2 = [self setBarButtonItemForViewControllerNavBar:0];
    UIBarButtonItem *item3 = [self setBarButtonItemForViewControllerNavBar:0];
    UIBarButtonItem *item4 = [self setBarButtonItemForViewControllerNavBar:0];
    NSArray *items = @[item0,flexibleSpace,item1,flexibleSpace,item2,flexibleSpace,item3,fixSpace,item4];
    return items;
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
