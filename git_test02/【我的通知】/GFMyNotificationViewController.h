//
//  GFMyNotificationViewController.h
//  GFTrademark
//
//  Created by 王宁 on 2018/1/22.
//  Copyright © 2018年 gf. All rights reserved.
//

#ifndef GFMyNotificationViewController_h
#define GFMyNotificationViewController_h


#endif /* GFMyNotificationViewController_h */

#import <UIKit/UIKit.h>

#define KEY_LANGUAGE @"key_language"          //关键语（mrwang90hou-2017.11.16  am）
#define NSNewLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:KEY_LANGUAGE]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]



//屏幕尺寸
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height

// 颜色
#define KRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]



//#import "GFBaseViewController.h"

@interface GFMyNotificationViewController : UIViewController

@end
