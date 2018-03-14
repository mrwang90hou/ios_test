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
    //[NSThread sleepForTimeInterval:2.0f];//增加载入效果图片的时间，可灵活修改。LunchImage
    
    //[self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {        //当应用程序收到内存警告时，发送到视图控制器，系统内存很低时调用。（mrwang90hou-2017.11.16  am）
    [super didReceiveMemoryWarning];
}
- (void)setupView {
    // 设置标题背景
    [self setTitle:NSNewLocalizedString(@"我的通知", nil)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIView* view = [UIView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {     //设置约束
        
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.top.mas_equalTo(self.view.mas_top).with.offset(0);
        make.height.mas_equalTo(75);
    }];
    // 初始化列表
    UITableView* _mTableView = [[UITableView alloc] init];
    [self.view addSubview:_mTableView];
//    [_mTableView setDelegate:self];
//    [_mTableView setDataSource:self];
    [_mTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //    [_mTableView setMj_footer:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(messageListFooterRefresh)]];
    //[_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ProcessCell"];
    [_mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
//    
//    UIView* _validMethodView = [UIView new];
//    [self.view addSubview:_validMethodView];
//    [_validMethodView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    //[self payView:_validMethodView];
//    _validMethodView.hidden = YES;
//    
//    UIView* _codeMethodView = [UIView new];
//    [self.view addSubview:_codeMethodView];
//    [_codeMethodView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    //[self payOfflineViewTo:_codeMethodView];
//    _codeMethodView.hidden = YES;

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

@end
