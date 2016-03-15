//
//  FlowerShopTester.m
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

#import "FlowerShopTester.h"
#import "FlowerShop.h"
#import "Flower.h"
#import "GardenRose.h"
#import "Iris.h"

@implementation FlowerShopTester

#pragma mark -
#pragma mark FlowerShopDelegate

/**
 *  Tells whether a flower was sold or not.
 */
@synthesize sold = _sold;

/**
 *  Flower shop will add a new flower.
 *
 *  @param flowerShop   A flower.
 *  @param flower       A flower.
 */
- (void)flowerShop:(FlowerShop *)flowerShop willAddFlower:(Flower *)flower
{
    NSLog(@"%s: %@", __FUNCTION__, flower);
}

/**
 *  Flower shop did add a new flower.
 *
 *  @param flowerShop   A flower.
 *  @param flower       A flower.
 */
- (void)flowerShop:(FlowerShop *)flowerShop didAddFlower:(Flower *)flower
{
    NSLog(@"%s: %@", __FUNCTION__, flower);
}

#pragma mark -
#pragma mark Testing

/**
 *	FlowerShop unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
- (BOOL)performTests
{
    NSLog(@"FlowerShop unit test program.");
    NSLog(@"--------------------------------------------");
    
    FlowerShop *shop = [FlowerShop new];
    shop.delegate = self;
    
    // Add one flower.
    [shop addFlower:[Flower new]];
    
    // Sold or not?
    NSLog(@"Sold? %@", (shop.delegate.sold ? @"YES" : @"NO"));

    // Add another flower.
    Flower *gardenRose = [[GardenRose alloc] init];
    
    [shop addFlower:gardenRose];
    
    // Add another flower.
    [shop addFlower:[Iris new]];

    NSLog(@"Using a normal for-loop...");
    for (NSUInteger i = 0; i < [shop count]; i++) {
        
        Flower *flower = [shop flowerAtIndex:i];
        
        NSLog(@"%lu Name: %@", i, [flower name]);
        NSLog(@"%lu Number: %ld", i, [flower number]);
        NSLog(@"%lu Price: $%.2f", i, [[flower price] doubleValue]);
        NSLog(@"%lu Image: %@", i, [flower image]);
    }
    
    // Remove one flower.
    if ([shop removeFlower:gardenRose]) {
        
        NSLog(@"Removed \"gardenRose\"...");
        NSLog(@"Using a normal for-loop...");
        for (NSUInteger i = 0; i < [shop count]; i++) {
            
            Flower *flower = [shop flowerAtIndex:i];
            
            NSLog(@"%lu Name: %@", i, [flower name]);
            NSLog(@"%lu Number: %ld", i, [flower number]);
            NSLog(@"%lu Price: $%.2f", i, [[flower price] doubleValue]);
            NSLog(@"%lu Image: %@", i, [flower image]);
        }
    }
    
    // Successful.
    return YES;
}

@end
