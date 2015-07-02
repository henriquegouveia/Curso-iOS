//
//  CITMenuViewController.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 3/4/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITMenuViewController.h"
#import "CITClientsTableViewController.h"

@interface CITMenuViewController () <ClientsTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *clientList;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) CITClientsTableViewController *clientsTableView;


@end

@implementation CITMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.profilePicture.layer setBorderColor:[UIColor redColor].CGColor];
}

- (IBAction)openMenu:(UIGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.clientList.userInteractionEnabled = NO;
    } else {
        [UIView animateWithDuration:0.3f animations:^{
            self.clientList.frame = (CGRect){(self.view.frame.size.width * 0.7f),
                self.clientList.frame.origin.y,
                self.clientList.frame.size};
            self.clientList.userInteractionEnabled = YES;
        }];
    }
}


- (IBAction)filter:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.clientsTableView getAll];
            break;
        
        case 1:
            [self.clientsTableView getMale];
            break;
        
        case 2:
            [self.clientsTableView getAle];
            break;
            
        case 3:
            [self.clientsTableView getXing];
            break;
            
        default:
            break;
    }
}

- (IBAction)closeMenu:(UIGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.clientList.userInteractionEnabled = NO;
    } else {
        [UIView animateWithDuration:0.3f animations:^{
            self.clientList.frame = (CGRect){0.0f,
                self.clientList.frame.origin.y,
                self.clientList.frame.size};
            self.clientList.userInteractionEnabled = YES;
        }];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"Banana"]) {
        self.clientsTableView = (CITClientsTableViewController *) segue.destinationViewController ;
        self.clientsTableView.delegate = self;
    }
}



#pragma mark - Clients Table Delegate

- (void)selectedClient:(CITClient *)client {
    self.nameLabel.text = client.formattedName;
    self.emailLabel.text = client.email;
    self.phoneNumberLabel.text = client.phoneNumber;
    self.profilePicture.image = client.image;
}

- (void)finishLoad {
    [self.loadingView removeFromSuperview];
}

- (void) didFinishDataLoad{
    [self.loadingView removeFromSuperview];
}

@end
