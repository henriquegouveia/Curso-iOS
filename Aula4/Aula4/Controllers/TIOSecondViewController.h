//
//  TIOSecondViewController.h
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TIOSecondViewControllerDelegate;

@interface TIOSecondViewController : UIViewController

@property (copy, nonatomic) void(^completionBlock)(NSString *text, BOOL success);
@property (weak, nonatomic) id<TIOSecondViewControllerDelegate> delegate;

@end

@protocol TIOSecondViewControllerDelegate <NSObject>

- (void)changeTitle:(NSString *)newTitle;

@end
