# FlowerShop (Swift 2.2 Version)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

A Swift version of the final exercise is published here.

## The Flower Class

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
