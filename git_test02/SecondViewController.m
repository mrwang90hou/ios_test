//
//  SecondViewController.m
//  PageJump
//
//  Created by 王宁 on 2018/3/9.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@end
@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    self.view.backgroundColor = [UIColor brownColor];
    //创建一个btn按钮
    UIButton  *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(20, 30, 250, 40);
    [btn setTitle:@"返回页面" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:22];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnClick
{
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




@end
