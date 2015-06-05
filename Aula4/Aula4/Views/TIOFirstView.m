//
//  TIOFirstView.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOFirstView.h"

@interface TIOFirstView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation TIOFirstView

- (void)changeLabelText:(NSString *)text {
    self.titleLabel.text = text;
}

@end
