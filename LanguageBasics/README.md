# Language Basics 

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQUCS_F.svg?style=social?style=plastic)](https://twitter.com/UQUCS_F)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

In this part of the training course, we will take you through a series of steps for creating sample projects that will demonstrate the capabilities and enhancements of the Objective-C programming language...

## FlowerShop 1.0

In this exercise, you will develop a simple Foundation tool using Xcode. During the implementation phase, you will be guided through a series of instructions to build your project using the old-fashioned **Objective-C 1.0** coding style.

* Create a new project by launching Xcode (under the "/Applications" folder if you installed Xcode by downloading it directly from the App Store), and selecting "New Project" from the File menu.

* Under the "OS X" section, select "Application", and choose “Command Line Tool”, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.1.png" width="100%" /></div>

* When prompted for options, type "FlowerShop" as the Product Name.

* Confirm that your Bundle Identifier looks like `sa.edu.uqu.cis.FlowerShop`. This can be done by typing a reverse DNS string for Umm Al-Qura's College (`sa.edu.uqu.cis`) in the Organization Identifier field.

* Choose "Objective-C" from the Language pop-up menu.

* Leave the Use Automatic Reference Counting checkbox checked (as it exists in earlier releases of Xcode). Note that this feature will be disabled later, for the purposes of this project.

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected. This feature allows you to create and manage different versions of your project using a bundled Git repository.

* Xcode then creates your project.

### Disabling ARC

* To disable ARC for this class only (and not for the entire project), Hide both Utility and Debug areas and only show both Editor and Navigator areas. This view configuration grants you more space to work on and keeps you from getting distracted by other elements that might not be of relevance to tis current task.

* Click on the "FlowerShop" project file (blue icon in the Navigator area).

* Configure your view according to the following sequence of actions: Highlight the "FlowerShop" executable (under "TARGETS") → Click on "Build Phases" to expand its options → Unfold "Compile Sources" to view two implementation sources (both `main.m` and `Flower.m`).

* Double-click on both implementation files and set the compiler flag to `-fno-objc-arc` so that you disables Automatic Reference Counting (ARC) for these sources whenever you build or rebuild your project.

> All compiler warnings for this project should not bother you from this point onwards!

### Creating Your Model Class

* Add a new class by highlighting on the "Arrays" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.3.png" width="100%" /></div>

* When prompted for options, type `Flower` as the class name. Make sure `NSObject` is selected for subclassing from.

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `Flower.h` and the implementation file `Flower.m` to your project.

* Type the code snippet listed below into `Flower.h`. This class represents the building block for creating new Flower objects:

``` Objective-C
#import <Foundation/Foundation.h>

/**
 *  A flower (base) class interface v1.0.
 *  This class uses Manual Retain Release (MRR), which is triggered in Xcode using the special compiler flag "-fno-objc-arc".
 */
@interface Flower : NSObject {
    
@private
    /* A flower name. */
    NSString *_name;
    
@public
    /* A flower sequence number. */
    NSInteger _number;
    
@protected
    /* A flower price. */
    NSNumber *_price;

    /* An image (generic data) associated with this flower. */
    id _image;
}

#pragma mark -
#pragma mark Accessing

/**
 *  The name getter.
 */
- (NSString *)name;

/**
 *  The name setter.
 */
- (void)setName:(NSString *)name;

/**
 *  The sequence number getter.
 */
- (NSInteger)number;

/**
 *  The sequence number setter.
 */
- (void)setNumber:(NSInteger)number;

/**
 *  The price getter.
 */
- (NSNumber *)price;

/**
 *  The price setter.
 */
- (void)setPrice:(NSNumber *)price;

/**
 *  The image getter.
 */
- (id)image;

/**
 *  The image setter.
 */
- (void)setImage:(id)image;

@end
```

* Your class interface is now ready for a proper implementation! Edit "Flower.m" and type the following implementation:

``` Objective-C
#import "Flower.h"

/**
 *	Static constants.
 */
static const NSInteger kFlowerNumberDefault = 0;

/**
 *  A flower (base) class implementation v1.0.
 *  This class uses Manual Retain Release (MRR), which is triggered in Xcode using the special compiler flag "-fno-objc-arc".
 */
@implementation Flower

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated flower.
 *
 *  @return The new flower.
 */
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self setName:@"A flower"];
        [self setNumber:kFlowerNumberDefault];
        [self setPrice:[NSNumber numberWithDouble:10.0]];
        [self setImage:nil];
    }
    
    return self;
}

/**
 *  Deallocates the memory occupied by this flower.
 */
- (void)dealloc
{
    [_name release];
    [_price release];
    [_image release];
        
    [super dealloc];
}

#pragma mark -
#pragma mark Querying

/**
 *	Returns a string that describes this flower.
 *
 *	@return The string.
 */
- (NSString *)description
{
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendFormat:@"<Flower: name=%@, number=%ld, price=%.2f, image=%@",
     [self name],
     [self number],
     [[self price] doubleValue],
     [self image]];
    
    [string appendString:@"]>"];
    
    return [string autorelease];
}

#pragma mark -
#pragma mark Accessing

/**
 *  The name getter.
 */
- (NSString *)name
{
    return _name;
}

/**
 *  The name setter.
 */
- (void)setName:(NSString *)name
{
    if ([_name isEqualToString:name]) {
        
        return;
    }
    
    NSString *oldName = _name;
    
    _name = [name copy];
    
    [oldName release];
}

/**
 *  The sequence number getter.
 */
- (NSInteger)number
{
    return _number;
}

/**
 *  The sequence number setter.
 */
- (void)setNumber:(NSInteger)number
{
    _number = number;
}

/**
 *  The price getter.
 */
- (NSNumber *)price
{
    return _price;
}

/**
 *  The price setter.
 */
- (void)setPrice:(NSNumber *)price
{
    if (_price == price) {
        
        return;
    }
    
    NSNumber *oldPrice = _price;
    
    _price = [price retain];
    
    [oldPrice release];
}

/**
 *  The image getter.
 */
- (id)image
{
    return _image;
}

/**
 *  The image setter.
 */
- (void)setImage:(id)image
{
    if (_image == image) {
        
        return;
    }
    
    id oldImage = _image;
    
    _image = [image retain];
    
    [oldImage release];
}

@end
```

### Testing your Code

* Everything is ready now for us to use this new class. Edit `main.m` (your project’s main implementation file) and make sure it confirms to the following code snippet:

``` Objective-C
#import <Foundation/Foundation.h>

#import "Flower.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        Flower *flower = [[Flower alloc] init];
        
        NSLog(@"Flower:");
        NSLog(@"Name: %@", [flower name]);
        NSLog(@"Number: %ld", [flower number]);
        NSLog(@"Price: %.2f", [[flower price] doubleValue]);
        NSLog(@"Image: %@", [flower image]);

        NSMutableArray *arrayOfFlowers = [[NSMutableArray alloc] init];
        [arrayOfFlowers addObject:flower];
        
        NSLog(@"%@", [[arrayOfFlowers objectAtIndex:0] description]);
        
        NSLog(@"Using a normal for-loop...");
        for (NSUInteger i = 0; i < [arrayOfFlowers count]; i++) {
            
            Flower *_flower = [arrayOfFlowers objectAtIndex:i];
            
            NSLog(@"%lu Name: %@", i, [_flower name]);
            NSLog(@"%lu Number: %ld", i, [_flower number]);
            NSLog(@"%lu Price: %.2f", i, [[_flower price] doubleValue]);
            NSLog(@"%lu Image: %@", i, [_flower image]);
        }
        
        NSLog(@"Using fast enumeration...");
        NSInteger i = 0;
        for (Flower *_flower in arrayOfFlowers) {
            
            NSLog(@"%lu Name: %@", i, [_flower name]);
            NSLog(@"%lu Number: %ld", i, [_flower number]);
            NSLog(@"%lu Price: %.2f", i, [[_flower price] doubleValue]);
            NSLog(@"%lu Image: %@", i, [_flower image]);
            
            i++;
        }
        
        [arrayOfFlowers removeAllObjects];
        [arrayOfFlowers release];
        [flower release];
    }
    
    return 0;
}
```

* Compile and run the program by clicking on the Run button (located on the top-left corner of Xcode), or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-03-15 10:57:04.182 FlowerShop[1504:20835] Flower:
2016-03-15 10:57:04.185 FlowerShop[1504:20835] Name: A flower
2016-03-15 10:57:04.185 FlowerShop[1504:20835] Number: 0
2016-03-15 10:57:04.185 FlowerShop[1504:20835] Price: 10.00
2016-03-15 10:57:04.186 FlowerShop[1504:20835] Image: (null)
2016-03-15 10:57:04.186 FlowerShop[1504:20835] <Flower: name=A flower, number=0, price=10.00, image=(null)]>
2016-03-15 10:57:04.186 FlowerShop[1504:20835] Using a normal for-loop...
2016-03-15 10:57:04.187 FlowerShop[1504:20835] 0 Name: A flower
2016-03-15 10:57:04.187 FlowerShop[1504:20835] 0 Number: 0
2016-03-15 10:57:04.187 FlowerShop[1504:20835] 0 Price: 10.00
2016-03-15 10:57:04.187 FlowerShop[1504:20835] 0 Image: (null)
2016-03-15 10:57:04.188 FlowerShop[1504:20835] Using fast enumeration...
2016-03-15 10:57:04.188 FlowerShop[1504:20835] 0 Name: A flower
2016-03-15 10:57:04.188 FlowerShop[1504:20835] 0 Number: 0
2016-03-15 10:57:04.189 FlowerShop[1504:20835] 0 Price: 10.00
2016-03-15 10:57:04.189 FlowerShop[1504:20835] 0 Image: (null)
Program ended with exit code: 0
```

## Compiling "FlowerShop 2.0"

* Compile and run the program by clicking on the Run button, or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-03-15 10:58:09.309 FlowerShop[1607:21646] Flower:
2016-03-15 10:58:09.312 FlowerShop[1607:21646] Name: A flower
2016-03-15 10:58:09.313 FlowerShop[1607:21646] Number: 0
2016-03-15 10:58:09.313 FlowerShop[1607:21646] Price: 10.00
2016-03-15 10:58:09.313 FlowerShop[1607:21646] Image: (null)
2016-03-15 10:58:09.314 FlowerShop[1607:21646] <Flower: name=A flower, number=0, price=10.00, image=(null)]>
2016-03-15 10:58:09.314 FlowerShop[1607:21646] Using a normal for-loop...
2016-03-15 10:58:09.314 FlowerShop[1607:21646] 0 Name: A flower
2016-03-15 10:58:09.315 FlowerShop[1607:21646] 0 Number: 0
2016-03-15 10:58:09.315 FlowerShop[1607:21646] 0 Price: 10.00
2016-03-15 10:58:09.315 FlowerShop[1607:21646] 0 Image: (null)
2016-03-15 10:58:09.315 FlowerShop[1607:21646] Using fast enumeration...
2016-03-15 10:58:09.316 FlowerShop[1607:21646] 0 Name: A flower
2016-03-15 10:58:09.316 FlowerShop[1607:21646] 0 Number: 0
2016-03-15 10:58:09.316 FlowerShop[1607:21646] 0 Price: 10.00
2016-03-15 10:58:09.316 FlowerShop[1607:21646] 0 Image: (null)
Program ended with exit code: 0```

## Compiling "FlowerShop 3.0"

* Compile and run the program by clicking on the Run button, or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-03-15 10:59:15.971 FlowerShop[1716:22455] Flower:
2016-03-15 10:59:15.973 FlowerShop[1716:22455] Name: A flower
2016-03-15 10:59:15.974 FlowerShop[1716:22455] Number: 0
2016-03-15 10:59:15.974 FlowerShop[1716:22455] Price: 10.00
2016-03-15 10:59:15.974 FlowerShop[1716:22455] Image: (null)
2016-03-15 10:59:15.975 FlowerShop[1716:22455] <Flower: name=A flower, number=0, price=10.00, image=(null)]>
2016-03-15 10:59:15.975 FlowerShop[1716:22455] Using a normal for-loop...
2016-03-15 10:59:15.975 FlowerShop[1716:22455] 0 Name: A flower
2016-03-15 10:59:15.975 FlowerShop[1716:22455] 0 Number: 0
2016-03-15 10:59:15.976 FlowerShop[1716:22455] 0 Price: 10.00
2016-03-15 10:59:15.976 FlowerShop[1716:22455] 0 Image: (null)
2016-03-15 10:59:15.976 FlowerShop[1716:22455] Using fast enumeration...
2016-03-15 10:59:15.976 FlowerShop[1716:22455] 0 Name: A flower
2016-03-15 10:59:15.977 FlowerShop[1716:22455] 0 Number: 0
2016-03-15 10:59:15.977 FlowerShop[1716:22455] 0 Price: 10.00
2016-03-15 10:59:15.977 FlowerShop[1716:22455] 0 Image: (null)
Program ended with exit code: 0
```

## Compiling "FlowerShop 4.0"

* Compile and run the program by clicking on the Run button, or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-03-15 10:35:34.281 FlowerShop[869:12456] FlowerShop unit test program.
2016-03-15 10:35:34.284 FlowerShop[869:12456] --------------------------------------------
2016-03-15 10:35:34.285 FlowerShop[869:12456] -[FlowerShopTester flowerShop:willAddFlower:]: <Flower: name=Flower, number=0, price=$10.00, image=(null)]>
2016-03-15 10:35:34.285 FlowerShop[869:12456] -[FlowerShopTester flowerShop:didAddFlower:]: <Flower: name=Flower, number=0, price=$10.00, image=(null)]>
2016-03-15 10:35:34.286 FlowerShop[869:12456] Sold? YES
2016-03-15 10:35:34.286 FlowerShop[869:12456] -[FlowerShopTester flowerShop:willAddFlower:]: <Flower: name=Garden Rose, number=0, price=$79.99, image=(null)]>
2016-03-15 10:35:34.286 FlowerShop[869:12456] -[FlowerShopTester flowerShop:didAddFlower:]: <Flower: name=Garden Rose, number=1, price=$79.99, image=(null)]>
2016-03-15 10:35:34.286 FlowerShop[869:12456] -[FlowerShopTester flowerShop:willAddFlower:]: <Flower: name=Iris, number=0, price=$139.99, image=(null)]>
2016-03-15 10:35:34.287 FlowerShop[869:12456] -[FlowerShopTester flowerShop:didAddFlower:]: <Flower: name=Iris, number=2, price=$139.99, image=(null)]>
2016-03-15 10:35:34.362 FlowerShop[869:12456] Using a normal for-loop...
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Name: Flower
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Number: 0
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Price: $10.00
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Image: (null)
2016-03-15 10:35:34.363 FlowerShop[869:12456] 1 Name: Garden Rose
2016-03-15 10:35:34.364 FlowerShop[869:12456] 1 Number: 1
2016-03-15 10:35:34.364 FlowerShop[869:12456] 1 Price: $79.99
2016-03-15 10:35:34.364 FlowerShop[869:12456] 1 Image: (null)
2016-03-15 10:35:34.364 FlowerShop[869:12456] 2 Name: Iris
2016-03-15 10:35:34.364 FlowerShop[869:12456] 2 Number: 2
2016-03-15 10:35:34.365 FlowerShop[869:12456] 2 Price: $139.99
2016-03-15 10:35:34.365 FlowerShop[869:12456] 2 Image: (null)
2016-03-15 10:35:34.365 FlowerShop[869:12456] Removed "gardenRose"...
2016-03-15 10:35:34.365 FlowerShop[869:12456] Using a normal for-loop...
2016-03-15 10:35:34.366 FlowerShop[869:12456] 0 Name: Flower
2016-03-15 10:35:34.445 FlowerShop[869:12456] 0 Number: 0
2016-03-15 10:35:34.445 FlowerShop[869:12456] 0 Price: $10.00
2016-03-15 10:35:34.445 FlowerShop[869:12456] 0 Image: (null)
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Name: Iris
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Number: 2
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Price: $139.99
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Image: (null)
Program ended with exit code: 0
```
