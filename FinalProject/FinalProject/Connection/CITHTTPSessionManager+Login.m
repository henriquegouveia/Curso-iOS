//
//  CITHTTPSessionManager+Login.m
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 2/27/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager+Login.h"

@implementation CITHTTPSessionManager (Login)

+ (void)executeLogin:(NSString *)username password:(NSString *)password withCompletion:(CITStatusBlock)completion {
    
    [[self sharedInstance] POST:@"login"
                     parameters:nil /*must receive a dictionary with all parameters */
                        success:^(NSURLSessionDataTask *task, id responseObject) {
                            //call your block here
                        } failure:^(NSURLSessionDataTask *task, NSError *error) {
                            //call your block here
                        }];
}

@end
