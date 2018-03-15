//
//  GFMyNotificationViewController.m
//  GFTrademark
//
//  Created by 王宁 on 2018/1/22.
//  Copyright © 2018年 gf. All rights reserved.
//

#import "GFMyNotificationViewController.h"
#import "Masonry.h"
@interface GFMyNotificationViewController () <UITableViewDelegate>


@end
@implementation GFMyNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setupView {
    //设置左侧返回栏按钮
    UIBarButtonItem *left_barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back_action)];
    //[left_barButton setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:left_barButton];
    
    
    
    //////////////////////////////////////////
    //[self.view setTitle:NSNewLocalizedString(@"我的通知", nil)];
    // 设置标题背景
    [self setTitle:@"我的通知"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIView* title_view = [UIView new];
    [self.view addSubview:title_view];
    [title_view mas_makeConstraints:^(MASConstraintMaker *make) {     //设置约束
        
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.top.mas_equalTo(self.view.mas_top).with.offset(0);
        make.height.mas_equalTo(75);
    }];
    [self setLayView:title_view];
    //列表
    UITableView *myTableView = [[UITableView alloc]init];
    [self.view addSubview:myTableView];
    //[myTableView setDelegate:self];
    //[myTableView setDataSource:self];
    //[myTableView setMj_footer:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestListFooterRefresh)]];
    [myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [myTableView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.top.mas_equalTo(title_view.mas_bottom).with.offset(10);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(0);
    }];
    
    // 初始化列表
//    UITableView* _mTableView = [[UITableView alloc] init];
//    [self.view addSubview:_mTableView];
////    [_mTableView setDelegate:self];
////    [_mTableView setDataSource:self];
//    [_mTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    //    [_mTableView setMj_footer:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(messageListFooterRefresh)]];
//    //[_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ProcessCell"];
//    [_mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
    
    

}

// 列表点击事件
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    // 获取数据源
//    GFProcessVo *mData = [_mDatas objectAtIndex:indexPath.row];
//    if (mData.isEnd) {
//
//        _validData = mData;
//
//        //卡是否过期
//        [self cardexpired];
//
//    }
//
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//
//}
#pragma mark - 布局
-(void)setLayView:(UIView*)view {
    UILabel* nameLabel = [UILabel new];
    //    titleLabel.backgroundColor = [UIColor blackColor];
    [view addSubview:nameLabel];
    //[nameLabel sizeWithfont:14.5 color:[UIColor blackColor] TextAlignment:NSTextAlignmentLeft text:NSNewLocalizedString(@"my_log_message", nil) mark:1];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(view.mas_top).with.offset(5);
        make.left.mas_equalTo(view.mas_left).with.offset(10);
        make.right.mas_equalTo(view.mas_right).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    CGFloat widthTime = kMainScreenWidth * (68.0 /541);
    CGFloat widthTimeShow = kMainScreenWidth * (120.0 /541) + 2.5 ;
    CGFloat widthButton = kMainScreenWidth * (50.0 /541) - 2.5 ;
    CGFloat width = kMainScreenWidth * (40.0 /541);
    
    
    UILabel* titleLabel = [UILabel new];
    //    titleLabel.backgroundColor = [UIColor blackColor];
    [view addSubview:titleLabel];
    //[titleLabel sizeWithfont:14.5 color:[UIColor blackColor] TextAlignment:NSTextAlignmentCenter text:[NSString stringWithFormat:@"%@:",NSNewLocalizedString(@"my_log_1", nil)] mark:1];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(view.mas_left).with.offset(0);
        make.width.mas_equalTo(widthTime);
        make.height.mas_equalTo(30);
    }];
    
    UILabel *timeFormLabel = [UILabel new];
    //    _timeFormLabel.backgroundColor = [UIColor redColor];
    [view addSubview:timeFormLabel];
    //[_timeFormLabel sizeWithfont:15 color:[UIColor blackColor] TextAlignment:NSTextAlignmentCenter text:_mStartTime mark:1];
    timeFormLabel.layer.borderColor = [UIColor grayColor].CGColor;
    timeFormLabel.layer.borderWidth = 0.5;
    [timeFormLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(titleLabel.mas_right).with.offset(0);
        make.width.mas_equalTo(widthTimeShow);
        make.height.mas_equalTo(30);
    }];

    UIButton *timeFormButton = [UIButton new];
    //    timeFormButton.backgroundColor = [UIColor greenColor];
    [view addSubview:timeFormButton];
    [timeFormButton setTag:1000];
    //[timeFormButton resizedImageWithOrdinaryName:@"ic_uppressed" HighlightName:@""];
    //[timeFormButton addTarget:self action:@selector(clickChooseTime:) forControlEvents:UIControlEventTouchUpInside];
    timeFormButton.layer.borderColor = [UIColor grayColor].CGColor;
    timeFormButton.layer.borderWidth = 0.5;
    [timeFormButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(timeFormLabel.mas_right).with.offset(0);
        make.width.mas_equalTo(widthButton);
        make.height.mas_equalTo(30);
    }];
    
    UILabel* Label = [UILabel new];
    //    Label.backgroundColor = [UIColor blackColor];
    [view addSubview:Label];
    //[Label sizeWithfont:15 color:[UIColor blackColor] TextAlignment:NSTextAlignmentCenter text:NSNewLocalizedString(@"my_orderDetails_to", nil) mark:1];
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(timeFormButton.mas_right).with.offset(0);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(30);
    }];
    
//    _timeToLabel = [UILabel new];
//    //    _timeToLabel.backgroundColor = [UIColor redColor];
//    [view addSubview:_timeToLabel];
//    [_timeToLabel sizeWithfont:15 color:[UIColor blackColor] TextAlignment:NSTextAlignmentCenter text:_mEndTime mark:1];
//    _timeToLabel.layer.borderColor = [UIColor grayColor].CGColor;
//    _timeToLabel.layer.borderWidth = 0.5;
//    [_timeToLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
//        make.left.mas_equalTo(Label.mas_right).with.offset(0);
//        make.width.mas_equalTo(widthTimeShow);
//        make.height.mas_equalTo(30);
//    }];
    
    UIButton *timeToButton = [UIButton new];
    //    timeToButton.backgroundColor = [UIColor blueColor];
    [view addSubview:timeToButton];
    [timeToButton setTag:1001];
    [timeToButton setImage:[UIImage imageNamed:@"ic_uppressed"] forState:UIControlStateNormal];
    //[timeToButton resizedImageWithOrdinaryName:@"ic_uppressed" HighlightName:@""];
    [timeToButton addTarget:self action:@selector(clickChooseTime:) forControlEvents:UIControlEventTouchUpInside];
    timeToButton.layer.borderColor = [UIColor grayColor].CGColor;
    timeToButton.layer.borderWidth = 0.5;
    [timeToButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(timeFormLabel.mas_right).with.offset(0);
        make.width.mas_equalTo(widthButton);
        make.height.mas_equalTo(30);
    }];
    
    UIButton *queryButton = [UIButton new];
    //    queryButton.backgroundColor = [UIColor greenColor];
    [view addSubview:queryButton];
    //[queryButton setTitleColor:[UIColor whiteColor] Title:@"my_trade_search" font:14.5 backgroundColor:KRGBA(41, 135, 225, 1)];
    [queryButton setTitle:@"我的查询" forState:nil];
    [queryButton addTarget:self action:@selector(clickChooseUnit) forControlEvents:UIControlEventTouchUpInside];
    [queryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(timeToButton.mas_right).with.offset(5);
        make.right.mas_equalTo(view.mas_right).with.offset(-5);
        make.height.mas_equalTo(30);
    }];
    
    // 分割线
    UIView *line1 = [[UIView alloc] init];
    [view addSubview:line1];
    [line1 setBackgroundColor:[UIColor colorWithWhite:240.0/255 alpha:1]];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(view.mas_bottom).with.offset(0);
        make.left.mas_equalTo(view.mas_left).with.offset(0);
        make.right.mas_equalTo(view.mas_right).with.offset(0);
        make.height.mas_equalTo(1);
    }];
    
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
