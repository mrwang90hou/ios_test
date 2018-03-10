//
//  ConfirmLoginViewController.m
//  git_test02
//
//  Created by 王宁 on 2018/3/9.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import "ConfirmLoginViewController.h"

@interface ConfirmLoginViewController ()

@end

@implementation ConfirmLoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
}
//关闭操作
- (IBAction)btn_close_action:(id)sender {
    
#pragma mark - 应该修改为回到主视图
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}
//登录操作
- (IBAction)btn_login_action:(id)sender {
    //S1:跳转输入验证码页面
    //S2:验证身份🆔是否正确✔️
    
}
//取消登录
- (IBAction)btn_logout_action:(id)sender {
    
#pragma mark - 应该修改为回到主视图
    //TODO:应该修改为回到主视图
    //FIXME:应该修改为回到主视图
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
