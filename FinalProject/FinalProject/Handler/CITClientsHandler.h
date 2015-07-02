//
//  CITClientsHandler.h
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 6/23/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CITClientsHandler : NSObject

// filtre todos os clientes do sexo masculino e email wikimedia
+ (NSArray *)getMale:(NSArray *)clients;

// filtre todos os clientes que contenha "Ale" no nome ou sobrenome
+(NSArray *)getAleNameOrLastName:(NSArray *)clients;

// filtre todos os clientes que usem email com dominio xing
+ (NSArray*)getAllXing:(NSArray*) clients;

// exibir somente os telefones
+ (NSArray*)getPhoneNumber:(NSArray*) clients;
// exibir somente os nomes
+ (NSArray *)getName:(NSArray *)clients;
@end
