//
//  Contact.m
//  Contacts
//
//  Created by Yarmolchuk Dima on 12.12.14.
//  Copyright (c) 2014 yarmolchuk. All rights reserved.
//

#import "Contact.h"


@implementation Contact

@dynamic thumbnailImage;
@dynamic lastName;
@dynamic firstName;
@dynamic phone;
@dynamic email;
@dynamic image;

@end

#pragma mark -

@implementation ImageToDataTransformer

+ (BOOL)allowsReverseTransformation {
    return YES;
}

+ (Class)transformedValueClass {
    return [NSData class];
}

- (id)transformedValue:(id)value {
    NSData *data = UIImagePNGRepresentation(value);
    return data;
}

- (id)reverseTransformedValue:(id)value {
    UIImage *uiImage = [[UIImage alloc] initWithData:value];
    return uiImage;
}

@end