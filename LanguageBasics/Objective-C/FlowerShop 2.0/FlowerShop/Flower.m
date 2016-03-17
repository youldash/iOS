//
//  Flower.m
//  FlowerShop
//
//  Created by Mustafa Youldash on 13/03/2016.
//  Copyright © 2016 Umm Al-Qura University. All rights reserved.
//
//  Except where otherwise noted, this work is vested in Umm Al-Qura University <http://www.uqu.edu.sa/> and is licensed under the
//  Creative Commons Attribution-NonCommercial 4.0 International License <http://creativecommons.org/licenses/by-nc/4.0/>.
//
//  Unless otherwise stated, no part of this work may be reproduced and redistributed by any process,
//  nor used for commercial purposes without the written permission of Umm Al-Qura University and the author.
//
//  If you modify or build upon the work, you may only distribute the resulting work under the same license conditions as this one.
//

#import "Flower.h"

/**
 *	Static constants.
 */
static const NSInteger kFlowerNumberDefault = 0;

/**
 *  A flower (base) class interface v2.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@implementation Flower

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated flower.
 *
 *  @return The new flower.
 */
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.name = @"A flower";
        self.number = kFlowerNumberDefault;
        self.price = @(10.0);
        self.image = nil;
    }
    
    return self;
}

#pragma mark -
#pragma mark Querying

/**
 *	Returns a string that describes this flower.
 *
 *	@return The string.
 */
- (NSString *)description
{
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendFormat:@"<Flower: name=%@, number=%ld, price=%.2f, image=%@",
     self.name,
     self.number,
     self.price.doubleValue,
     self.image];
    
    [string appendString:@"]>"];
    
    return string;
}

#pragma mark -
#pragma mark Accessing

/**
 *  The name getter.
 */
- (NSString *)name
{
    return _name;
}

/**
 *  The name setter.
 */
- (void)setName:(NSString *)name
{
    if ([_name isEqualToString:name]) {
        
        return;
    }
    
    _name = [name copy];
}

/**
 *  The sequence number getter.
 */
- (NSInteger)number
{
    return _number;
}

/**
 *  The sequence number setter.
 */
- (void)setNumber:(NSInteger)number
{
    _number = number;
}

/**
 *  The price getter.
 */
- (NSNumber *)price
{
    return _price;
}

/**
 *  The price setter.
 */
- (void)setPrice:(NSNumber *)price
{
    if (_price == price) {
        
        return;
    }
    
    _price = price;
}

/**
 *  The image getter.
 */
- (id)image
{
    return _image;
}

/**
 *  The image setter.
 */
- (void)setImage:(id)image
{
    if (_image == image) {
        
        return;
    }
    
    _image = image;
}

@end
