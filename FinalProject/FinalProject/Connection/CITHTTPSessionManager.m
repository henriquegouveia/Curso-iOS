//
//  CITHTTPSessionManager.m
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 2/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager.h"

static NSString * const kBaseServiceURL = @"http://private-9f905-citbase.apiary-mock.com";

@implementation CITHTTPSessionManager

+ (instancetype)sharedInstance {
    
    static CITHTTPSessionManager *_sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:kBaseServiceURL];
        _sharedManager = [[CITHTTPSessionManager alloc] initWithBaseURL:baseURL];
    });
    
    return _sharedManager;
}

@end
