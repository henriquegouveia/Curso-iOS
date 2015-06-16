//
//  CITHTTPSessionManager+Clients.h
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 2/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager.h"

@interface CITHTTPSessionManager (Clients)

+ (void)getAllClientsWithCompletionBlock:(CITRequestResults)completion;

@end
