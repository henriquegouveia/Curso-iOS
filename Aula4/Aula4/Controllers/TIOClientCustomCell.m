//
//  TIOClientCustomCell.m
//  Aula4
//
//  Created by Henrique Cesar Gouveia on 6/2/15.
//  Copyright (c) 2015 Ci&T. All rights reserved.
//

#import "TIOClientCustomCell.h"

@interface TIOClientCustomCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation TIOClientCustomCell

- (void)populateCellWithEntity:(TIOClient *)client {
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", client.firstName, client.lastName];
    self.genderLabel.text = client.gender;
    self.phoneNumberLabel.text = client.phoneNumber;
    self.emailLabel.text = client.email;
}

@end
