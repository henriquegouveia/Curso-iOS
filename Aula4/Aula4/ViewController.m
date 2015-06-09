//
//  ViewController.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "ViewController.h"
#import "TIOSecondViewController.h"
#import "TIOFirstView.h"
#import "TIOHTTPClient.h"

@interface ViewController () <TIOSecondViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"firstToSecond"]) {
        TIOSecondViewController *secondViewController = (TIOSecondViewController *)segue.destinationViewController;
//        secondViewController.delegate = self;
        
        [secondViewController setCompletionBlock:^(NSString *text, BOOL succes) {
            [self.mainView changeLabelText:text];
        }];
    }
}

#pragma mark - SecondViewController Delegate

- (void)changeTitle:(NSString *)newTitle {
    [self.mainView changeLabelText:newTitle];
}

#pragma mark - getters/setters

- (TIOFirstView *)mainView {
    TIOFirstView *__weak view = (TIOFirstView *)self.view;
    return view;
}

@end
