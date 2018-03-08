//
//  ViewController.m
//  git_test02
//
//  Created by 王宁 on 2018/2/24.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)
static float AD_height = 150;//广告栏高度

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    //导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20.0f],NSFontAttributeName, nil]];
    self.navigationItem.title = @"My Home";
    
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
    [self print];
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
    UIView* view2 = [UIView new];
    [self.view addSubview:view2];
    [view2 setBackgroundColor:[UIColor yellowColor]];
    UIButton *btn = [[UIButton alloc] init];
    [self.view  addSubview:btn];
    [btn setTag:1000];//设置标签🏷
    [btn setTitle:@"button" forState:UIControlStateNormal];
    //[btn setTitle:@"login", forState:UIControlStateNormal];
    //[btn resizedImageWithOrdinaryName:@"wn" HighlightName:@""];
    [btn addTarget:self action:@selector(popViewAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 0.5;
//    [timeFormButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
//        make.left.mas_equalTo(_timeFormLabel.mas_right).with.offset(0);
//        make.width.mas_equalTo(widthButton);
//        make.height.mas_equalTo(30);
//    }];
    //self.view = @[view];
    //view.title = @"UIView";
    //self.oneView.backgroundColor = [UIColor whiteColor];
    
//    [self.view setBackgroundColor:[UIColor whiteColor]];
//    UIView* view = [UIView new];
//    [self.view addSubview:view];
/*
    UIButton *timeFormButton = [UIButton new];
    timeFormButton.backgroundColor = [UIColor greenColor];
    [view addSubview:timeFormButton];
    [timeFormButton setTag:1000];
    [timeFormButton resizedImageWithOrdinaryName:@"ic_uppressed" HighlightName:@""];
    [timeFormButton addTarget:self action:@selector(popViewAction:) forControlEvents:UIControlEventTouchUpInside];
    timeFormButton.layer.borderColor = [UIColor grayColor].CGColor;
    timeFormButton.layer.borderWidth = 0.5;
    [timeFormButton mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(_timeFormLabel.mas_right).with.offset(0);
        make.width.mas_equalTo(widthButton);
        make.height.mas_equalTo(30);
    }];
//
    
    
    UILabel* nameLabel = [UILabel new];
    nameLabel.backgroundColor = [UIColor blackColor];
    [view addSubview:nameLabel];
    [nameLabel setText:@"This is a programe!"];
 
 */
 
//  [nameLabel sizeWithfont:14.5 color:[UIColor blackColor] TextAlignment:NSTextAlignmentLeft text:NSNewLocalizedString(@"my_log_message", nil) mark:1];
//    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.mas_equalTo(view.mas_top).with.offset(5);
//        make.left.mas_equalTo(view.mas_left).with.offset(10);
//        make.right.mas_equalTo(view.mas_right).with.offset(-10);
//        make.height.mas_equalTo(30);
//    }];
//
//
    
    
    // 初始化列表
   // UITableView* _mTableView = [[UITableView alloc] init];
//    [self.view addSubview:_mTableView];
//    //    [_mTableView setDelegate:self];
//    //    [_mTableView setDataSource:self];
//    [_mTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //    [_mTableView setMj_footer:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(messageListFooterRefresh)]];
    //[_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ProcessCell"];
    
    
}
//this is wangning !
- (IBAction)setOutPut:(id)sender {
    
    self.userOutPut.text = self.userInPut.text;
}
- (void)popViewAction:(UIButton *)button {
    //[nameLa]
    //[self.nameLabel setText:@"This is a wangning!"];
    NSLog(@"wm");
    //[self.navigationController popViewControllerAnimated:YES];       //返回弹出式控制器（mrwang90hou-2017.11.16  pm）
}


#pragma mark - 创建collectionView并设置代理
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.headerReferenceSize = CGSizeMake(fDeviceWidth, AD_height+10);//头部大小
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, fDeviceWidth, fDeviceHeight) collectionViewLayout:flowLayout];
        
        //定义每个UICollectionView 的大小
        flowLayout.itemSize = CGSizeMake((fDeviceWidth-20)/2, (fDeviceWidth-20)/2+50);
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


@end
