//
//  CITDataAccess+Clients.m
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 3/2/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITDataAccess+Clients.h"
#import "CITClient.h"

static NSString * const kInsertClient = @"INSERT INTO Clients VALUES (?, ?, ?, ?, ?);";
static NSString * const kSelectClientByName = @"SELECT * FROM Clients WHERE lastName LIKE ?;";

@implementation CITDataAccess (Clients)

+ (void)insertClient:(CITClient *)client withCompletionBlock:(void(^)(BOOL status))completion {
    CITDatabaseQueue *queue = [[CITDatabaseManager sharedManager] databaseQueue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL success = [db executeUpdate:kInsertClient
                    withArgumentsInArray:@[client.firstName,
                                           client.lastName,
                                           client.gender,
                                           client.email,
                                           client.phoneNumber]];
        if(!success){
            *rollback = YES;
            completion (success);
        }
        
        completion(success);
        
    }];
}

+ (void)getClientByName:(NSString *)name withCompletionBlock:(CITDataAccessQueryResponse)completion {
    CITDatabaseQueue *queue = [[CITDatabaseManager sharedManager] databaseQueue];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:kSelectClientByName withArgumentsInArray:@[name]];
        
        NSMutableArray *clients = [NSMutableArray array];
        
        while (resultSet.next) {
            CITClient *client = [CITClient populateFromResultSet:resultSet];
            [clients addObject:client];
        }
        
        completion(clients);
    }];
    
}



@end
