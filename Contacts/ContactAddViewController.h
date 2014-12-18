//
//  AddContactViewController.h
//  Contacts
//
//  Created by Yarmolchuk Dima on 12.12.14.
//  Copyright (c) 2014 yarmolchuk. All rights reserved.
//

@protocol ContactAddDelegate;

@class Contact;

@interface ContactAddViewController : UIViewController

@property (nonatomic, strong) Contact *contact;

@property (nonatomic, unsafe_unretained) id <ContactAddDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *userPicContact;

@property (weak, nonatomic) IBOutlet UITextField *firstNameContact;
@property (weak, nonatomic) IBOutlet UITextField *lastNameContact;
@property (weak, nonatomic) IBOutlet UITextField *phoneContact;
@property (weak, nonatomic) IBOutlet UITextField *emailContact;

@property (weak, nonatomic) IBOutlet UIButton *saveContact;
@property (weak, nonatomic) IBOutlet UIButton *addPhotoContact;
@property (weak, nonatomic) IBOutlet UIButton *closeAddContact;

- (IBAction)saveContact:(id)sender;
- (IBAction)closeViewController:(id)sender;

@end

#pragma mark - Delegate

@protocol ContactAddDelegate <NSObject>

- (void)contactAddViewController:(ContactAddViewController *)contactAddViewController didAddContact:(Contact *)contact;

@end
