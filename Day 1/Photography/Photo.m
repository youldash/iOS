//
//  Photo.m
//  Photography
//
//  Created by Mustafa Youldash on 24/02/2016.
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

#import "Photo.h"

/**
 *	Static constant.
 */
static const int kNumberDefault = 0;

@implementation Photo

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *	Initializes a newly allocated photo.
 *
 *  @return The new photo.
 */
- (instancetype)init
{
    NSAssert([self isMemberOfClass:[Photo class]], @"Photo class not instantiated.");
    
    // Immutable photo, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize the two properties with some dummy values.
        self.number = kNumberDefault;
        self.caption = @"Photo of a celebrity";
        self.photographer = @"Paparazzi";
    }
    
    // Return this photo.
    return self;
}

#pragma mark -
#pragma mark Querying

/**
 *	Returns a string that describes this photo.
 *
 *	@return	The string.
 */
- (NSString *)description
{
    // Establish the description string.
    NSMutableString *string = [NSMutableString stringWithString:@"<Photo: data=["];
    
    [string appendFormat:@"#%i: %@, brought to you by %@",
     self.number,
     self.caption,
     self.photographer];
    
    [string appendFormat:@"]>"];
    
    // Return it.
    return string;
}

@end
