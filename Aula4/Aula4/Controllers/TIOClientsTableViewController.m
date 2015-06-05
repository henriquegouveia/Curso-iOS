//
//  TIOClientsTableViewController.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOClientsTableViewController.h"
#import "TIOClientCustomCell.h"
#import "TIOHTTPClient.h"
#import "TIOClient.h"

@interface TIOClientsTableViewController ()

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation TIOClientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typeof(self) __block weakSelf = self;
    
    [TIOHTTPClient getClientsWithCompletionBlock:^(NSArray *clients) {
        weakSelf.dataSource = clients;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            self.didFinishServiceBlock(clients.count);
        });
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TIOClientCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClientCustomCell"];
    if (cell) {
        TIOClient *client = [self.dataSource objectAtIndex:indexPath.row];
        [cell populateCellWithEntity:client];
    }
    
    return cell;
}

@end
