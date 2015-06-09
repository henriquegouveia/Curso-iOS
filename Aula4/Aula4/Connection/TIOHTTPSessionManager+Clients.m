//
//  TIOHTTPSessionManager+Clients.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/9/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOHTTPSessionManager+Clients.h"
#import "TIOClient.h"

@implementation TIOHTTPSessionManager (Clients)

+ (void)getAllClientsWithCompletionBlock:(TIOHTTPSessionClientBlock)completion {
    NSDictionary *parameter = @{@"username": @"hgouveia",
                                @"passwod": @"1234"};
    [[self sharedInstance] GET:@"clients"
                    parameters:parameter
                       success:^(NSURLSessionDataTask *task, id responseObject) {
                           NSMutableArray *clients = [NSMutableArray array];
                           for (NSDictionary *clientJSONObject in responseObject) {
                               TIOClient *client = [TIOClient clientFromJSON:clientJSONObject];
                               [clients addObject:client];
                           }
                           
                           completion(clients, nil);
                           
                       } failure:^(NSURLSessionDataTask *task, NSError *error) {
                           completion(nil, error);
                       }];
}

@end
