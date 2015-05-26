//
//  TIOCustomTableViewController.h
//  Aula3
//
//  Created by Henrique Cesar Gouveia on 5/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TIOTableCompletionBlock)(NSString *number);

@protocol TIOCustomTableViewDelegate;

@interface TIOCustomTableViewController : UITableViewController

@property (copy, nonatomic) TIOTableCompletionBlock completionBlock;

@property (weak, nonatomic) id<TIOCustomTableViewDelegate> delegate;

@end

@protocol TIOCustomTableViewDelegate <NSObject>

- (void)showCellNumber:(NSString *)number;

@end
