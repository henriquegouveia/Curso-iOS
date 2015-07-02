//
//  CITClientsTableViewController.h
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 3/4/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CITClient.h"

@protocol ClientsTableViewControllerDelegate;

@interface CITClientsTableViewController : UITableViewController

@property (weak, nonatomic) id<ClientsTableViewControllerDelegate> delegate;

- (void)getMale;
- (void)getAll;
- (void)getAle;
- (void)getXing;
- (void)getAleDatabase;

@end

@protocol ClientsTableViewControllerDelegate <NSObject>

- (void)didFinishDataLoad;

@end