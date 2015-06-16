//
//  CITEntityProtocol.h
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 2/27/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#ifndef Aula2_CITEntityProtocol_h
#define Aula2_CITEntityProtocol_h
#import <FMResultSet.h>

@protocol CITEntityProtocol <NSObject>

+ (instancetype)populateFromJSON:(NSDictionary *)json;
+ (instancetype)populateFromResultSet:(FMResultSet *) resultSet;

@end

#endif
