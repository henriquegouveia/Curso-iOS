//
//  TIOCustomCell.m
//  Aula3
//
//  Created by Henrique Cesar Gouveia on 5/26/15.
//  Copyright (c) 2015 Henrique Gouveia. All rights reserved.
//

#import "TIOCustomCell.h"

@interface TIOCustomCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation TIOCustomCell

- (IBAction)showLabelValue:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Message" message:self.nameLabel.text delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
}

- (void)populateFields:(NSString *)object {
    self.profilePicture.image = [UIImage imageNamed:@"img1.png"];
    self.nameLabel.text = object;
}

@end
