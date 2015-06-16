//
//  CITHTTPSessionManager+Login.h
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 2/27/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager.h"

@interface CITHTTPSessionManager (Login)

+ (void)executeLogin:(NSString *)username password:(NSString *)password withCompletion:(CITStatusBlock)completion;

@end
