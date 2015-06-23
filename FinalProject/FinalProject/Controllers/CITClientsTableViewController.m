//
//  CITClientsTableViewController.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 3/4/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITClientsTableViewController.h"
#import "CITHTTPSessionManager+Clients.h"
#import "CITDataAccess+Clients.h"
#import "CITClientCustomCell.h"

static NSString * const kCellIdentifier = @"clientCustomCell";

@interface CITClientsTableViewController ()

@property (strong, nonatomic) NSArray *clients;

@end

@implementation CITClientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CITHTTPSessionManager getAllClientsWithCompletionBlock:^(NSArray *results) {
        self.clients = results;
        
        [self.tableView reloadData];
        [self.delegate didFinishDataLoad];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.clients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CITClientCustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [customCell populateCellWithObject:self.clients[indexPath.row]];
            
    return customCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //this method returns what cell was selected
    
}

@end
