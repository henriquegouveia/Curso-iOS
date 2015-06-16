//
//  CITDatabaseQueue.m
//  MobileFieldCollection
//
//  Created by Guilherme Martinez Sampaio on 9/25/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "CITDatabaseQueue.h"

@interface FMDatabaseQueue (ExposeInterface)
- (FMDatabase*)database;
@end

@implementation CITDatabaseQueue

+ (id)databaseQueueWithPath:(NSString *)aPath andKey:(NSString*)key
{
    CITDatabaseQueue *q = [[self alloc] initWithPath:aPath andKey:key];
    FMDBAutorelease(q);
    
    return q;
}

- (id) initWithPath:(NSString*)aPath andKey:(NSString*)key
{
    self = [super initWithPath:aPath];

    if (self != nil) {
        NSString *pragmaKey = [NSString stringWithFormat:@"PRAGMA key = '%@';", key];
        [_db executeUpdate:pragmaKey];

        
#ifdef DEBUG
        [_db setLogsErrors:YES];
        [_db setTraceExecution:YES];
#endif
    }
    
    return self;
}

- (id) initWithPath:(NSString *)aPath
{
    self = [super initWithPath:aPath];
    if (self != nil) {
#ifdef DEBUG
        [_db setLogsErrors:YES];
        [_db setTraceExecution:YES];
#endif
    }
    
    return self;
}

- (FMDatabase*) database
{
    return [super database];
}

@end
