//
//  CITDatabaseQueue.h
//  MobileFieldCollection
//
//  Created by Guilherme Martinez Sampaio on 9/25/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

@interface CITDatabaseQueue : FMDatabaseQueue

+ (id)databaseQueueWithPath:(NSString *)aPath andKey:(NSString*)key;
- (FMDatabase*)database;
@end
