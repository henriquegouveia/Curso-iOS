//
//  CITHTTPSessionManager+Clients.m
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 2/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager+Clients.h"
#import "CITDataAccess+Clients.h"
#import "CITClient.h"

static NSString * const kClientsPath = @"clients";

@implementation CITHTTPSessionManager (Clients)

+ (void)getAllClientsWithCompletionBlock:(CITRequestResults)completion {
    [[self sharedInstance] GET:kClientsPath parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        NSMutableArray *clients = [NSMutableArray array];
        for (NSDictionary *clientsDict in responseObject) {
            CITClient *client = [CITClient populateFromJSON:clientsDict];
            [CITDataAccess insertClient:client withCompletionBlock:^(BOOL status) {
                if(status){
                  [clients addObject:client];
                }
            }];
        }
        completion(clients);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil);
    }];
}

@end
