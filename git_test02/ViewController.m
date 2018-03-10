//
//  ViewController.m
//  git_test02
//
//  Created by 王宁 on 2018/2/24.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "GFButton.h"
#import "Masonry.h"
#import "CYXThreeViewController.h"
#import "SecondViewController.h"
//屏幕尺寸
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height
static float AD_height = 150;//广告栏高度

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    //导航栏背景颜色
//    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20.0f],NSFontAttributeName, nil]];
//    self.navigationItem.title = @"My Home";
    
    /**
     *  创建collectionView self自动调用setter getter方法
     */
    //[self.view addSubview:self.collectionView];
    
    /**
     *  广告栏
     
    _headerView = [[AdvertisingColumn alloc]initWithFrame:CGRectMake(5, 5, fDeviceWidth-10, AD_height)];
    _headerView.backgroundColor = [UIColor blackColor];
    
    /*
     *  加载的数据
     
    NSArray *imgArray = [NSArray arrayWithObjects:@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png", nil];
    [_headerView setArray:imgArray];
    
    //collectionView数据
    _cellArray = [imgArray mutableCopy];
    
    */
    
//
//    UIButton *timeFormButton = [UIButton new];
//    timeFormButton.backgroundColor = [UIColor greenColor];
    //[self view addSubview:timeFormButton];
    //[self print];
    [self setupView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//

-(void)print{
    char *cString = "c字符串";
    printf("c string is %s\n",cString);
}
-(void)setupView{
    
    //UIButton *btn1 = [UIButton];
    
    // 设置标题背景
    //[self setTitle:NSNewLocalizedString(@"我的通知", nil)];
//    UIImageView *leftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [leftIcon setImage:[UIImage imageNamed:@"wn"]];
//    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftIcon]];
//
    
    //self.title = @"wangning";
    //LoginViewController *oneView = [[LoginViewController alloc]init];
//    UIView* view2 = [UIView new];
//    [self.view addSubview:view2];
//    [view2 setBackgroundColor:[UIColor yellowColor]];
    //UIButton *btn = [[UIButton alloc] init];
    
    UIView *view1 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view1.backgroundColor = [UIColor yellowColor];
    view1.layer.cornerRadius = 5;
    [self.view addSubview:view1];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor greenColor];
//    button.frame = CGRectMake(view1.frame.origin.x, view1.frame.origin.y, view1.frame.size.width/2, view1.frame.size.height/2);
//
//    [button addTarget:self action:@selector(initAlertView:) forControlEvents:UIControlEventTouchUpInside];
//    [view1 addSubview:button];
//
//    long visitorCount = 100;
//    [button setTitle:[NSString stringWithFormat:@"%ld人",(unsigned long)visitorCount] forState:UIControlStateNormal];
    //[button.hidden = true];
    
    
    
    // 登录按钮
    GFButton *loginButton = [[GFButton alloc] init];
    [loginButton setTitle:@"跳转☞" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"bg_btn_login_normal"] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"bg_btn_login_pressed"] forState:UIControlStateHighlighted];
    [loginButton addTarget:self action:@selector(initAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.equalTo(self.view).with.offset(35);
        make.right.equalTo(self.view).with.offset(-35);
        make.top.equalTo(self.view).with.offset(200);
    }];
    
}
//this is wangning !

- (void)popViewAction:(UIButton *)button {
    //[nameLa]
    //[self.nameLabel setText:@"This is a wangning!"];
    NSLog(@"wm");
    printf("This is a progream!!!\n");
    //[self.navigationController popViewControllerAnimated:YES];       //返回弹出式控制器（mrwang90hou-2017.11.16  pm）
}


#pragma mark - 创建collectionView并设置代理
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.headerReferenceSize = CGSizeMake(kMainScreenWidth, AD_height+10);//头部大小
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight) collectionViewLayout:flowLayout];
        
        //定义每个UICollectionView 的大小
        flowLayout.itemSize = CGSizeMake((kMainScreenWidth-20)/2, (kMainScreenWidth-20)/2+50);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = 5;
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = 0;
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 5, 5);//上左下右
        
        //注册cell和ReusableView（相当于头部）
//        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
//
//        //设置代理
//        _collectionView.delegate = self;
//        _collectionView.dataSource = self;
        
        //背景颜色
        _collectionView.backgroundColor = [UIColor whiteColor];
        //自适应大小
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
    }
    return _collectionView;
}

#pragma mark - 弹出框
- (void)initAlertView:(UIButton *)button {
//    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//
//    CYXThreeViewController *sec = [[CYXThreeViewController alloc]init];
//
//
//    [nav pushViewController:sec animated:YES];
//
//

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告⚠️\n即将进行页面跳转操作!" message:nil preferredStyle:UIAlertControllerStyleAlert];
        //添加Button
        [alertController addAction: [UIAlertAction actionWithTitle: @"NO" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //取消

            return ;

        }]];
        [alertController addAction: [UIAlertAction actionWithTitle: @"YES" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //跳转到确认登录页面
            //[self confirmLogin];
            [self btnClick];
            return ;

        }]];
        [self presentViewController: alertController animated: YES completion: nil];

    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"my_logout_warning" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
        [alertView show];
    }
    
}
-(void)confirmLogin{
    // 跳转回登录界面
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LigonViewController" bundle:nil];
    
    CYXThreeViewController *mLoginVC = [storyBoard instantiateInitialViewController];
    
    //mLoginVC.delegate = self;

    UINavigationController * nVC = [[UINavigationController alloc]initWithRootViewController:mLoginVC];
    
    
    [nVC pushViewController:mLoginVC animated:YES];
//    [mLoginVC release];
//    [window addSubView:nVC.view];
//    [nVC release];
    
    
    //[self presentViewController:nVC animated:YES completion:^{
    //}];
    
    
    //    CYXFourViewController *fourVC = [[CYXFourViewController alloc]init];
    
    //[self setUpOneChildViewController:fourVC image:[UIImage imageNamed:@"user"] title:@"设置"];
    
    
    //LoginViewController *mLoginVC = [[LoginViewController alloc]init];
    
    //UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
    //[mLoginVC showNoticeHudWithTitle:@"my_logout_success" subtitle:@"my_logout_success" onView:navigationController.view inDuration:2];
    //[UIApplication sharedApplication].keyWindow.rootViewController = mLoginVC;
   //[self.window setRootViewController:mLoginVC];
    //[self  LoginViewController:mLoginVC  animated:YES completion:nil];//从当前界面到nextVC
    //[self dismissViewControllerAnimated:YES completion:nil];//从nextVC界面回去
    //PickImageViewController *ickImageViewController = [[PickImageViewController alloc] init];
    //[self presentModalViewController:mLoginVC animated:YES];
    //返回
    //[self dismissModalViewControllerAnimated:YES];
}
-(void)btnClick
{
    /*
    //设置要进入的页面
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    //设置转变模式，为反转分格
    secondVC.modalTransitionStyle =   UIModalTransitionStyleFlipHorizontal;
    //现在开启动画
    [self presentViewController:secondVC animated:YES completion:nil];
    
 */
    ///////2////////
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"CYXThreeViewController" bundle:nil];
    //设置要进入的页面
    CYXThreeViewController *mLoginVC = [storyBoard instantiateInitialViewController];

    
    
    
    
    /////////3//////////
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:nil];
//    //设置要进入的页面
//    LoginViewController *mLoginVC = [storyBoard instantiateInitialViewController];
    
    
    
//    //设置转变模式，为反转分格
    mLoginVC.modalTransitionStyle =   UIModalTransitionStyleFlipHorizontal;
    //现在开启动画
    [self presentViewController:mLoginVC animated:YES completion:nil];
    
    
    
    
}
@end
