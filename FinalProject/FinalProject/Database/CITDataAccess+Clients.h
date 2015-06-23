//
//  CITDataAccess+Clients.h
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 3/2/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITDataAccess.h"
#import "CITClient.h"

@interface CITDataAccess (Clients)

+ (void)insertClient:(CITClient *)client withCompletionBlock:(void(^)(BOOL status))completion;
+ (void)getClientByName:(NSString *)name withCompletionBlock:(CITDataAccessQueryResponse)completion;

@end
