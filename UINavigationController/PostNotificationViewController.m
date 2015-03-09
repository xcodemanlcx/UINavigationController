//
//  PostNotificationViewController.m
//  UINavigationController
//
//  Created by hx_leichunxiang on 14-11-25.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  通知中心：发送带传递参数的通知

#import "PostNotificationViewController.h"

@interface PostNotificationViewController ()

@end

@implementation PostNotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"post";
    NSArray *arr = @[@"通知传来的参数1",@"通知传来的参数2",@"通知传来的参数3"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"senderValue" object:arr userInfo:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
