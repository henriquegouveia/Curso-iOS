//
//  NoteConnectionManager.h
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 7/1/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteModel.h"
#import "Block.h"

@interface NoteConnectionManager : NSObject

+ (void)getNotesWithCompletionBlock:(NotesResultCompletionBlock) completion;
+ (void)createNote:(NoteModel *)noteModel;
+ (void)deleteNote:(NSNumber *)identification;

@end
