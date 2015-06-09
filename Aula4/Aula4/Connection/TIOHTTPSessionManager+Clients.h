//
//  TIOHTTPSessionManager+Clients.h
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/9/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOHTTPSessionManager.h"

typedef void (^TIOHTTPSessionClientBlock)(NSArray *clients, NSError *error);

@interface TIOHTTPSessionManager (Clients)

+ (void)getAllClientsWithCompletionBlock:(TIOHTTPSessionClientBlock)completion;

@end
