//
//  TIOClient.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOClient.h"

@implementation TIOClient

+ (instancetype)clientFromJSON:(NSDictionary *)jsonObject {
    TIOClient *tioClient = [TIOClient new];
    tioClient.email = [jsonObject objectForKey:@"email"];
    tioClient.identifier = [jsonObject objectForKey:@"id"];
    tioClient.firstName = [jsonObject objectForKey:@"firstName"];
    tioClient.lastName = [jsonObject objectForKey:@"lastName"];
    tioClient.gender = [jsonObject objectForKey:@"gender"];
    tioClient.phoneNumber = [jsonObject objectForKey:@"phoneNumber"];
    return tioClient;
}

@end
