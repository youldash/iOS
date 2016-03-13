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
 *  A flower (base) class implementation v1.0.
 *  This class uses Manual Retain Release (MRR), which is triggered in Xcode using the special compiler flag "-fno-objc-arc".
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
        
        [self setName:@"A flower"];
        [self setNumber:kFlowerNumberDefault];
        [self setPrice:[NSNumber numberWithDouble:10.0]];
        [self setImage:nil];
    }
    
    return self;
}

/**
 *  Deallocates the memory occupied by this flower.
 */
- (void)dealloc
{
    [_name release];
    [_price release];
    [_image release];
        
    [super dealloc];
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
     [self name],
     [self number],
     [[self price] doubleValue],
     [self image]];
    
    [string appendString:@"]>"];
    
    return [string autorelease];
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
    
    NSString *oldName = _name;
    
    _name = [name copy];
    
    [oldName release];
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
    
    NSNumber *oldPrice = _price;
    
    _price = [price retain];
    
    [oldPrice release];
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
    
    id oldImage = _image;
    
    _image = [image retain];
    
    [oldImage release];
}

@end
