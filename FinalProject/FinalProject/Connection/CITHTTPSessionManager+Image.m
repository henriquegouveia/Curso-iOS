//
//  CITHTTPSessionManager+Image.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 6/16/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager+Image.h"

@implementation CITHTTPSessionManager (Image)

+(void)getImage:(NSURL *)imageURL withCompletionBlock:(CITImageBlock)completion{
    NSURLSession *urlSession = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];
    [[urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
}

@end
