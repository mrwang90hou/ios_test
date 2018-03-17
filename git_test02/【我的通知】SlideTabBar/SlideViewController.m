//
//  ViewController.m
//  SlideTabBar
//
//  Created by Mr.LuDashi on 15/6/25.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "SlideViewController.h"
#import "SlideTabBarView.h"

@interface SlideViewController ()

@property (strong, nonatomic) SlideTabBarView *slideTabBarView;
@property (strong, nonatomic) IBOutlet UIView *superView;
@property (assign) NSInteger tabCount;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *back_btn;

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    _tabCount = 6;
    [self initSlideWithCount:_tabCount];
}


-(void)setupView{
    
    self.title = @"我的通知";
    //设置左侧返回栏按钮
    UIBarButtonItem *left_barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back_action)];
    //[left_barButton setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:left_barButton];
    
    
    
//    UIBarButtonItem *right_batButton_add = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStyleDone target:self action:@selector(add:)];
//
//
//
//    UIBarButtonItem *right_batButton_delete = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_cut"] style:UIBarButtonItemStyleDone target:self action:@selector(delete:)];

    
    
    
//    //方法一
//    UIToolbar* tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
//    [tools setBarTintColor:[UIColor whiteColor]];
//    NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:2];
//    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UITabBarSystemItemContacts target:self action:@selector(add:)];
//    UIBarButtonItem *pulishButton = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UITabBarSystemItemContacts target:self action:@selector(delete:)];
//    [pulishButton setTintColor:[UIColor greenColor]];
//    [buttons addObject:saveButton];
//    [buttons addObject:pulishButton];
//    [tools setItems:buttons animated:NO];
//    UIBarButtonItem *myBtn = [[UIBarButtonItem alloc] initWithCustomView:tools];
//    self.navigationItem.rightBarButtonItem = myBtn;
//

    //方法二：
    UIBarButtonItem *pulishButton = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UITabBarSystemItemContacts target:self action:@selector(add:)];
    [pulishButton setTintColor:[UIColor blueColor]];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UITabBarSystemItemContacts target:self action:@selector(delete:)];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: pulishButton,saveButton,nil]];

//
//
//
//
//
//    //方法三
//    UIButton *right_batButton_add=[UIButton buttonWithType:(UIButtonTypeCustom)];
//    [right_batButton_add setTitle:@"添加" forState:(UIControlStateNormal)];
//    [right_batButton_add setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
//    right_batButton_add.layer.masksToBounds=YES;
//    right_batButton_add.layer.cornerRadius=3;
//    right_batButton_add.titleLabel.font=[UIFont systemFontOfSize:15];
//    right_batButton_add.backgroundColor=[UIColor cyanColor];
//    [right_batButton_add addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
//
//    UIButton *right_batButton_delete=[UIButton buttonWithType:(UIButtonTypeCustom)];
//    [right_batButton_delete setTitle:@"删除" forState:(UIControlStateNormal)];
//    [right_batButton_delete setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
//    right_batButton_delete.layer.masksToBounds=YES;
//    right_batButton_delete.layer.cornerRadius=3;
//    right_batButton_delete.titleLabel.font=[UIFont systemFontOfSize:15];
//    right_batButton_delete.backgroundColor=[UIColor greenColor];
//    [right_batButton_delete addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
//
//    right_batButton_add.frame = CGRectMake(0, 0, 50, 30);
//    right_batButton_delete.frame=CGRectMake(0, 0, 50, 30);
//
//    UIBarButtonItem *pulish = [[UIBarButtonItem alloc] initWithCustomView:right_batButton_add];
//    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithCustomView:right_batButton_delete];
//
//    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: pulish, save,nil]];
//
//
    //[self setBack_btn:_back_btn];
    //[self.navigationItem setLeftBarButtonItem:_back_btn];
    
}

-(void)add{
    [_slideTabBarView removeFromSuperview];
    [self initSlideWithCount:++_tabCount];
}

-(void)delete{
    [_slideTabBarView removeFromSuperview];
    if (_tabCount > 1) {
        [self initSlideWithCount:--_tabCount];
    }
}






- (IBAction)jian:(id)sender {
    [_slideTabBarView removeFromSuperview];
    if (_tabCount > 1) {
        [self initSlideWithCount:--_tabCount];
    }
    
}
- (IBAction)back_action:(id)sender {
    
    [self back_action];
    
}
- (IBAction)add:(id)sender {
    [_slideTabBarView removeFromSuperview];
    [self initSlideWithCount:++_tabCount];
}

-(void) initSlideWithCount: (NSInteger) count{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    screenBound.origin.y = 60;
    
    _slideTabBarView = [[SlideTabBarView alloc] initWithFrame:screenBound WithCount:count];
    [self.view addSubview:_slideTabBarView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)back_action{
    //返回到之前的视图控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

//回到根视图
-(void)backRootViewClick
{
    self.presentingViewController.view.alpha = 0;
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
