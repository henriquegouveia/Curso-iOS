//
//  CITDatabaseSchema.m
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 3/2/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITDatabaseSchema.h"

/* Implement the necessary methods to create your database */

@implementation CITDatabaseSchema

- (NSInteger)schemaVersion {
    return 1;
}

-(NSArray *)createIndexQueries{
    return [self createTableQueries];
    
}
- (NSArray *)createTableQueries {
    return nil;
}

@end
