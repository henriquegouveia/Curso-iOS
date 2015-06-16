//
//  CITDatabaseManager.h
//  MobileFieldCollection
//
//  Created by Guilherme de Andrade on 25/09/12.
//  Copyright (c) 2012 Monsanto Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CITDatabaseQueue.h"

@protocol CITDatabaseSchemaMigration <NSObject>

- (NSInteger)newVersion;

@end

@protocol CITDatabaseSchema <NSObject>

- (NSInteger)schemaVersion;
- (NSArray *)createTableQueries;
- (NSArray *)createIndexQueries;

@end

@interface CITDatabaseManager : NSObject

+ (void)registerDatabase:(NSString *)_databaseName forUser:(NSString *)_databaseUser withDatabaseSchema:(id<CITDatabaseSchema>)_databaseSchema;
+ (CITDatabaseManager *)sharedManager;
+ (void)addMigrationSchema:(id<CITDatabaseSchemaMigration>)databaseSchemaMigration;
- (void)deleteCurrentDatabase;
- (CITDatabaseQueue *) databaseQueue;
- (void)setup;

@end
