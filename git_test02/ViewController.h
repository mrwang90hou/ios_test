//
//  ViewController.h
//  git_test02
//
//  Created by 王宁 on 2018/2/24.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Masonry.h"

@interface ViewController : UIViewController
//
@property (strong, nonatomic) IBOutlet UILabel *userOutPut;
@property (strong, nonatomic) IBOutlet UITextField *userInPut;
- (IBAction)setOutPut:(id)sender;
//-(void)print;

//- (void)resizedImageWithOrdinaryName:(NSString *)Ordinaryname HighlightName:(NSString *)HighlightName;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

