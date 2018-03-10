//
//  GFButton.m
//  GFTrademark
//
//  Created by 夏伟耀 on 16/2/27.
//  Copyright © 2016年 gf. All rights reserved.
//

#import "GFButton.h"

@implementation GFButton

- (UIImage *)backgroundImageForState:(UIControlState)state {
    if (!_hadSet && !_isNormal) {
        
        UIImage *normalImage = [super backgroundImageForState:UIControlStateNormal];
        normalImage = [normalImage resizableImageWithCapInsets:UIEdgeInsetsMake(normalImage.size.height / 2 - 1, normalImage.size.width / 2 - 1, normalImage.size.height / 2 - 1, normalImage.size.width / 2 - 1)];
        [self setBackgroundImage:normalImage forState:UIControlStateNormal];
        
        UIImage *highlightedImage = [super backgroundImageForState:UIControlStateHighlighted];
        highlightedImage = [highlightedImage resizableImageWithCapInsets:UIEdgeInsetsMake(normalImage.size.height / 2 - 1, normalImage.size.width / 2 - 1, normalImage.size.height / 2 - 1, normalImage.size.width / 2 - 1)];
        [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
        
        _hadSet = YES;
    }
    return [super backgroundImageForState:state];
}

@end
