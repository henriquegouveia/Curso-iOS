//
//  NoteModel.h
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 7/1/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteModel : NSObject

@property (strong, nonatomic) NSNumber *identification;
@property (strong, nonatomic) NSString *title;

+(instancetype)populateFromJSON:(NSDictionary *)json;
@end
