//
//  NoteModel.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 7/1/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "NoteModel.h"

@implementation NoteModel
+(instancetype)populateFromJSON:(NSDictionary *)json{
    NoteModel *result = [NoteModel new];
    result.identification = [json valueForKey:@"id"];
    result.title = [json valueForKey:@"title"];
    return result;
}
@end
