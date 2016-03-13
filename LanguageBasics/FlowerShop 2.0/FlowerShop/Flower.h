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
 *  A flower (base) class interface v2.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@interface Flower : NSObject {
    
    /* A flower name. */
    NSString *_name;
    
    /* A flower sequence number. */
    NSInteger _number;
    
    /* A flower price. */
    NSNumber *_price;

    /* An image (generic data) associated with this flower. */
    id _image;
}

#pragma mark -
#pragma mark Accessing

/**
 *  A flower name.
 */
@property (copy, getter=name, setter=setName:) NSString *name;

/**
 *  A sequence number.
 */
@property (assign, getter=number, setter=setNumber:) NSInteger number;

/**
 *  A price.
 */
@property (strong, getter=price, setter=setPrice:) NSNumber *price;

/**
 *  An image.
 */
@property (weak, getter=image, setter=setImage:) id image;

@end
