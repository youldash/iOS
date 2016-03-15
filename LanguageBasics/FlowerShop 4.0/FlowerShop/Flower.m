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
        
        self.name = @"Flower";
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
    [string appendFormat:@"<Flower: name=%@, number=%ld, price=$%.2f, image=%@",
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
 *  A flower name.
 */
@synthesize name = _name;

/**
 *  A flower sequence number.
 */
@synthesize number = _number;

/**
 *  A flower price.
 */
@synthesize price = _price;

/**
 *  An image (generic data) associated with this flower.
 */
@synthesize image = _image;

@end
