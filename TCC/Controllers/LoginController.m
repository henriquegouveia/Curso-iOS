//
//  LoginController.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 7/1/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "LoginController.h"
#import "LoginView.h"

@interface LoginController ()
@property (readonly, nonatomic) LoginView *mainView;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)executeLogin:(UIButton *)sender {
    
    if (self.mainView.userNameTextField.text.length && self.mainView.passwordTextField.text.length) {
        [self performSegueWithIdentifier:@"loginToDashboard" sender:sender];
        
    }
}

- (LoginView *)mainView {
    
    return (LoginView*)self.view;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
