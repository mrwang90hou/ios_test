//
//  LoginViewController.m
//  git_test02
//
//  Created by 王宁 on 2018/3/7.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import <UIKit/UIKit.h>


@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    // 如果A控制器的view成为B控制器的view的子控件,那么A控制器成为B控制器的子控制器
    //
    //UITabBarController *tabBarVc = [[UITabBarController alloc] init];
    
    // 添加子控制器
    //[self addChildViewController:tabBarVc];
}
- (IBAction)back:(id)sender {
    
    //返回到之前的视图控制器
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
