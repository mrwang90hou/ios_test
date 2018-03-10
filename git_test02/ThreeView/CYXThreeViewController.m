//
//  CYXThreeViewController.m
//  
//
//  Created by Macx on 15/9/4.
//  Copyright (c) 2015年 CYX. All rights reserved.
//  分类控制器

#import "CYXThreeViewController.h"
#import <objc/runtime.h>
#import <SVProgressHUD.h>
#import "CYXTableViewController.h"
#import "ConfirmLoginViewController.h"

@interface CYXThreeViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) CYXTableViewController *tableView;
@property (weak, nonatomic) IBOutlet UITextField *useName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *okLab;
@property (strong, nonatomic) IBOutlet UIButton *back_btn;

@end

@implementation CYXThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor yellowColor];
    
    /*
    // 获得所有的成员变量
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList([UIPageControl class], &outCount);
    
    // 遍历所有的成员变量
    for (int i = 0; i < outCount; i++) {
        // 获得第i个成员变量
        Ivar ivar = ivarList[i];
        
        // 获得成员变量的名称和类型
        NSLog(@"%@ -> %s = %s", [UIPageControl class], ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    // 释放资源
    free(ivarList);
     */
    
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnClick:(UIButton *)sender {
    if ([self.useName.text isEqualToString:@"1"] && [self.password.text isEqualToString:@"1"]) {
        //        [sender setTitle:@"登录成功.." forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        //self.tableView = [CYXTableViewController new];
        //[self.navigationController pushViewController:self.tableView animated:YES];
        //页面跳转
        [self pageJump];
        
    } else {
        [SVProgressHUD showErrorWithStatus:@"用户名或密码错误！"];
    }
    
}
- (IBAction)switchClick:(UISwitch *)sender {
    
    if (sender.isOn) {
        self.okLab.text = @"同意协议";
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)back_action:(id)sender {
    
    
//返回到之前的视图控制器
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)touchView:(id)sender {
    [self.view endEditing:YES];

}

// 输入的回车键键
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideInput];
    return YES;
}
// 隐藏键盘
- (void)hideInput {
    [_useName endEditing:YES];
    [_password endEditing:YES];
}

-(void)pageJump{

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"ConfirmLoginViewController" bundle:nil];
    //设置即将要跳转的页面
    ConfirmLoginViewController *comfirmLogin = [storyBoard instantiateInitialViewController];
    //设置转变模式，为反转分格
    comfirmLogin.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;
    //现在开启动画
    [self presentViewController:comfirmLogin animated:YES completion:nil];
    
    [SVProgressHUD showSuccessWithStatus:@"页面跳转成功！"];
}
@end
