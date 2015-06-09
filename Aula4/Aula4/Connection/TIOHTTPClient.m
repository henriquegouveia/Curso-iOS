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

@interface TIOHTTPClient () <NSURLSessionDataDelegate, NSURLSessionDelegate>

@end

@implementation TIOHTTPClient

+(void) getClientsWithCompletionBlock : (void(^)(NSMutableArray *clients))completionBlock {
    NSURL * url = [NSURL URLWithString:kBaseURL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:url
                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
                                    timeoutInterval:200000];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    NSURLSessionDownloadTask *downloadTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *clientes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray *clientObjects = [[NSMutableArray alloc] init];
        for (NSDictionary *cliente in clientes) {
            TIOClient *client = [TIOClient clientFromJSON:cliente];
            [clientObjects addObject:client];
        }
        
        completionBlock(clientObjects);
    }];
    [downloadTask resume];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"%@", data);
       
    }];
}

@end
