//
//  GFMyNotificationViewControllerCell.h
//  GFTrademark
//
//  Created by 王宁 on 2018/1/20.
//  Copyright © 2018年 gf. All rights reserved.
//
//
//#ifndef GFMyNotificationViewControllerCell_h
//#define GFMyNotificationViewControllerCell_h
//
//
//#endif /* GFMyNotificationViewControllerCell_h */


#import <UIKit/UIKit.h>
#import "GFMyNotificationViewController.h"
#import "Masonry.h"
@interface GFMyNotificationViewControllerCell : UITableViewCell

@property(strong,nonatomic)UILabel* equipmentNumber;

@property(strong,nonatomic)UILabel* equipmentTime;

@property(strong,nonatomic)UILabel* equipment;

@property(strong,nonatomic)UILabel* equipmentDescribe;

@end
