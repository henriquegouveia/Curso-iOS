//
//  CITClient.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 3/4/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITClient.h"

@implementation CITClient

+ (instancetype)populateFromJSON:(NSDictionary *)json {
    CITClient *client = [CITClient new];
    client.firstName = [json objectForKey:@"firstName"];
    client.lastName = [json objectForKey:@"lastName"];
    client.email = [json objectForKey:@"email"];
    client.gender = [json objectForKey:@"gender"];
    client.phoneNumber = [json objectForKey:@"phoneNumber"];
    client.age = arc4random_uniform(99);
    
    return client;
}

+ (instancetype)populateFromResultSet:(FMResultSet *)resultSet {
    CITClient *client = [CITClient new];
    client.firstName = [resultSet stringForColumn:@"firstName"];
    client.phoneNumber = [resultSet stringForColumn:@"phonenumber"];
    return client;
}

- (NSURL *)pictureURL {
    NSString *urlString = [NSString stringWithFormat:@"%@%d.jpg", @"http://api.randomuser.me/portraits/women/", arc4random_uniform(72)];
    return [NSURL URLWithString:urlString];
}

- (NSString *)formattedName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
