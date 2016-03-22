//
//  FlowerShop.swift
//  FlowerShop
//
//  Created by Moose on 21/03/2016.
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
 *  Protocol implemented by all flower shops.
 */
protocol FlowerShopDelegate {
    
    /**
     *  Tells whether a flower was sold or not.
     */
    var sold: Bool {get set}
    
    /**
     *  Flower shop will add a new flower.
     *
     *  @param flowerShop   A flower.
     *  @param flower       A flower.
     */
    func flowerShop(flowerShop: FlowerShop, willAddFlower flower: Flower)
    
    /**
     *  Flower shop did add a new flower.
     *
     *  @param flowerShop   A flower.
     *  @param flower       A flower.
     */
    func flowerShop(flowerShop: FlowerShop, didAddFlower flower: Flower)
}

/**
 *  A flower shop class interface v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
class FlowerShop: NSObject {
    
    /**
     *  An array of flowers.
     */
    var flowers: [Flower] = []
    
    /**
     *  A FlowerShop delegate.
     */
    var delegate: FlowerShopDelegate?
    
    /**
     *  Designated initializer.
     *  Initializes a newly allocated flower.
     *
     *  @return The new flower shop.
     */
    override init() {
        
        super.init()
        
        self.flowers = [Flower]()
    }
    
    /**
     *  Returns the current number (count) of flowers in the local array;
     */
    
    func count() -> Int {
        
        return flowers.count
    }
    
    /**
     *  Returns the flower at a given index.
     *
     *  @param idx The index of the flower.
     *
     *  @return The flower, nil otherwise.
     */
    func flowerAtIndex(idx: Int) -> Flower {
        
        // Return a flower at (idx), nil otherwise.
        return flowers[idx]
    }
    
    /**
     *  Adds a flower to the local flowers array.
     *
     *  @param flower A flower to add.
     */
    func addFlower(flower: Flower) {
        
        // Inform our delegate that a new flower will be added.
        let willAddFlower = self.respondsToSelector(Selector("flowerShop:willAddFlower:"))
        
        if willAddFlower {
            
            self.delegate!.flowerShop(self, willAddFlower: flower)
        }
        
        // Update its number with relation to the current total number of added flowers.
        flower.number = Int(flowers.count)
        
        // Insert it.
        flowers.append(flower)
        
        // Inform our delegate that a new flower was added.
        let didAddFlower = self.respondsToSelector(Selector("flowerShop:didAddFlower:"))
        
        if didAddFlower {
            
            self.delegate!.sold = false
            self.delegate!.flowerShop(self, didAddFlower: flower)
        }
        
        // Inform our delegate that a new flower is not sold yet.
        let sold = self.respondsToSelector(Selector("setSold:"))
        
        if sold {
            
            self.delegate!.sold = true
        }
    }
    
    /**
     *  Removes a flower to the local flowers array.
     *
     *  @param flower A photo to remove.
     *
     *  @return A boolean value that indicates whether this operation was successful.
     */
    func removeFlower(flower: Flower) -> Bool {
        
        // Loop through each flower instance in the flowers array.
        for flower: Flower in self.flowers {
            
            // A match is found if all parameter/property values appear to be identical.
            if flower.number == flower.number && (flower.name == flower.name) {
                
                // Remove the flower.
                flowers.removeAtIndex(flower.number)
                
                // Flower was removed.
                return true
            }
        }
        
        // Flower was not removed.
        return false
    }
}
