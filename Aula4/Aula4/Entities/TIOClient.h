//
//  TIOClient.h
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TIOClient : NSObject

@property (copy, nonatomic) NSNumber *identifier;
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *phoneNumber;
@property (copy, nonatomic) NSString *gender;

+ (instancetype)clientFromJSON:(NSDictionary *)jsonObject;

@end
