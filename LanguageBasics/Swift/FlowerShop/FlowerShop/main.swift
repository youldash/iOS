//
//  main.swift
//  FlowerShop
//
//  Created by Mustafa Youldash on 17/03/2016.
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

// insert code here...
var flower: Flower = Flower()
NSLog("Flower:")
NSLog("Name: %@", flower.name)
NSLog("Number: %ld", flower.number)
NSLog("Price: %.2f", CDouble(flower.price.doubleValue))

var arrayOfFlowers: [Flower] = [Flower]()
arrayOfFlowers.append(flower)

NSLog("%@", arrayOfFlowers[0].description)
NSLog("Using a normal for-loop...")
for var i = 0; i < arrayOfFlowers.count; i++ {
    
    var flower: Flower = arrayOfFlowers[i] 
    NSLog("%lu Name: %@", i, flower.name)
    NSLog("%lu Number: %ld", i, flower.number)
    NSLog("%lu Price: %.2f", i, CDouble(flower.price.doubleValue))
}

NSLog("Using fast enumeration...")
var i: Int = 0
for flower: Flower in arrayOfFlowers {
    
    NSLog("%lu Name: %@", i, flower.name)
    NSLog("%lu Number: %ld", i, flower.number)
    NSLog("%lu Price: %.2f", i, CDouble(flower.price.doubleValue))
    i++
}

// Invoke the FlowerShop unit test program.
FlowerShopTester().performTests()
