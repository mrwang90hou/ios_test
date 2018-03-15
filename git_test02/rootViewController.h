//
//  rootViewController.h
//  git_test02
//
//  Created by 王宁 on 2018/3/15.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#ifndef rootViewController_h
#define rootViewController_h


#endif /* rootViewController_h */


#define KEY_LANGUAGE @"key_language"          //关键语（mrwang90hou-2017.11.16  am）
//   本地化的字符串（关键，注释）      回车\
注释（mrwang90hou-2017.11.16  am）
//#define NSLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:KEY_LANGUAGE]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]

#define NSNewLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:KEY_LANGUAGE]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]


#import <UIKit/UIKit.h>
//#import "Masonry.h"
@interface rootViewController : UIViewController

/**
 *  设置导航栏样式
 */
- (void)setupNavigationBar;

/**
 *  点击导航栏返回按钮
 *  @param button 按钮对象
 */
- (void)popViewAction:(UIButton *)button;



@end

