//
//  TIOHTTPClient.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOHTTPClient.h"
#import "TIOClient.h"

static NSString * const kBaseURL = @"http://private-9f905-citbase.apiary-mock.com/clients";

@implementation TIOHTTPClient

+ (void)getClientsWithCompletionBlock:(void(^)(NSArray *clients))completion {
    NSURL *url = [NSURL URLWithString:kBaseURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadRevalidatingCacheData
                                                       timeoutInterval:NSIntegerMax];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                                 NSArray *clientsJSON = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                                        options:NSJSONReadingAllowFragments
                                                                                                                                          error:nil];
                                                                                 NSMutableArray *clients = [NSMutableArray array];
                                                                                 for (NSDictionary *clientJSON in clientsJSON) {
                                                                                     TIOClient *client = [TIOClient clientFromJSON:clientJSON];
                                                                                     [clients addObject:client];
                                                                                 }
                                                                                 completion(clients);
                                                                             }];
    [downloadTask resume];
}

@end
