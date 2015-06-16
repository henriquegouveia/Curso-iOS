//
//  CITClientCustomCell.m
//  FinalProject
//
//  Created by Henrique Cesar Gouveia on 3/4/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "CITClientCustomCell.h"

@interface CITClientCustomCell ()

@property (weak, nonatomic) IBOutlet UIImageView *clientPicture;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation CITClientCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.clientPicture.layer setBorderColor:[UIColor redColor].CGColor];
}

- (void)populateCellWithObject:(CITClient *)client {
    
    self.nameLabel.text = client.formattedName;
    self.genderLabel.text = client.gender;
    self.emailLabel.text = client.email;
    self.phoneLabel.text = client.phoneNumber;
    
    [self loadImage:client];
}

/* Quem lembra do NSMutableURLRequest e o NSURLConnection? */
- (void)loadImage:(CITClient *)client {
    if (client.image) {
        self.clientPicture.image = client.image;
    } else {
        self.clientPicture.image = nil;
        [self requestImageFromWeb:client];
    }
}

- (void)requestImageFromWeb:(CITClient *)client {
  
}

@end
