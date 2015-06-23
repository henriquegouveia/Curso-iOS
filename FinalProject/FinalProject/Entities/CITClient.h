//
//  CITClient.h
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 3/4/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CITEntityProtocol.h"

/* JSON EXAMPLE
 
 {
 "id": 1,
 "gender": "Male",
 "firstName": "Aaron",
 "lastName": "Collins",
 "email": "acollins0@wikimedia.org",
 "phoneNumber": "3-(386)109-9019"
 }

*/

@interface CITClient : NSObject <CITEntityProtocol>

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *phoneNumber;
@property (readonly, nonatomic) NSString *formattedName;
@property (nonatomic) NSInteger age;

@property (strong, nonatomic) UIImage *image;
@property (readonly, nonatomic) NSURL *pictureURL;

@end
