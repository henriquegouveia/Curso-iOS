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
    TIOClient *client = [TIOClient new];
    client.identifier = [jsonObject objectForKey:@"id"];
    client.firstName = [jsonObject objectForKey:@"firstName"];
    client.lastName = [jsonObject objectForKey:@"lastName"];
    client.email = [jsonObject objectForKey:@"email"];
    client.phoneNumber = [jsonObject objectForKey:@"phoneNumber"];
    client.gender = [jsonObject objectForKey:@"gender"];
    
    return client;
}

@end
