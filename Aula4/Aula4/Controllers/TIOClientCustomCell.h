//
//  TIOClientCustomCell.h
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TIOClient.h"

@interface TIOClientCustomCell : UITableViewCell

- (void)populateCellWithEntity:(TIOClient *)client;

@end
