//
//  GFButton.h
//  GFTrademark
//
//  Created by 夏伟耀 on 16/2/27.
//  Copyright © 2016年 gf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFButton : UIButton

@property BOOL hadSet;
@property BOOL isNormal;

@property (nonatomic, strong)UILabel* nameLabel;
@property (nonatomic, strong)UILabel* bottomLabel;

@property (nonatomic, strong)UILabel* verticalBar;

@property (nonatomic, weak) id<NSObject> mObject;

@end
