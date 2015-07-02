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
#import "CITClientsHandler.h"

static NSString * const kCellIdentifier = @"clientCustomCell";

@interface CITClientsTableViewController ()

@property (strong, nonatomic) NSArray *clients;
@property (strong, nonatomic) NSArray *cachedClients;

@end

@implementation CITClientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getAllClients];
}

-(void)getAllClients{
    [CITHTTPSessionManager getAllClientsWithCompletionBlock:^(NSArray *results) {
        self.cachedClients = results;
        self.clients = self.cachedClients;
        

        
//        NSArray *onlyPhoneNumber = [CITClientsHandler getPhoneNumber:self.clients];
//        NSArray *completeName = [CITClientsHandler getName:self.clients];
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

- (void)getAll{
    self.clients = self.cachedClients;
    
    [self.tableView reloadData];
}

- (void)getMale{
    NSArray *resultMale = [CITClientsHandler getMale:self.cachedClients];
    
    self.clients = resultMale;
    [self.tableView reloadData];
}

- (void)getAle{
   
//    NSArray *resultAle = [CITClientsHandler getAleNameOrLastName:self.cachedClients];
//    
//    self.clients = resultAle;
//    [self.tableView reloadData];
    
    [self getAleDatabase];
}


- (void)getXing{
    
    NSArray *xingResult = [CITClientsHandler getAllXing:self.cachedClients];
    
    self.clients = xingResult;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CITClientCustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [customCell populateCellWithObject:self.clients[indexPath.row]];
            
    return customCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //this method returns what cell was selected
    
}

-(void)getAleDatabase{
    [CITDataAccess getClientByName:@"ale" withCompletionBlock:^(NSArray *result) {
        self.clients = result;
        [self.tableView reloadData];
    }];
}

@end
