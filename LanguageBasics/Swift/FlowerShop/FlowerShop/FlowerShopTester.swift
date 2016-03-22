//
//  FlowerShopTester.swift
//  FlowerShop
//
//  Created by Moose on 22/03/2016.
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

import Foundation

/**
 *  FlowerShop unit test class.
 */
class FlowerShopTester: NSObject, FlowerShopDelegate {
    
    /**
     *  Tells whether a flower was sold or not.
     */
    var sold: Bool

    /**
     *  Flower shop will add a new flower.
     *
     *  @param flowerShop   A flower.
     *  @param flower       A flower.
     */
    func flowerShop(flowerShop: FlowerShop, willAddFlower flower: Flower) {
        
        NSLog("%s: %@", __FUNCTION__, flower)
    }
    
    /**
     *  Flower shop did add a new flower.
     *
     *  @param flowerShop   A flower.
     *  @param flower       A flower.
     */
    func flowerShop(flowerShop: FlowerShop, didAddFlower flower: Flower) {
        
        NSLog("%s: %@", __FUNCTION__, flower)
    }
    
    /**
     *  Designated initializer.
     *  Initializes a newly allocated flower.
     *
     *  @return The new flower shop.
     */
    override init() {
        
        self.sold = false
    }
    
    /**
     *	FlowerShop unit test program.
     *
     *	@return	A boolean value that indicates whether all the tests were successful.
     */
    func performTests() -> Bool {
        
        NSLog("FlowerShop unit test program.")
        NSLog("--------------------------------------------")
        
        let shop: FlowerShop = FlowerShop()
        shop.delegate = self
        
        // Add one flower.
        shop.addFlower(Flower())
        
        // Sold or not?
        NSLog("Sold? %@", (shop.delegate!.sold ? "YES" : "NO"))
        
        // Add another flower.
        let gardenRose: Flower = GardenRose()
        
        shop.addFlower(gardenRose)
        
        // Add another flower.
        shop.addFlower(Iris())

        NSLog("Using a normal for-loop...")
        for var i = 0; i < shop.count(); i++ {
            
            let flower: Flower = shop.flowerAtIndex(i)
            NSLog("%lu Name: %@", i, flower.name)
            NSLog("%lu Number: %ld", i, flower.number)
            NSLog("%lu Price: $%.2f", i, CDouble(flower.price.doubleValue))
        }

        // Remove one flower.
        if shop.removeFlower(gardenRose) {
            
            NSLog("Removed \"gardenRose\"...")
            NSLog("Using a normal for-loop...")
            for var i = 0; i < shop.count(); i++ {
                
                let flower: Flower = shop.flowerAtIndex(i)
                NSLog("%lu Name: %@", i, flower.name)
                NSLog("%lu Number: %ld", i, flower.number)
                NSLog("%lu Price: $%.2f", i, CDouble(flower.price.doubleValue))
            }
        }

        // Successful.
        return true;
    }
}