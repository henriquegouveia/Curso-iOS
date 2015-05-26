//
//  TIOCustomTableViewController.m
//  Aula3
//
//  Created by Henrique Cesar Gouveia on 5/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "TIOCustomTableViewController.h"
#import "TIOCustomCell.h"

@interface TIOCustomTableViewController ()

@property (copy, nonatomic) NSArray *dataSource;

@end

@implementation TIOCustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = @[@[@"1", @"2", @"3"], @[@"4", @"5", @"6", @"7", @"8", @"9"], @[@"10"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.dataSource objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TIOCustomCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if (tableViewCell) {
        NSArray *rows = [self.dataSource objectAtIndex:indexPath.section];
        [tableViewCell populateFields:[rows objectAtIndex:indexPath.row]];
    }
    
    return tableViewCell;
}

#pragma mark -

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f,
                                                                  0.0f,
                                                                  self.view.frame.size.width,
                                                                  20.0f)];
    headerView.backgroundColor = [UIColor redColor];
    return headerView;
}

@end
