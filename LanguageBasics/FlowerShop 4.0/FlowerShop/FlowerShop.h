//
//  FlowerShop.h
//  FlowerShop
//
//  Created by Moose on 14/03/2016.
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

@class Flower;
@class FlowerShop;

/**
 *  Protocol implemented by all flower shops.
 */
@protocol FlowerShopDelegate <NSObject>

@optional /* @required by default. */

/**
 *  Tells whether a flower was sold or not.
 */
@property BOOL sold;

/**
 *  Flower shop will add a new flower.
 *
 *  @param flowerShop   A flower.
 *  @param flower       A flower.
 */
- (void)flowerShop:(FlowerShop *)flowerShop willAddFlower:(Flower *)flower;

/**
 *  Flower shop did add a new flower.
 *
 *  @param flowerShop   A flower.
 *  @param flower       A flower.
 */
- (void)flowerShop:(FlowerShop *)flowerShop didAddFlower:(Flower *)flower;

@end

#pragma mark -

/**
 *  A flower shop class interface v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@interface FlowerShop : NSObject {
    
    /* @protected by default. */

    /**
     *  An array of flowers.
     */
    NSMutableArray *_flowers;
}

#pragma mark -
#pragma mark Accessing

/**
 *  A Grapher scene delegate.
 */
@property (weak) id<FlowerShopDelegate> delegate;

/**
 *  Returns the current number (count) of flowers in the local array;
 */
@property (readonly) NSUInteger count;

#pragma mark -
#pragma mark Querying

/**
 *  Returns the flower at a given index.
 *
 *  @param idx The index of the flower.
 *
 *  @return The flower.
 */
- (Flower *)flowerAtIndex:(NSUInteger)idx;

#pragma mark -
#pragma mark Modifying

/**
 *  Adds a flower to the local flowers array.
 *
 *  @param flower A flower to add.
 */
- (void)addFlower:(Flower *)flower;

/**
 *  Removes a flower to the local flowers array.
 *
 *  @param flower A photo to remove.
 *
 *  @return A boolean value that indicates whether this operation was successful.
 */
- (BOOL)removeFlower:(Flower *)flower;

@end
