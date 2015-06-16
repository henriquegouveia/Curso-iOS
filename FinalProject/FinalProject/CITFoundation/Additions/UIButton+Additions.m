//
//  UIButton+Additions.m
//  Survey
//
//  Created by Henrique Cesar Gouveia on 1/2/13.
//  Copyright (c) 2013 Tetra Pak. All rights reserved.
//

#import "UIButton+Additions.h"

#import "UILabel+Additions.h"

@implementation UIButton (Additions)

+ (id) customButtonWithType:(UIButtonType)buttonType
{
    UIButton *myButton = [self buttonWithType:buttonType];
    if (myButton)
    {
        [myButton.titleLabel setShadowColor:[UIColor blackColor]];
        [myButton.titleLabel setShadowOffset:CGSizeMake(0, 1)];
    }
    
    return myButton;
}

@end
