//
//  Flower.h
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

#import <Foundation/Foundation.h>

/**
 *  A flower (base) class interface v1.0.
 *  This class uses Manual Retain Release (MRR), which is triggered in Xcode using the special compiler flag "-fno-objc-arc".
 */
@interface Flower : NSObject {
    
@private
    /* A flower name. */
    NSString *_name;
    
@public
    /* A flower sequence number. */
    NSInteger _number;
    
@protected
    /* A flower price. */
    NSNumber *_price;

    /* An image (generic data) associated with this flower. */
    id _image;
}

#pragma mark -
#pragma mark Accessing

/**
 *  The name getter.
 */
- (NSString *)name;

/**
 *  The name setter.
 */
- (void)setName:(NSString *)name;

/**
 *  The sequence number getter.
 */
- (NSInteger)number;

/**
 *  The sequence number setter.
 */
- (void)setNumber:(NSInteger)number;

/**
 *  The price getter.
 */
- (NSNumber *)price;

/**
 *  The price setter.
 */
- (void)setPrice:(NSNumber *)price;

/**
 *  The image getter.
 */
- (id)image;

/**
 *  The image setter.
 */
- (void)setImage:(id)image;

@end
