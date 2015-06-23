//
//  CITHTTPSessionManager+Image.h
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 6/16/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITHTTPSessionManager.h"

@interface CITHTTPSessionManager (Image)
+ (void)getImage:(NSURL *)imageURL withCompletionBlock:(CITImageBlock)completion;

@end
