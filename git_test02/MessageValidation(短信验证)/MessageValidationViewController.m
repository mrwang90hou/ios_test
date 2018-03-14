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
#import "Masonry.h"
//屏幕尺寸
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height

// 颜色
#define KRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]



@interface MessageValidationViewController()


@property (nonatomic, strong) UIButton *albumButton;


@end

@implementation MessageValidationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"短信验证";
    self.view.backgroundColor = [UIColor whiteColor];

    //导航栏样式button
     //返回按钮
     UIBarButtonItem *back_btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    [self.navigationItem setLeftBarButtonItem:back_btn];
    
    
    
    //导航栏样式button
    //返回按钮
    UIBarButtonItem *return_btn = [[UIBarButtonItem alloc]initWithTitle:@"重新发送" style:UIBarButtonItemStylePlain target:self action:@selector(returnSend)];
    [self.navigationItem setRightBarButtonItem:return_btn];
    
//
//
//    //重新发送
//    UIButton  *return_btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [return_btn setTitle:@"重新发送" forState:UIControlStateNormal];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:return_btn];
//    [return_btn addTarget:self action:@selector(returnSend) forControlEvents:UIControlEventTouchUpInside];
//
//
    
    
    
    
    
    //重新发送
//    UIButton  *return_btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [return_btn2 setTitle:@"重新发送" forState:UIControlStateNormal];
//
//    [self.view addSubview:return_btn2];
////    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:return_btn];
//    [return_btn2 addTarget:self action:@selector(returnSend) forControlEvents:UIControlEventTouchUpInside];
//
//    [return_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(50);
//        make.left.equalTo(self.view).with.offset(35);
//        make.right.equalTo(self.view).with.offset(-35);
//        make.top.equalTo(self.view).with.offset(200);
//    }];
    
//    //输入验证码的文本提示
//    UILabel *text_attention_label = [[UILabel alloc]init];
//    text_attention_label.backgroundColor = [UIColor greenColor];
//    text_attention_label.text=@"请输入您（手机📱/邮箱📮）所获取的验证码";
//    [text_attention_label setTextColor:[UIColor grayColor]];
//    [self.view addSubview:text_attention_label];
//    [text_attention_label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(50);
//        //make.top.equalTo(self.view).with.offset(500);
//        make.bottom.equalTo(return_btn2.mas_bottom).with.offset(60);
//        make.centerX.equalTo(self.view);
//    }];
    
    
      //”商标查询“图片
    //UIImageView *adView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"GF_Black"]];
    UIView *adView = [UIView new];
    [self.view addSubview:adView];
    [adView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo([NSNumber numberWithFloat:(kMainScreenWidth / 16 * 3)]);
    }];
    //输入验证码提示！！！
    UIView *titleView = [UIView new];
    [self.view addSubview:titleView];
    [titleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).with.offset(8);
        make.top.equalTo(adView.mas_bottom).with.offset(16);
        //make.right.equalTo(self.view).with.offset(4);
        make.height.equalTo(@24);
        make.width.equalTo(@4);
    }];
    
    UILabel *titleLabel = [UILabel new];
    [self.view addSubview:titleLabel];
    [titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(titleView.mas_trailing).with.offset(8);
        make.centerY.equalTo(titleView);
    }];
    //验证码输入框
    UITextField *text_input = [[UITextField alloc]init];
    [self.view addSubview:text_input];
    [text_input mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).with.offset(10);//左侧
        make.trailing.equalTo(self.view).with.offset(-160);//右侧
        make.top.equalTo(titleView.mas_bottom).with.offset(10);
        //make.left.equalTo(titleView.mas_bottom).with.offset(20);
        //make.left.equalTo(titleView.mas_bottom).with.offset(20);
        make.height.equalTo(@40);
        //make.leading.equalTo(@200);
    }];
    //锁头🔐图标logo
    UIImageView *passwordLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_password"]];
    //text_input.secureTextEntry = YES;                       //安全的文本输入（
    text_input.clearButtonMode = UITextFieldViewModeWhileEditing;     // 清除按钮的状态=只有在文本字段中编辑文本时，才会显示覆盖视图。
    text_input.keyboardType = UIKeyboardTypeASCIICapable;        //
    text_input.placeholder = @"请输入验证码";
    //text_input.delegate = self;
    text_input.backgroundColor = [UIColor whiteColor];
    text_input.leftView = passwordLogo;
    text_input.leftViewMode = UITextFieldViewModeAlways;
    text_input.layer.masksToBounds = YES;
    text_input.layer.cornerRadius = 4;
    text_input.layer.borderWidth = 1;
    text_input.layer.borderColor = [UIColor colorWithRed:178.0/255 green:228.0/255 blue:253.0/255 alpha:1].CGColor;
    //_passwordInput.text = [GFUserDao readPasswordInfo];
//    [text_input mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(45);
//        make.left.equalTo(self.view).with.offset(40);
//        make.right.equalTo(self.view).with.offset(-40);
//        make.centerX.equalTo(self.view);
//        make.centerY.equalTo(self.view);
//    }];
    
    
    _albumButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_albumButton];
    [_albumButton mas_updateConstraints:^(MASConstraintMaker *make) {
        
        //make.leading.equalTo(self.view).with.offset(10);//左侧
        make.trailing.equalTo(self.view).with.offset(-10);//右侧
        make.top.equalTo(titleView.mas_bottom).with.offset(10);//在titleView下面位置：10
        make.leading.equalTo(text_input.mas_trailing).with.offset(8);//距离左侧的text_input：8位置
        make.height.equalTo(@40);
//
//
//
//        make.leading.equalTo(self.view).with.offset(10);
//        make.trailing.equalTo(self.view).with.offset(-10);
//        make.top.equalTo(titleView.mas_bottom).with.offset(70);
//        make.height.equalTo(@40);
    }];
    
    //最终登录的按钮
    UIButton *login_btn_root = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:login_btn_root];
    [login_btn_root mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).with.offset(10);//左侧
        make.trailing.equalTo(self.view).with.offset(-10);//右侧
        make.top.equalTo(_albumButton.mas_bottom).with.offset(32);
        make.height.equalTo(@40);
    }];
    
    //[adView setImage:@"GF_Black"];
    //[adView assignmentWithImageView:@"GF_Black" model:UIViewContentModeScaleAspectFill];
    
    //titleView.backgroundColor = [UIColor colorWithRed:37/255.0 green:124/255.0 blue:223/255.0 alpha:1];
#pragma mark -label标签内容的换行问题！！！未解决！！！
    titleLabel.text = @"请输入您（手机📱/邮箱📮）获取的验证码";
    titleLabel.font = [UIFont systemFontOfSize:15];
    [titleLabel setTextColor:[UIColor grayColor]];
    titleLabel.autoresizesSubviews = false;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //titleLabel.AutoSize = false;    //设置AutoSize
    
    [text_input setTextColor:[UIColor  lightGrayColor]];
    [text_input setClearsOnBeginEditing:true];
    
//    UIImage *normalBackground = [UIImage imageNamed:@"ic_blue bow_normal"];
//    normalBackground = [normalBackground resizableImageWithCapInsets:UIEdgeInsetsMake(12, 12, 12, 12) resizingMode:UIImageResizingModeStretch];
//    UIImage *pressedBackground = [UIImage imageNamed:@"ic_blue bow_pressed"];
//    pressedBackground = [pressedBackground resizableImageWithCapInsets:UIEdgeInsetsMake(12, 12, 12, 12) resizingMode:UIImageResizingModeStretch];
    
    //[albumButton setImage:[UIImage imageNamed:@"ic_photo_normal"] forState:UIControlStateNormal];
    [_albumButton setTitle:@"登录验证" forState:UIControlStateNormal];
    //[albumButton setTitle:@"recognition_get_trademark_album"];
    [_albumButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[albumButton setBackgroundImage:normalBackground forState:UIControlStateNormal];
    //[albumButton setBackgroundImage:pressedBackground forState:UIControlStateHighlighted];
    _albumButton.tag = 2200;
    _albumButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _albumButton.backgroundColor = [UIColor orangeColor];
    [_albumButton addTarget:self action:@selector(returnSend) forControlEvents:UIControlEventTouchUpInside];
    
    //设置边框
    _albumButton.layer.cornerRadius = 4;
    _albumButton.layer.borderWidth = 1;
    _albumButton.layer.borderColor = [UIColor colorWithRed:178.0/255 green:228.0/255 blue:253.0/255 alpha:1].CGColor;
    
    //[cameraButton setImage:[UIImage imageNamed:@"ic_photograph_normal"] forState:UIControlStateNormal];
    [login_btn_root setTitle:@"发送成功【60s】" forState:UIControlStateNormal];
    [login_btn_root setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[cameraButton setBackgroundImage:normalBackground forState:UIControlStateNormal];
    //[cameraButton setBackgroundImage:pressedBackground forState:UIControlStateHighlighted];
    login_btn_root.tag = 2201;
    login_btn_root.titleLabel.font = [UIFont systemFontOfSize:15];
    //设置边框
    login_btn_root.layer.cornerRadius = 4;
    login_btn_root.layer.borderWidth = 1;
    login_btn_root.layer.borderColor = [UIColor colorWithRed:178.0/255 green:228.0/255 blue:253.0/255 alpha:1].CGColor;
    
    //cameraButton.hidden = true;
    [login_btn_root addTarget:self action:@selector(returnSend) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

-(void)backClick
{
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)returnSend{
    [SVProgressHUD showSuccessWithStatus:@"重新发送短信验证码！"];
    [self startTime];
}
#pragma mark -短信倒计时
-(void)startTime{
    __block int timeout=59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置（倒计时结束后调用）
                //UIButton _albumButton = [[UIButton alloc]init];
                [_albumButton setTitle:@"发送验证码" forState:UIControlStateNormal];
                //设置不可点击
                _albumButton.userInteractionEnabled = YES;
                _albumButton.backgroundColor = [UIColor orangeColor];
                
            });
        }else{
            //            int minutes = timeout / 60;    //这里注释掉了，这个是用来测试多于60秒时计算分钟的。
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                [_albumButton setTitle:[NSString stringWithFormat:@"%@秒后可重新发送",strTime] forState:UIControlStateNormal];
                //设置可点击
                _albumButton.userInteractionEnabled = NO;
                _albumButton.backgroundColor = [UIColor lightGrayColor];
            });
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
    
}

@end
