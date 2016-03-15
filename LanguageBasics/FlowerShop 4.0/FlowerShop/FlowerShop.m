//
//  FlowerShop.m
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

#import "FlowerShop.h"
#import "Flower.h"

@implementation FlowerShop

#pragma mark -
#pragma mark Accessing

/**
 *  A Grapher scene delegate.
 */
@synthesize delegate = _delegate;

/**
 *  Returns the current number (count) of flowers in the local array;
 */
- (NSUInteger)count
{
    if (_flowers) {
        
        return _flowers.count;
    }
    
    return 0;
}

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated flower shop.
 *
 *  @return The new flower shop.
 */
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        _flowers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Querying

/**
 *  Returns the flower at a given index.
 *
 *  @param idx The index of the flower.
 *
 *  @return The flower, nil otherwise.
 */
- (Flower *)flowerAtIndex:(NSUInteger)idx
{
    // Return a flower at (idx), nil otherwise.
    return [_flowers objectAtIndex:idx];
}

#pragma mark -
#pragma mark Modifying

/**
 *  Adds a flower to the local flowers array.
 *
 *  @param flower A flower to add.
 */
- (void)addFlower:(Flower *)flower
{
    // Inform our delegate that a new flower will be added.
    if ([_delegate respondsToSelector:@selector(flowerShop:willAddFlower:)]) {
        
        [_delegate flowerShop:self willAddFlower:flower];
    }

    // Update its number with relation to the current total number of added flowers.
    flower.number = (NSInteger)_flowers.count;
    
    // Insert it.
    [_flowers addObject:flower];
    
    // Inform our delegate that a new flower was added.
    if ([_delegate respondsToSelector:@selector(flowerShop:didAddFlower:)]) {
        
        [_delegate setSold:NO];
        [_delegate flowerShop:self didAddFlower:flower];
    }
    
    // Inform our delegate that a new flower is not sold yet.
    if ([_delegate respondsToSelector:@selector(setSold:)]) {
        
        [_delegate setSold:YES];
    }
}

/**
 *  Removes a flower to the local flowers array.
 *
 *  @param flower A photo to remove.
 *
 *  @return A boolean value that indicates whether this operation was successful.
 */
- (BOOL)removeFlower:(Flower *)flower
{
    // Loop through each flower instance in the flowers array.
    for (Flower *_flower in _flowers) {
        
        // A match is found if all parameter/property values appear to be identical.
        if (_flower.number == flower.number &&
            [_flower.name isEqualToString:flower.name]) {
            
            // Remove the flower.
            [_flowers removeObjectAtIndex:_flower.number];
            
            // Flower was removed.
            return YES;
        }
    }
    
    // Flower was not removed.
    return NO;
}

@end
