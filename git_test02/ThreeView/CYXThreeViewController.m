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
#import "ConfirmLoginSecondViewController.h"
@interface CYXThreeViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) CYXTableViewController *tableView;
@property (weak, nonatomic) IBOutlet UITextField *useName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *okLab;
@property (strong, nonatomic) IBOutlet UIButton *back_btn;
@property (strong, nonatomic) IBOutlet UISwitch *switch_btn;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seg_conntrol;

@end

@implementation CYXThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData];//自动填写数据
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
    if ([self.useName.text isEqualToString:@"wangning"] && [self.password.text isEqualToString:@"wangning"]) {
        //        [sender setTitle:@"登录成功.." forState:UIControlStateNormal];
        if ([self check_agree] == false) {//检查是否同意协议
            return;
        }
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        //self.tableView = [CYXTableViewController new];
        //[self.navigationController pushViewController:self.tableView animated:YES];
        switch (_seg_conntrol.selectedSegmentIndex) {
            case 0:
                [self pageJump1];
                break;
            case 1:
                [self pageJump2];
                break;
            case 2:
                [self pageJump3];
                break;
            default:
                [SVProgressHUD showErrorWithStatus:@"选择跳转的页面方式错误❌！"];
                break;
        }
    } else {
        [SVProgressHUD showErrorWithStatus:@"用户名或密码错误！"];
    }
    
}
- (IBAction)switchClick:(UISwitch *)sender {
    
    if (sender.isOn) {
        self.okLab.text = @"同意协议";
    }else
    {
        self.okLab.text = @"不同意协议";
    }
}
-(bool)check_agree{
    if (_switch_btn.isOn == false) {
        [SVProgressHUD showErrorWithStatus:@"请先同意协议！"];
        return false;
    }
    else
    {
        return true;
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
#pragma mark 方式一：storyboard跳转方式
-(void)pageJump1{

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"ConfirmLoginViewController" bundle:nil];
    //设置即将要跳转的页面
    ConfirmLoginViewController *comfirmLogin = [storyBoard instantiateInitialViewController];
    //设置转变模式，为反转分格
    comfirmLogin.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;
    //现在开启动画
    //[self dismissViewControllerAnimated:YES completion:nil];

    [self presentViewController:comfirmLogin animated:YES completion:nil];
    
    [SVProgressHUD showSuccessWithStatus:@"页面方式一跳转成功！"];
}
#pragma mark 方式二：纯代码跳转方式
-(void)pageJump2{
    
    //设置要进入的页面
    ComfirmLoginSceondViewController *secondVC = [[ComfirmLoginSceondViewController alloc]init];
    UINavigationController *nVC = [[UINavigationController alloc]initWithRootViewController:secondVC];
    //设置跳转动画：从下至上
    secondVC.modalTransitionStyle = UIModalPresentationFullScreen;
    
    //现在开启动画
    [self presentViewController:nVC animated:YES completion:nil];
    
    [SVProgressHUD showSuccessWithStatus:@"页面方式二跳转成功！"];
}
#pragma mark 方式三：xib布局----跳转方式
-(void)pageJump3{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"ConfirmLoginViewController" bundle:nil];
    //设置即将要跳转的页面
    ConfirmLoginViewController *comfirmLogin = [storyBoard instantiateInitialViewController];
    //设置转变模式，为反转分格
    comfirmLogin.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;
    //现在开启动画
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    [self presentViewController:comfirmLogin animated:YES completion:nil];
    
    [SVProgressHUD showSuccessWithStatus:@"页面方式三跳转成功！"];
}
-(void)setData{
    self.useName.text = @"wangning";
    self.password.text = @"wangning";
    [self.switch_btn setOn:true];
}
@end
