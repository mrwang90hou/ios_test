//
//  ConfirmLoginSecondViewController.m
//  git_test02
//
//  Created by 国方商标 on 2018/3/13.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ConfirmLoginSecondViewController.h"
#import <Masonry.h>
#import "SVProgressHUD.h"
#import "MessageValidationViewController.h"

//屏幕尺寸
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height

// 颜色
#define KRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


@interface ComfirmLoginSceondViewController()
@property (strong,nonatomic)UIButton *close_btn;   //关闭按钮
@property (strong,nonatomic)UIImageView *picture_computer;//电脑图片显示
@property (strong,nonatomic)UILabel *loginLabel;
//@property (strong,nonatomic)UIButton *login_btn;   //登录
//@property (strong,nonatomic)UIImage *logout_btn;    //取消登录


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
    UIBarButtonItem *close_btn = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    [close_btn setTintColor:[UIColor greenColor]];
    [self.navigationItem setLeftBarButtonItem:close_btn];
    
    
    
    //通过插入一个view的方法，实现相对布局，使得  电脑图片   占屏幕的1/6
    UIView *adView = [UIView new];
    [self.view addSubview:adView];
    [adView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo([NSNumber numberWithFloat:(kMainScreenWidth / 6 * 1)]);
    }];
    
    //电脑图片显示
    
    _picture_computer = [[UIImageView alloc] init];
    _picture_computer.image = [UIImage imageNamed:@"cp1"];
    [self.view addSubview:_picture_computer];
    [_picture_computer mas_makeConstraints:^(MASConstraintMaker *make){
//        make.height.mas_equalTo(self.view.mas_height);
//        make.width.mas_equalTo(self.view.mas_width);
//        make.left.equalTo(self.view).with.offset(40);
//        make.right.equalTo(self.view).with.offset(-40);
        
        
        make.top.equalTo(adView.mas_bottom).with.offset(16);//占屏幕的1/6
        //[NSNumber numberWithFloat:(kMainScreenWidth / 16 * 3)]
        
        
        //make.top.equalTo(self.view).with.offset(80);
        //make.edges.equalTo(self.view);
        make.centerX.equalTo(self.view);
        //make.centerY.equalTo(self.view);
    }];
    
//
//
    //登录提示label
    _loginLabel = [[UILabel alloc] init];
    [_loginLabel setText:@"PC端确认登录"];
    _loginLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_loginLabel];
    [_loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_picture_computer.mas_bottom).with.offset(20);
        make.height.mas_equalTo(45);
//        make.left.equalTo(self.view).with.offset(40);
//        make.right.equalTo(self.view).with.offset(-40);
        make.centerX.equalTo(self.view);
    }];
    //时间过期提示label
    UILabel *timeOutLabel = [[UILabel alloc]init];
    timeOutLabel.text = @"登录确认已失效，请重新扫描登录！";
    [timeOutLabel setTextColor:[UIColor redColor]];
    timeOutLabel.hidden = true;
    [self.view addSubview:timeOutLabel];
    [timeOutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_loginLabel.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view);
    }];
    //login_btn
    UIButton  *login_btn = [[UIButton alloc]init];
    [login_btn setTitle:@"登录" forState:UIControlStateNormal];
    //[login_btn setTitleColor:[UIColor colorWithRed:1.0/255 green:189.0/255 blue:250.0/255 alpha:1] forState:UIControlStateHighlighted];
    //[login_btn setTitleColor:[UIColor colorWithRed:43/255 green:133/255 blue:177/255 alpha:1] forState:UIControlStateHighlighted];
    [login_btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    //[login_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //login_btn.titleLabel.font = [UIFont systemFontOfSize:22];
    [login_btn addTarget:self action:@selector(pageJump2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login_btn];
    [login_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-60);
        //make.bottom.equalTo(timeOutLabel.mas_bottom).with.offset(60);
        make.centerX.equalTo(self.view);
    }];
    //logout_btn
    UIButton  *logout_btn = [[UIButton alloc]init];
    [logout_btn setTitle:@"取消登录" forState:UIControlStateNormal];
    //[login_btn setTitleColor:[UIColor colorWithRed:177 green:177 blue:177 alpha:0] forState:UIControlStateNormal];
    [logout_btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //logout_btn.titleLabel.font = [UIFont systemFontOfSize:22];
    [logout_btn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logout_btn];
    [logout_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(login_btn.mas_bottom).with.offset(40);
        make.centerX.equalTo(self.view);
    }];
    //重新扫码登录return_QRcode_btn
    UIButton  *return_QRcode_btn = [[UIButton alloc]init];
    [return_QRcode_btn setTitle:@"重新扫码登录" forState:UIControlStateNormal];
    //[login_btn setTitleColor:[UIColor colorWithRed:177 green:177 blue:177 alpha:0] forState:UIControlStateNormal];
    [return_QRcode_btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    //logout_btn.titleLabel.font = [UIFont systemFontOfSize:22];
    [return_QRcode_btn addTarget:self action:@selector(backRootViewClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:return_QRcode_btn];
    return_QRcode_btn.hidden = true;
    //[return_QRcode_btn isHidden];
    [return_QRcode_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-40);
        make.centerX.equalTo(self.view);
    }];
}
-(void)backClick
{
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}
//回到根视图
-(void)backRootViewClick
{
    self.presentingViewController.view.alpha = 0;
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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
