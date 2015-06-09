//
//  TIOHTTPSessionManager.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/9/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOHTTPSessionManager.h"

static NSString * const kBaseURL = @"http://private-9f905-citbase.apiary-mock.com";

@implementation TIOHTTPSessionManager

+ (instancetype)sharedInstance {
    static TIOHTTPSessionManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[TIOHTTPSessionManager alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - override

- (instancetype)init {
    NSURL *url = [NSURL URLWithString:kBaseURL];
    TIOHTTPSessionManager *sessionManager = [[TIOHTTPSessionManager alloc] initWithBaseURL:url];
    if (sessionManager) {
        sessionManager.requestSerializer = [AFJSONRequestSerializer new];
        sessionManager.responseSerializer = [AFJSONResponseSerializer new];
        
        [sessionManager.requestSerializer setValue:@"1897948172938749812739" forHTTPHeaderField:@"AppToken"];
    }
    
    return sessionManager;
}

@end
