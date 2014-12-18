//
//  Contact.h
//  Contacts
//
//  Created by Yarmolchuk Dima on 12.12.14.
//  Copyright (c) 2014 yarmolchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ImageToDataTransformer : NSValueTransformer
@end

@interface Contact : NSManagedObject

@property (nonatomic, retain) id thumbnailImage;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * email;

@property (nonatomic, retain) NSManagedObject *image;

@end
