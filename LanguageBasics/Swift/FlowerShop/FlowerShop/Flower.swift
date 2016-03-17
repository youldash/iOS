//
//  Flower.swift
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

/**
*	Static constants.
*/
let kFlowerNumberDefault: Int = 0

/**
 *  A flower (base) class interface (Swift v1.0).
 */
class Flower: NSObject {
    /**
     *  A flower name.
     */
    var name: String = ""
    /**
     *  A flower sequence number.
     */
    var number: Int = 0
    /**
     *  A flower price.
     */
    var price: NSNumber = 0.0
    /**
     *  An image (generic data) associated with this flower.
     */
    weak var image: AnyObject?
    
    /**
    *  Designated initializer.
    *  Initializes a newly allocated flower.
    *
    *  @return The new flower.
    */
    override init() {
        
        self.name = "Flower"
        self.number = kFlowerNumberDefault
        self.price = 10.0
    }
    
    /**
     *	Returns a string that describes this flower.
     *
     *	@return The string.
     */
    override var description : String {
        
        let string: NSMutableString = NSMutableString()
        string.appendFormat("<Flower: name=%@, number=%ld, price=$%.2f", self.name, self.number, self.price.doubleValue)
        string.appendString("]>")
        
        return string as String
    }
}
