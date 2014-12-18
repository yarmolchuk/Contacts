//
//  ContactTableViewCell.m
//  Contacts
//
//  Created by Yarmolchuk Dima on 12.12.14.
//  Copyright (c) 2014 yarmolchuk. All rights reserved.
//

#import "ContactTableViewCell.h"
#import "Contact.h"

@interface ContactTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *contactImageView;

@property (weak, nonatomic) IBOutlet UILabel *firstNameLable;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *emailLable;

@end

@implementation ContactTableViewCell


#pragma mark - Recipe set accessor

- (void)setContact:(Contact *)newContact {
    
    if (newContact != _contact) {
        _contact = newContact;
    }
        
    self.contactImageView.image = [_contact.image valueForKey:@"image"];

    self.firstNameLable.text = _contact.firstName;
    self.lastNameLable.text = _contact.lastName;
    self.phoneLable.text = _contact.phone;
    self.emailLable.text = _contact.email;
}

@end
