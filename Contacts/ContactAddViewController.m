//
//  AddContactViewController.m
//  Contacts
//
//  Created by Yarmolchuk Dima on 12.12.14.
//  Copyright (c) 2014 yarmolchuk. All rights reserved.
//

#import "ContactAddViewController.h"
#import "Contact.h"

@interface ContactAddViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation ContactAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

#pragma mark - UITextViewDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

#pragma mark - actions

- (IBAction)addPhotoContact:(id)sender {

    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)saveContact:(id)sender {
    
    self.contact.firstName = self.firstNameContact.text;
    self.contact.lastName = self.lastNameContact.text;
    self.contact.phone = self.phoneContact.text;
    self.contact.email = self.emailContact.text;
    
    NSError *error = nil;

    if (![self.contact.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    [self.delegate contactAddViewController:self didAddContact:self.contact];
}

- (IBAction)closeViewController:(id)sender {
    [self.contact.managedObjectContext deleteObject:self.contact];
    
    NSError *error = nil;
    if (![self.contact.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    [self.delegate contactAddViewController:self didAddContact:nil];
}

#pragma mark - photo

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)selectedImage editingInfo:(NSDictionary *)editingInfo {
    
    // Delete any existing image.
    NSManagedObject *oldImage = self.contact.image;
    
    if (oldImage != nil) {
        [[[CoreDataManager sharedInstance] managedObjectContext] deleteObject:oldImage];
    }
    
    // Create an image object for the new image.
    NSManagedObject *image = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:[[CoreDataManager sharedInstance] managedObjectContext]];
    self.contact.image = image;
    
    // Set the image for the image managed object.
    [image setValue:selectedImage forKey:@"image"];
    
    // Create a thumbnail version of the image for the recipe object.
    CGSize size = selectedImage.size;
    CGFloat ratio = 0;
    if (size.width > size.height) {
        ratio = 100.0 / size.width;
    } else {
        ratio = 100.0 / size.height;
    }
    CGRect rect = CGRectMake(0.0, 0.0, ratio * size.width, ratio * size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    [selectedImage drawInRect:rect];
    self.userPicContact.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.addPhotoContact setTitle:@"" forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
