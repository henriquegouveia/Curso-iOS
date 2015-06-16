//
//  UILabel+Additions.m
//  Survey
//
//  Created by Henrique Cesar Gouveia on 1/2/13.
//  Copyright (c) 2013 Tetra Pak. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (void) customText:(UIColor *)background textColor:(UIColor *) textColor font:(UIFont *) font
{
    self.textColor = textColor;
    self.backgroundColor = background;
    
    self.shadowColor = [UIColor blackColor];
    self.shadowOffset = CGSizeMake(0.0f, 1.0f);
    
    if (font)
        self.font = font;
}

@end
