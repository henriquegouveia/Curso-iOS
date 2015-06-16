//
//  CITBlocks.h
//  Aula2
//
//  Created by Henrique Cesar Gouveia on 2/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CITEntityProtocol.h"

#ifndef Aula2_CITBlocks_h
#define Aula2_CITBlocks_h

typedef void (^CITRequestResults)(NSArray *results);
typedef void (^CITStatusBlock)(BOOL success);
typedef void (^CITImageBlock)(UIImage *image);

#endif
