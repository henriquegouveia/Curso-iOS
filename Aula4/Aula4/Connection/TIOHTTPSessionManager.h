//
//  TIOHTTPSessionManager.h
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/9/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface TIOHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
