//
//  CITDataAccess+Clients.m
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 3/2/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITDataAccess+Clients.h"

@implementation CITDataAccess (Clients)

+ (void)insertClient:(id /*your entity*/)client withCompletionBlock:(void(^)(BOOL status))completion {
    CITDatabaseQueue *queue = [[CITDatabaseManager sharedManager] databaseQueue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL success = [db executeUpdate:nil/*query here*/ withArgumentsInArray:@[]/*parameters here*/];
        if(!success){
            *rollback = YES;
            completion (success);
        }
        
        completion(success);
        
    }];
}

@end
