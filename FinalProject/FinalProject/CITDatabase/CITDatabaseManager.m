//
//  CITDatabaseManager.m
//  MobileFieldCollection
//
//  Created by Guilherme de Andrade on 25/09/12.
//  Copyright (c) 2012 Monsanto Company. All rights reserved.
//

#import "CITDatabaseManager.h"
#import "NSString+Additions.h"
#import "CITKeychain.h"
#import <stdlib.h>

#define DEFAULT_DBNAME @"database"
#define DEFAULT_DBUSER @"username"

#define KEYCHAIN_SERVICE @"CITDBService"

@interface CITDatabaseManager ()

@property (nonatomic, strong) NSString *dbName;
@property (nonatomic, strong) NSString *dbPath;
@property (nonatomic, strong) NSString *storageDirectory;

@end

@implementation CITDatabaseManager

+ (CITDatabaseManager *)sharedManager {
    static CITDatabaseManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

static NSString *databaseName = DEFAULT_DBNAME;
static NSString *databaseUser = DEFAULT_DBUSER;
static NSMutableArray *databaseMigrationSchemas;
static id<CITDatabaseSchema> databaseSchema;
//static BOOL migrationsEnabled = YES;
static BOOL cryptoEnabled = NO;

+ (void)registerDatabase:(NSString *)_databaseName forUser:(NSString *)_databaseUser withDatabaseSchema:(id<CITDatabaseSchema>)_databaseSchema
{
    
    databaseName = [_databaseName copy];
    databaseUser = [[[[_databaseUser ASCIIString] lowercaseString] MD5Hash] copy];
    databaseMigrationSchemas = [NSMutableArray array];
    databaseSchema = _databaseSchema;
    
}

+ (void)addMigrationSchema:(id<CITDatabaseSchemaMigration>)databaseSchemaMigration
{
    [databaseMigrationSchemas addObject:databaseMigrationSchemas];
}

+ (void)enableCrypto:(BOOL)enable
{
    cryptoEnabled = enable;
}

- (id)init
{
    self = [super init];
    if (nil != self) {
        [self setup];
    }
    return self;
}


#pragma mark - Criação e migração dos dados

- (void)createDatabase
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:_dbPath]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:_storageDirectory
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
        
        [self createTables];
    }
    [self executeMigration];
}


#pragma mark - Tables

- (void)createTables
{
    // Generate the database key
    NSInteger randKey = arc4random();
    NSString *randKeyHash = [[NSString stringWithFormat:@"%li", (long)randKey] MD5Hash];
    
    // Store the database key on the keychain
    [CITKeychain setPassword:randKeyHash forService:KEYCHAIN_SERVICE account:databaseUser];
    
    // Create the database
    CITDatabaseQueue* databaseQueue;
    if (cryptoEnabled) {
        databaseQueue = [CITDatabaseQueue databaseQueueWithPath:_dbPath andKey:randKeyHash];
    } else {
        databaseQueue = [CITDatabaseQueue databaseQueueWithPath:_dbPath];
    }
    
    [databaseQueue inTransaction:^(FMDatabase* db, BOOL *rollback){
        
        NSString *userVersion = [NSString stringWithFormat:@"PRAGMA user_version = %li;", (long)[databaseSchema schemaVersion]];
        [db executeUpdate:userVersion];
        
        for (NSString *sqlQuery in [databaseSchema createTableQueries]) {
            [db executeUpdate:sqlQuery];
        }
        
        for (NSString *sqlQuery in [databaseSchema createIndexQueries]) {
            [db executeUpdate:sqlQuery];
        }
    }];
}

#pragma mark - Migration

- (void) executeMigration
{
    
    if (databaseMigrationSchemas != nil && databaseMigrationSchemas.count > 0) {
        // Check for the database version
        
        CITDatabaseQueue *databaseQueue = [self databaseQueue];
        [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback){
            NSInteger userVersion = [databaseSchema schemaVersion];
            FMResultSet *rs = [db executeQuery:@"PRAGMA user_version;"];
            if ([rs next]) userVersion = [rs intForColumnIndex:0];
            for (id <CITDatabaseSchemaMigration> migrationSchema in databaseMigrationSchemas) {
                if (userVersion < [migrationSchema newVersion]) {
                    // Execute the migration
                }
            }
        }];
        
    }
}

- (void) deleteCurrentDatabase
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:_dbPath])
    {
        NSError *error;
        if (![fileManager removeItemAtPath:_dbPath error:&error])
        {
            NSLog(@"Error removing file: %@", error);
        };
    }
    
    if ([fileManager fileExistsAtPath:_storageDirectory]) {         NSError *error;
        if (![fileManager removeItemAtPath:_storageDirectory error:&error]) {
            NSLog(@"Error removing directory: %@", error);
        }
    }
}

#pragma mark - Directory

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0) ? [[paths objectAtIndex:0] stringByAppendingPathComponent:databaseUser] : nil;
}

- (CITDatabaseQueue*) databaseQueue
{
    if (cryptoEnabled) {
        NSString *key = [CITKeychain passwordForService:KEYCHAIN_SERVICE account:databaseUser];
        return [CITDatabaseQueue databaseQueueWithPath:_dbPath andKey:key];
    } else {
        return [CITDatabaseQueue databaseQueueWithPath:_dbPath];
    }
}

- (void)setup
{
    _dbName = [[NSString alloc] initWithFormat:@"%@.db", databaseName];
    _storageDirectory = [self documentsDirectory];
    _dbPath = [[NSString alloc] initWithFormat:@"%@/%@", _storageDirectory, _dbName];
    [self createDatabase];

}

@end
