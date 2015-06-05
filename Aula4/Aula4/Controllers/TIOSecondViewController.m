//
//  TIOSecondViewController.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOSecondViewController.h"
#import "TIOClientsTableViewController.h"
#import "TIOSecondView.h"

@interface TIOSecondViewController () <UIAlertViewDelegate>

@end

@implementation TIOSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TIOClientsTableViewController *clientsController = (TIOClientsTableViewController *)segue.destinationViewController;
    [clientsController setDidFinishServiceBlock:^(BOOL success) {
        [self.mainView dismissLoadingView];
        if (!success) {
            [self showServiceError];
        }
    }];
}

- (void)showServiceError {
    [[[UIAlertView alloc] initWithTitle:@"Error"
                               message:@"Service Failed"
                              delegate:self
                     cancelButtonTitle:@"Ok"
                      otherButtonTitles:@"urubu", nil] show];
}

- (IBAction)buttonClicked:(id)sender {
//    [self.delegate changeTitle:@"bla"];
    self.completionBlock(@"bla", YES);
}

#pragma mark - Alert Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Getters/Setters

- (TIOSecondView *)mainView {
    return (TIOSecondView *)self.view;
}

@end
