//
//  CITLoginViewController.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 3/4/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITLoginViewController.h"
#import "CITDataAccess+Clients.h"

@interface CITLoginViewController ()

@end

@implementation CITLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [CITDataAccess getClientByName:@"Aaron Collins" withCompletionBlock:^(NSArray *result) {
        NSLog(@"%@", result);
    }];
}

@end
