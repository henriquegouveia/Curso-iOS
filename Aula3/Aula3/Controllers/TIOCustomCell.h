//
//  TIOCustomCell.h
//  Aula3
//
//  Created by Henrique Cesar Gouveia on 5/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TIOCustomCellDelegate;

@interface TIOCustomCell : UITableViewCell

@property (weak, nonatomic) id<TIOCustomCellDelegate> delegate;

- (void)populateFields:(NSString *)object;

@end

@protocol TIOCustomCellDelegate <NSObject>

- (void)returnNumber:(NSString *)number;

@end
