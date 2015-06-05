//
//  TIOSecondView.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOSecondView.h"

@interface TIOSecondView ()

@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation TIOSecondView

- (void)dismissLoadingView {
    self.loadingView.hidden = YES;
}

@end
