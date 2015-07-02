//
//  CITClientsHandler.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 6/23/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITClientsHandler.h"

@implementation CITClientsHandler

+ (NSArray *)getMale:(NSArray *)clients{
    NSPredicate *malePredicate = [NSPredicate predicateWithFormat:@"gender LIKE[cd] 'male'"];
    
    NSArray *result = [clients filteredArrayUsingPredicate:malePredicate];
    return result;
}

+ (NSArray *)getAleNameOrLastName:(NSArray *)clients {
    
    NSPredicate *aleNamePredicate = [NSPredicate predicateWithFormat:@"firstName CONTAINS[cd] 'ale'"];

    NSPredicate *aleLastNamePredicate = [NSPredicate predicateWithFormat:@"lastName CONTAINS[cd] 'ale'"];
    
    NSCompoundPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[aleLastNamePredicate, aleNamePredicate]];
    
    NSArray *results = [clients filteredArrayUsingPredicate:predicate];
    
    return results;
}

+(NSArray *)getAllXing:(NSArray *)clients{
    NSArray *result;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email CONTAINS[cd] 'xing'"];
    
    result = [clients filteredArrayUsingPredicate:predicate];
    return result;
}

+(NSArray *)getPhoneNumber:(NSArray *)clients{
    return [clients valueForKeyPath:@"phoneNumber"];
}

+(NSArray *)getName:(NSArray *)clients{
    return [clients valueForKeyPath:@"formattedName"];
}
@end
