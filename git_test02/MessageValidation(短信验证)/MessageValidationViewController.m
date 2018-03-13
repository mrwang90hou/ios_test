//
//  MessageValidationViewController.m
//  git_test02
//
//  Created by 国方商标 on 2018/3/13.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageValidationViewController.h"
#import "SVProgressHUD.h"
@interface MessageValidationViewController()

@end

@implementation MessageValidationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"短信验证";
    self.view.backgroundColor = [UIColor brownColor];

    //导航栏样式button
     //返回按钮
     UIBarButtonItem *back_btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    [self.navigationItem setLeftBarButtonItem:back_btn];
    
    
    //重新发送
    UIButton  *return_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [return_btn setTitle:@"重新发送" forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:return_btn];
    [return_btn addTarget:self action:@selector(returnSend) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
}

-(void)backClick
{
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)returnSend{
    [SVProgressHUD showSuccessWithStatus:@"重新发送短信验证码！"];
    
}



@end
