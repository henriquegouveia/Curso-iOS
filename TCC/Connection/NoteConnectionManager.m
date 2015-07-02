//
//  NoteConnectionManager.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 7/1/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "NoteConnectionManager.h"
#import "NoteModel.h"

static NSString *const kBaseURL = @"http://private-3189d-finalproject.apiary-mock.com";

@interface NoteConnectionManager()


@end

@implementation NoteConnectionManager

+ (void)getNotesWithCompletionBlock:(NotesResultCompletionBlock) completion {
    
    NSURLSession *urlSession = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NoteConnectionManager createRequest:@"notes" withVerb:@"GET"];
    
    NSMutableArray  * __block result = [[NSMutableArray alloc]init];
    
    [[urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *dictionary in json) {
            NoteModel *model = [NoteModel populateFromJSON:dictionary];
            [result addObject:model];
        }
        completion(result);
        
    }] resume];
}

- (void)createNote:(NoteModel *)noteModel {
    
}

- (void)deleteNote:(NSNumber *)identification {
    
}

+ (NSURLRequest *) createRequest:(NSString *)path withVerb:(NSString *)verb {
    NSString *urlAbs = [NSString stringWithFormat:@"%@/%@", kBaseURL, path];
    NSURL *url = [NSURL URLWithString:urlAbs];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:verb];
    
    return request;
}

@end
