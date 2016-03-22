# FlowerShop (Swift 2.2 Version)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

A Swift version of the final exercise is published here.

### The Flower Class

``` Swift
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
        
        super.init()

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
```

### The GardenRose Class

``` Swift
import Foundation

/**
 *  A flower subclass interface v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
class GardenRose: Flower {

    /**
     *  Designated initializer.
     *  Initializes a newly allocated flower.
     *
     *  @return The new flower.
     */
    override init() {
        
        super.init()
        
        self.name = "Garden Rose"
        self.price = 79.99
    }
}
```

### The Iris Class

``` Swift
import Foundation

/**
 *  A flower subclass interface v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
class Iris: Flower {
    
    /**
     *  Designated initializer.
     *  Initializes a newly allocated flower.
     *
     *  @return The new flower.
     */
    override init() {
        
        super.init()
        
        self.name = "Iris"
        self.price = 139.99
    }
}
```

### FlowerShopDelegate Protocol and FlowerShop Class

``` Swift
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
```

``` Swift
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
```

### The FlowerShopTester Class

``` Swift
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
```

## Compiling you Project

* Compile and run the program by clicking on the Run button, or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-03-22 11:10:32.759 FlowerShop[2844:106306] Flower:
2016-03-22 11:10:32.766 FlowerShop[2844:106306] Name: Flower
2016-03-22 11:10:32.766 FlowerShop[2844:106306] Number: 0
2016-03-22 11:10:32.767 FlowerShop[2844:106306] Price: 10.00
2016-03-22 11:10:32.769 FlowerShop[2844:106306] <Flower: name=Flower, number=0, price=$10.00]>
2016-03-22 11:10:32.769 FlowerShop[2844:106306] Using a normal for-loop...
2016-03-22 11:10:32.770 FlowerShop[2844:106306] 0 Name: Flower
2016-03-22 11:10:32.770 FlowerShop[2844:106306] 0 Number: 0
2016-03-22 11:10:32.770 FlowerShop[2844:106306] 0 Price: 10.00
2016-03-22 11:10:32.771 FlowerShop[2844:106306] Using fast enumeration...
2016-03-22 11:10:32.771 FlowerShop[2844:106306] 0 Name: Flower
2016-03-22 11:10:32.772 FlowerShop[2844:106306] 0 Number: 0
2016-03-22 11:10:32.772 FlowerShop[2844:106306] 0 Price: 10.00
2016-03-22 11:10:32.772 FlowerShop[2844:106306] FlowerShop unit test program.
2016-03-22 11:10:32.772 FlowerShop[2844:106306] --------------------------------------------
2016-03-22 11:10:32.773 FlowerShop[2844:106306] Sold? NO
2016-03-22 11:10:32.774 FlowerShop[2844:106306] Using a normal for-loop...
2016-03-22 11:10:32.776 FlowerShop[2844:106306] 0 Name: Flower
2016-03-22 11:10:32.777 FlowerShop[2844:106306] 0 Number: 0
2016-03-22 11:10:32.777 FlowerShop[2844:106306] 0 Price: $10.00
2016-03-22 11:10:32.778 FlowerShop[2844:106306] 1 Name: Garden Rose
2016-03-22 11:10:32.779 FlowerShop[2844:106306] 1 Number: 1
2016-03-22 11:10:32.779 FlowerShop[2844:106306] 1 Price: $79.99
2016-03-22 11:10:32.779 FlowerShop[2844:106306] 2 Name: Iris
2016-03-22 11:10:32.780 FlowerShop[2844:106306] 2 Number: 2
2016-03-22 11:10:32.780 FlowerShop[2844:106306] 2 Price: $139.99
2016-03-22 11:10:32.781 FlowerShop[2844:106306] Removed "gardenRose"...
2016-03-22 11:10:32.782 FlowerShop[2844:106306] Using a normal for-loop...
2016-03-22 11:10:32.783 FlowerShop[2844:106306] 0 Name: Garden Rose
2016-03-22 11:10:32.783 FlowerShop[2844:106306] 0 Number: 1
2016-03-22 11:10:32.784 FlowerShop[2844:106306] 0 Price: $79.99
2016-03-22 11:10:32.784 FlowerShop[2844:106306] 1 Name: Iris
2016-03-22 11:10:32.785 FlowerShop[2844:106306] 1 Number: 2
2016-03-22 11:10:32.785 FlowerShop[2844:106306] 1 Price: $139.99
Program ended with exit code: 0
```
