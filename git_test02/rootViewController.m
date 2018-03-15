//
//  rootViewController.m
//  git_test02
//
//  Created by 王宁 on 2018/3/15.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rootViewController.h"
#import "GFButton.h"
#import "Masonry.h"

//屏幕尺寸
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height
//static float AD_height = 150;//广告栏高度


@interface rootViewController ()

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSThread sleepForTimeInterval:2.0f];//增加载入效果图片的时间，可灵活修改。LunchImage
    
    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {        //当应用程序收到内存警告时，发送到视图控制器，系统内存很低时调用。（mrwang90hou-2017.11.16  am）
    [super didReceiveMemoryWarning];
}

/**
 *  设置导航栏样式
 */
- (void)setupNavigationBar {
    
    // 设置导航栏标题颜色，字体大小，背景不透明，背景颜色
    NSMutableDictionary *titleParams = [[NSMutableDictionary alloc] init];
    [titleParams setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [titleParams setObject:[UIFont boldSystemFontOfSize:18] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:titleParams];//设置标题属性
    [self.navigationController.navigationBar setTranslucent:NO];//设置为半透明状态
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:41/255.0 green:134/255.0 blue:227/255.0 alpha:1]];
    
    // 设置导航栏左侧图标
    if ([[self.navigationController viewControllers] count] <= 1) {
        
        // 处于根ViewControllers，仅显示Logo
        UIImageView *leftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [leftIcon setImage:[UIImage imageNamed:@"ic_logo"]];
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftIcon]];
        
    } else {
        
        // 处于上层的ViewControllers显示返回按钮
        UIButton *backView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
        [backView addTarget:self action:@selector(popViewAction:) forControlEvents:UIControlEventTouchUpInside];
        
        // 返回Icon
        UIImageView *backIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_back"]];
        [backView addSubview:backIcon];
        [backIcon setContentMode:UIViewContentModeCenter];
        [backIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 40));
            make.left.equalTo(backView);
            make.centerY.equalTo(backView);
        }];
        
        // Logo
        UIImageView *backLogo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [backView addSubview:backLogo];
        [backLogo setImage:[UIImage imageNamed:@"ic_logo"]];
        [backLogo setContentMode:UIViewContentModeCenter];
        [backLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(backView);
            make.centerY.equalTo(backView);
        }];
        
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:backView]];
        [self.navigationItem setHidesBackButton:YES];
    }
}

/**
 *  点击导航栏返回按钮
 *  @param button 按钮对象
 */
- (void)popViewAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];       //返回弹出式控制器（mrwang90hou-2017.11.16  pm）
}
/////////////////////*******未能够理解的部分*******//////////////////（mrwang90hou-2017.11.16  pm）
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {      //支持的界面方向（mrwang90hou-2017.11.16  pm）
    return UIInterfaceOrientationMaskPortrait;
}
@end
