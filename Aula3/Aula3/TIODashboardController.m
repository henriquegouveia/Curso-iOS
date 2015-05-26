//
//  ViewController.m
//  Aula3
//
//  Created by Henrique Cesar Gouveia on 5/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "TIODashboardController.h"
#import "TIOCustomTableViewController.h"
#import "TIODashboardVIew.h"

@interface TIODashboardController () <TIOCustomTableViewDelegate>

@property (weak, nonatomic) TIOCustomTableViewController *tableViewController;

@end

@implementation TIODashboardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"dashboardToTableView"]) {
        self.tableViewController = (TIOCustomTableViewController *)segue.destinationViewController;
        self.tableViewController.delegate = self;
        [self.tableViewController setCompletionBlock:^(NSString *number) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.mainView.cellLabel.text = number;
            });
        }];
    }
}

#pragma mark - TableView Delegate

- (void)showCellNumber:(NSString *)number {
    self.mainView.cellLabel.text = number;
}

#pragma mark - Cast

- (TIODashboardVIew *)mainView {
    TIODashboardVIew *__weak view = (TIODashboardVIew *)self.view;
    return view;
}

@end
