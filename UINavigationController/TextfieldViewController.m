//
//  TextfieldViewController.m
//  UINavigationController
//
//  Created by hx_leichunxiang on 14-11-25.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  内容：控制器视图 的导航栏 默认不跟控制器视图一起移动。
//

#import "TextfieldViewController.h"
#import "PostNotificationViewController.h"

@interface TextfieldViewController ()<UITextFieldDelegate>
{
    UITextField *_textField;
}
@end

@implementation TextfieldViewController

- (void)loadView
{
    [super loadView];
    UIScrollView *v = [[UIScrollView alloc] initWithFrame:CGRectMake(64, 0, 200, 200)];
    v.backgroundColor = [UIColor orangeColor];
    self.view = v;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"导航";
//    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(nextVC)];
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 320, 60)];
    _textField.backgroundColor = [UIColor redColor];
    _textField.delegate = self;
    [self.view addSubview:_textField];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSenderValue:) name:@"senderValue" object:nil];
}

- (void)showSenderValue:(NSNotification *)obj
{
    NSArray *arr = obj.object;
    NSLog(@"%@**%@**%@**%@**",arr[0],arr[1],arr[2],arr);
}

- (void)nextVC
{
    PostNotificationViewController *vc = [[PostNotificationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self changeFrame:self.view height:-50];
    [_textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self changeFrame:self.view height:50];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

- (void)changeFrame:(UIView *)view height:(CGFloat)height
{
    CGRect frame = view.frame;
    frame.origin.y += height;
    view.frame = frame;
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
