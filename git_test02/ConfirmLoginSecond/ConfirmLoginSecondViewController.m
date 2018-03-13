//
//  ConfirmLoginSecondViewController.m
//  git_test02
//
//  Created by 国方商标 on 2018/3/13.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfirmLoginSecondViewController.h"
#import <Masonry.h>
#import "SVProgressHUD.h"
#import "MessageValidationViewController.h"
@interface ComfirmLoginSceondViewController()
@property (strong,nonatomic)UIButton *close_btn;   //关闭按钮
@property (strong,nonatomic)UIImage *picture_computer;//图片显示
@property (strong,nonatomic)UILabel *loginLale;//图片显示
@property (strong,nonatomic)UIButton *login_btn;   //登录
@property (strong,nonatomic)UIImage *logout_btn;    //取消登录


@end
@implementation ComfirmLoginSceondViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    //设置背景颜色:黄色
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //初始化控件
    [self initView];
    
}
-(void)initView{
    
    
#pragma mark -导航栏样式button【弃用】
    //导航栏样式close_btn
    UIBarButtonItem *close_btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    [close_btn setTintColor:[UIColor greenColor]];
    [self.navigationItem setLeftBarButtonItem:close_btn];
    
    
    
    
    
    
    
    
    
    
    
    //login_btn
    UIButton  *login_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    login_btn.frame = CGRectMake(60, 60, 250, 40);
    [login_btn setTitle:@"登录" forState:UIControlStateNormal];
    login_btn.titleLabel.font = [UIFont systemFontOfSize:22];
    [login_btn addTarget:self action:@selector(pageJump2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login_btn];
    
    
    
    //logout_btn
    UIButton  *logout_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    logout_btn.frame = CGRectMake(99, 99, 250, 40);
    [logout_btn setTitle:@"取消登录" forState:UIControlStateNormal];
    logout_btn.titleLabel.font = [UIFont systemFontOfSize:22];
    [logout_btn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logout_btn];
    
    
    
    
}
-(void)backClick
{
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)pageJump2{
    MessageValidationViewController *messageView = [[MessageValidationViewController alloc]init];
    UINavigationController *nView = [[UINavigationController alloc]initWithRootViewController:messageView];
    //设置跳转动画：水平翻转
    nView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:nView animated:YES completion:nil];
    [SVProgressHUD showSuccessWithStatus:@"短信验证！"];
}
@end
