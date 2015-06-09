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
    
//call the service here
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
    }
    
    return cell;
}

@end
