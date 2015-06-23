//
//  Client.h
//  
//
//  Created by Henrique Cesar Gouveia on 6/16/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Client : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phonenumber;

@end
