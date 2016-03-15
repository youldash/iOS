# Language Basics 

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQUCS_F.svg?style=social?style=plastic)](https://twitter.com/UQUCS_F)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Useful References

See:

- [Cocoa Dev Central: C Language Tutorial for Cocoa](http://cocoadevcentral.com/articles/000081.php). This tutorial explains the parts of C you need to get started with this training material.
- [Ry’s Objective-C Tutorial - RyPress](http://rypress.com/tutorials/objective-c/index). This tutorial is a good staring place to learn the Objective-C programming language, which is covered here in more depth.

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

* Add a new class by highlighting on the "FlowerShop" yellow (group) folder and selecting "New File" from the File menu.

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

* Everything is ready now for us to use this new class. Edit `main.m` (your project's main implementation file) and make sure it confirms to the following code snippet:

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

## FlowerShop 2.0

The objective of this exercise is to redesign [FlowerShop 1.0](https://github.com/youldash/iOS/tree/master/LanguageBasics#flowershop-10) so that it leverages ARC, while reducing the size of your original code base.

### Re-enabling ARC

* To re-enable ARC for this project, Hide both Utility and Debug areas and only show both Editor and Navigator areas.

* Click on the "FlowerShop" project file (blue icon in the Navigator area).

* Configure your view according to the following sequence of actions: Highlight the "FlowerShop" executable (under "TARGETS") → Click on "Build Phases" to expand its options → Unfold "Compile Sources" to view two implementation sources (both `main.m` and `Flower.m`).

* Double-click on both implementation files and remove the compiler flag `-fno-objc-arc`, simultaneously.

> ARC should be enabled now!

### Editing Your Model Class

* Edit `Flower.h` and replace what currently exists with the following code snippet:

``` Objective-C
#import <Foundation/Foundation.h>

/**
 *  A flower (base) class interface v2.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@interface Flower : NSObject {
    
    /* A flower name. */
    NSString *_name;
    
    /* A flower sequence number. */
    NSInteger _number;
    
    /* A flower price. */
    NSNumber *_price;

    /* An image (generic data) associated with this flower. */
    id _image;
}

#pragma mark -
#pragma mark Accessing

/**
 *  A flower name.
 */
@property (copy, getter=name, setter=setName:) NSString *name;

/**
 *  A sequence number.
 */
@property (assign, getter=number, setter=setNumber:) NSInteger number;

/**
 *  A price.
 */
@property (strong, getter=price, setter=setPrice:) NSNumber *price;

/**
 *  An image.
 */
@property (weak, getter=image, setter=setImage:) id image;

@end
```

* Excellent! Now, edit "Flower.m" and replace what currently exists with the following code snippet:

``` Objective-C
#import "Flower.h"

/**
 *	Static constants.
 */
static const NSInteger kFlowerNumberDefault = 0;

/**
 *  A flower (base) class interface v2.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
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
        
        self.name = @"A flower";
        self.number = kFlowerNumberDefault;
        self.price = @(10.0);
        self.image = nil;
    }
    
    return self;
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
     self.name,
     self.number,
     self.price.doubleValue,
     self.image];
    
    [string appendString:@"]>"];
    
    return string;
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
    
    _name = [name copy];
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
    
    _price = price;
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
    
    _image = image;
}

@end
```

### Testing your Code

* Everything is ready now for us to use this new class. Edit `main.m` (your project's main implementation file) and make sure it confirms to the following code snippet:

``` Objective-C
#import <Foundation/Foundation.h>

#import "Flower.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        Flower *flower = [Flower new];
        
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
    }
    
    return 0;
}
```

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
Program ended with exit code: 0
```

## FlowerShop 3.0

The objective of this exercise is to refine [FlowerShop 2.0](https://github.com/youldash/iOS/tree/master/LanguageBasics#flowershop-20) so that it confirms to a much cleaner, **Objective-C 2.0** coding standard.

### Editing Your Model Class

* Edit `Flower.h` and replace what currently exists with the following code snippet:

``` Objective-C
#import <Foundation/Foundation.h>

/**
 *  A flower (base) class interface v3.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@interface Flower : NSObject

#pragma mark -
#pragma mark Accessing

/**
 *  A flower name.
 */
@property (copy) NSString *name;

/**
 *  A flower sequence number.
 */
@property (assign) NSInteger number;

/**
 *  A flower price.
 */
@property (strong) NSNumber *price;

/**
 *  An image (generic data) associated with this flower.
 */
@property (weak) id image;

@end
```

* Awesome! Now, edit "Flower.m" and replace what currently exists with the following code snippet:

``` Objective-C
#import "Flower.h"

/**
 *	Static constants.
 */
static const NSInteger kFlowerNumberDefault = 0;

/**
 *  A flower (base) class interface v2.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
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
        
        self.name = @"A flower";
        self.number = kFlowerNumberDefault;
        self.price = @(10.0);
        self.image = nil;
    }
    
    return self;
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
     self.name,
     self.number,
     self.price.doubleValue,
     self.image];
    
    [string appendString:@"]>"];
    
    return string;
}

#pragma mark -
#pragma mark Accessing

/**
 *  A flower name.
 */
@synthesize name = _name;

/**
 *  A flower sequence number.
 */
@synthesize number = _number;

/**
 *  A flower price.
 */
@synthesize price = _price;

/**
 *  An image (generic data) associated with this flower.
 */
@synthesize image = _image;

@end
```

### Testing your Code

* Everything is ready now for us to use this new class. Note that `main.m` should be the same as before.

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

## FlowerShop 4.0

The objective of this exercise is to further refine [FlowerShop 3.0](https://github.com/youldash/iOS/tree/master/LanguageBasics#flowershop-30), in addition to adding a few extra classes so that the FlowerShop concept is filly adopted, and implemented... **Well, kind of :)**

### Subclassing GardenRose from Flower

* Add a new class by highlighting on the "FlowerShop" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GardenRose` as the class name. Make sure `Flower` is selected for subclassing from.

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `GardenRose.h` and the implementation file `GardenRose.m` to your project.

* Type the code snippet listed below into `GardenRose.h`. This class represents the building block for creating new GardenRose objects:

``` Objective-C
#import "Flower.h"

/**
 *  A flower subclass interface v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@interface GardenRose : Flower

@end
```

* Your class interface is now ready for a proper implementation! Edit "GardenRose.m" and type the following implementation:

``` Objective-C
#import "GardenRose.h"

/**
 *  A flower subclass implementation v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@implementation GardenRose

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
        
        self.name = @"Garden Rose";
        self.price = @(79.99);
    }
    
    return self;
}

@end
```

### Subclassing Iris from Flower

* Add a new class by highlighting on the "FlowerShop" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `Iris` as the class name. Make sure `Flower` is selected for subclassing from.

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header Iris `Flower.h` and the implementation file `Iris.m` to your project.

* Type the code snippet listed below into `Iris.h`. This class represents the building block for creating new GardenRose objects:

``` Objective-C
#import "Flower.h"

/**
 *  A flower subclass interface v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@interface Iris : Flower

@end
```

* Your class interface is now ready for a proper implementation! Edit "Iris.m" and type the following implementation:

``` Objective-C
#import "Iris.h"

/**
 *  A flower subclass implementation v1.0.
 *  This class uses Automatic Reference Counting (ARC), which is enabled in Xcode by default.
 */
@implementation Iris

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
        
        self.name = @"Iris";
        self.price = @(139.99);
    }
    
    return self;
}

@end
```

### Creating the FlowerShop Class

* Add a new class by highlighting on the "FlowerShop" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `FlowerShop` as the class name. Make sure `NSObject` is selected for subclassing from.

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header and implementation files to your project.

* Type the code snippet listed below into `FlowerShop.h`. This class represents a facade for maintaining the inventory of various flowers, maintained for sale.

``` Objective-C
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
```

> **Note:** As you finish declaring your `FlowerShop` class interface, you will need to define a `FlowerShopDelegate` with two required methods, and one optional property. The following steps will define `FlowerShopDelegate`, which will be placed on top of your existing `FlowerShop` class interface.

* Jump to the top of the `FlowerShop.h` header (above the interface declaration) and define the properties and methods of the protocol, like so:

``` Objective-C
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
```

* The `FlowerShop` interface is now ready for implementation. Add the following accessor stub in `FlowerShop.m`:

``` Objective-C
#import "FlowerShop.h"
#import "Flower.h"

@implementation FlowerShop

#pragma mark -
#pragma mark Accessing

/**
 *  A FlowerShop delegate.
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
```

* Next, add the following initializer stub:

``` Objective-C
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
```

* Next, add the following query stub:

``` Objective-C
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
```

* Finally, end your implementation with the following modifier stub. Note tat the `@end` is declared at the end of this part to indicated that no further code needs to be added to `FlowerShop.m`:

``` Objective-C
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
```

### Creating the FlowerShopTester Class

* Add a new class by highlighting on the "FlowerShop" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `FlowerShopTester` as the class name. Make sure `NSObject` is selected for subclassing from.

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header and implementation files to your project.

* Type the code snippet listed below into `FlowerShopTester.h`. This class represents a facade for testing the `FlowerShop` class, which also confirms to the `FlowerShopDelegate` protocol, by implementing its methods, and by defining its properties.

``` Objective-C
#import <Foundation/Foundation.h>

#import "FlowerShop.h"

/**
 *  FlowerShop unit test class.
 */
@interface FlowerShopTester : NSObject <FlowerShopDelegate>

#pragma mark -
#pragma mark Testing

/**
 *	GRArray unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
- (BOOL)performTests;

@end
```

* `FlowerShopTester.h` is now ready for implementation. Add the following delegation stub in `FlowerShopTester.m`:

``` Objective-C
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
```

* Then, end your implementation with the following tester stub. Note tat the `@end` is declared at the end of this part to indicated that no further code needs to be added to `FlowerShopTester.m`:

``` Objective-C
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
```

### Testing your Code

* Everything is ready now for us to use this new class. Edit `main.m` and make sure it confirms to the following code snippet:

``` Objective-C
#import <Foundation/Foundation.h>

#import "FlowerShopTester.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        [[FlowerShopTester new] performTests];
    }
    
    return 0;
}
```

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
