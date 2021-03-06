# Day 2: Uni- and Multi-dimensional Arrays

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQUCS_F.svg?style=social?style=plastic)](https://twitter.com/UQUCS_F)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

In this part of the course, you will be introduced to Collection generics (i.e. Arrays, Sets, Dictionaries, etc.). Once you've fully grasped the idea of instantiating Collection (factory) classes like `NSArray`, `NSMutableArray` in your projects, you will be instructed to implement a number of exercises related to creating custom Collection classes. These of which are necessary for establishing the building blocks for the final Scene Graph product.

## Exercise 3: Arrays

In this exercise, you will develop a Foundation tool using Xcode. This example shows how to create a custom `Array` class that would behave similarly to an `NSMutableArray` factory class, and extend it.

> **Pro Tip:** Since the work that will be accomplished here will assist in the development of the final Scene Graph iOS app, we will consider naming conventions every time we create new classes, from this point onwards. This implies that every class name should start with an identifiable prefix. For instance, factory classes use the `NS` prefix (which stands for **Next Step**). Because our ultimate goal is to develop a Scene Graph app that will be named **Grapher**, we might as well consider the first two letters to form our unique prefix `GR` for every new class we create.

* Create a new project by launching Xcode (under the "/Applications" folder if you installed Xcode by downloading it directly from the App Store), and selecting "New Project" from the File menu.

* Under the "OS X" section, select "Application", and choose “Command Line Tool”, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.1.png" width="100%" /></div>

* When prompted for options, type "Arrays" as the Product Name.

* Confirm that your Bundle Identifier looks like `sa.edu.uqu.cis.Arrays`. This can be done by typing a reverse DNS string for Umm Al-Qura's College (`sa.edu.uqu.cis`) in the Organization Identifier field.

* Choose "Objective-C" from the Language pop-up menu.

* Leave the Use Automatic Reference Counting checkbox checked (as it exists in earlier releases of Xcode).

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected. This feature allows you to create and manage different versions of your project using a bundled Git repository, as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.2.png" width="100%" /></div>

* Xcode then creates your project.

### Creating Your Model Class

* Add a new class by highlighting on the "Arrays" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.3.png" width="100%" /></div>

* When prompted for options, type `GRArray` as the class name. Make sure `NSObject` is selected for subclassing from, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.4.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `GRArray.h` and the implementation file `GRArray.m` to your project.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.5.png" width="100%" /></div>

* Type the code snippet listed below into `GRArray.h`. This class represents the building block for creating custom array containers as part of a "future" Scene Graph iOS project:

``` Objective-C
@import Foundation;

/**
 *	Represents an array of objects.
 */
@interface GRArray : NSObject <GRArrayDelegate, NSCopying, NSFastEnumeration> {
    
    /**
     *  A C array of objects.
     */
    id __autoreleasing *_data;
    
    /**
     *	The length of this array.
     */
    NSUInteger _length;
    
    /**
     *	The base index of this array.
     */
    NSUInteger _baseIndex;
    
    /**
     *  Keeps track of the number of multiplications performed.
     */
    NSUInteger _numberOfMultiplications;
}

#pragma mark -
#pragma mark Testing

/**
 *	GRArray unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest;

@end
```

> **Note:** As you finish declaring your `GRArray` class interface, you will be immediately prompted by Xcode telling you that `GRArray` is expected to confirm to some **protocol** named `GRArrayDelegate` (which isn't defined yet). The following steps will define `GRArrayDelegate`.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.6.png" width="100%" /></div>

* To establish `GRArray` as a class that confirms to `GRArrayDelegate`, go right ahead and jump to the top of the `GRArray.h` header (above the interface declaration) and define the properties and methods (both "required" and "optional" ones) of the protocol, like so:

``` Objective-C
/**
 *  Protocol implemented by all arrays.
 */
@protocol GRArrayDelegate <NSObject, NSCopying, NSFastEnumeration>

#pragma mark -
#pragma mark Accessing

/**
 *	The length of this array.
 */
@property (assign, nonatomic) NSUInteger length;

/**
 *	The base index of this array.
 */
@property (assign, nonatomic) NSUInteger baseIndex;

#pragma mark -
#pragma mark Creating

/**
 *	Designated constructor.
 *	Returns a new array with the default length and base index.
 *
 *	@return	The new array.
 */
+ (instancetype)array;

/**
 *	Returns a new array with the given length.
 *
 *	@param	length	The length of the array.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length;

/**
 *	Returns a new array with the given length and base index.
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex;

#pragma mark -
#pragma mark Initializing

/**
 *	Designated constructor.
 *	Initializes a newly allocated array with the given length.
 *
 *	@param	length	The length of the array.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length;

/**
 *	Initializes a newly allocated array with the given length and base index..
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex;

#pragma mark -
#pragma mark Querying

/**
 *	Returns the object at the given index in this array.
 *
 *	@param	index	An array index.
 *
 *	@return	An object.
 */
- (id)objectAtIndex:(NSUInteger)index;

#pragma mark -
#pragma mark Modifying

/**
 *	Replaces the object at the given index in this array with the given object.
 *
 *	@param	index	An array index.
 *	@param	object	An object.
 *
 *	@return	The object originally at the given index in this array.
 */
- (id)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;

/**
 *	Exchanges the objects at the given indices in this array.
 *
 *	@param	index1	An array index.
 *	@param	index2	An array index.
 */
- (void)exchangeObjectAtIndex:(NSUInteger)index1 withObjectAtIndex:(NSUInteger)index2;

/**
 *	Removes all the objects from this array.
 */
- (void)purge;

/**
 *  Mark the following protocol method as optional using the @optional directive.
 */
@optional

/**
 *  Executes the Fisher Yates shuffling algorithm.
 *  Shuffles the contents of this array for random pick of the points.
 *
 *  @discussion This method enhances the GRArray class by providing methods to randomly shuffle the elements.
 */
- (void)shuffle;

@end
```

* Your class interface is now ready for a proper implementation! Edit "GRArray.m" and type the following code snippet for declaring global variables used throughout the scope of your implementation (preferably under the import declaration):

``` Objective-C
#import "GRArray.h"

/**
 *	Static constants.
 */
static const NSUInteger kGRLengthDefault = 0;
static const NSUInteger kGRBaseDefault = 0;
```

* For `GRArray` to confirm to the `GRArrayDelegate` protocol, we need to properly implement its declared methods and to synthesize its properties. Add the following stub implementation that defines the scope and behavior of the accessible properties:

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *	The length of this array.
 */
@synthesize length = _length;

/**
 *	Sets the length of this array to the given value.
 *
 *	@param	length	The length.
 */
- (void)setLength:(NSUInteger)length
{
	if (_length != length) {
		
        // Establish the min length.
        NSUInteger min = _length < length ? _length : length;
        
        // Establish the data source confined by the length.
        id *data = NSZoneMalloc(NSZoneFromPointer(self), length * sizeof(id));
        
        // Copy the old data.
        for (NSUInteger idx = 0; idx < min; ++idx) {
            
            data[idx] = _data[idx];
        }
        
        // Release the old data.
        for (NSUInteger idx = min; idx < _length; ++idx) {
            
            [_data[idx] release];
        }
        
        // Nullify each data item.
        for (NSUInteger idx = min; idx < length; ++idx) {
            
            data[idx] = nil;
        }
        
        // Free the memory allocated for the old data container.
        NSZoneFree(NSZoneFromPointer(self), _data);
        
        // Assign the new values.
        _data = data;
        _length = length;
	}
}

/**
 *	The base index of this array.
 */
@synthesize baseIndex = _baseIndex;
```

* Your class properties are now defined. Add the following class initializer stubs:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *	Designated constructor.
 *	Initializes a newly allocated array with the given length.
 *
 *	@param	length	The length of the array.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length
{
    return [self initWithLength:length baseIndex:kGRBaseDefault];
}

/**
 *	Initializes a newly allocated array with the given length and base index..
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex
{
    self = [super init];
    
    if (self) {
        
        _length = length;
        
        _data = NSZoneMalloc(NSZoneFromPointer(self), _length * sizeof(id));
        
        for (NSUInteger idx = 0;
             idx < _length;
             ++idx) {
            
            _data[idx] = nil;
        }
        
        _baseIndex = baseIndex;
    }
    
    return self;
}
```

* Add the following creator stubs to your class. These of which can be used to instantiate class objects using proper class methods (that typically start with the `+` sign):

``` Objective-C
#pragma mark -
#pragma mark Creating

/**
 *	Designated constructor.
 *	Returns a new array with the default length and base index.
 *
 *	@return	The new array.
 */
+ (instancetype)array
{
    return [[[[self class] alloc] initWithLength:kGRLengthDefault baseIndex:kGRBaseDefault] autorelease];
}

/**
 *	Returns a new array with the given length.
 *
 *	@param	length	The length of the array.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length
{
    return [[[[self class] alloc] initWithLength:length] autorelease];
}

/**
 *	Returns a new array with the given length and base index.
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex
{
    return [[[[self class] alloc] initWithLength:length baseIndex:baseIndex] autorelease];
}
```

> **Beerus:** *"It might be best to renew the whole planet at once. Of course before any Creation must come Destruction."*

* Add the following stub implementation for the `-dealloc` method, which implements the procedure that frees `GRArray` instances from memory:

``` Objective-C
/**
 *  Deallocates the memory occupied by this array.
 */
- (void)dealloc
{
    [self purge];
    
    NSZoneFree(NSZoneFromPointer(self), _data);
    
    [super dealloc];
}
```

* Add the following stub implementation for overriding the behavior of the `-description` method, to query a proper string description of any `GRArray` object:

``` Objective-C
#pragma mark -
#pragma mark Querying

/**
 *	Returns a string that describes this array.
 *
 *	@return	The string.
 */
- (NSString *)description
{
    NSMutableString *string =
    [NSMutableString stringWithFormat:@"<GRArray: length=%lu, base=%lu, data=[", _length, _baseIndex];
    
    for (NSUInteger idx = 0;
         idx < _length;
         ++idx) {
        
        if (idx > 0)
            [string appendString:@", "];
        
        [string appendFormat:@"%@", _data[idx]];
    }
    
    [string appendFormat:@"]>"];
    
    // Return it.
    return string;
}
```

* After you implement `-description` you may wish to implement the other protocol methods (namely the `-objectAtIndex:` method), in addition to a local `-boundsCheck:` method for confirming whether `GRArray` objects could still host additional data entries or not:

``` Objective-C
/**
 *	Returns the object at the given index in this array.
 *
 *	@param	index	An array index.
 *
 *	@return	An object.
 */
- (id)objectAtIndex:(NSUInteger)index
{
    [self boundsCheck:index];
    
    return [[_data[index - _baseIndex] retain] autorelease];
}
```

``` Objective-C
/**
 *	Generates an assertion if the given index is out of bounds.
 *
 *	@param	index	An array index.
 */
- (void)boundsCheck:(NSUInteger)index
{
    NSAssert(index >= _baseIndex && index < _baseIndex + _length, @"Index out of bounds.");
}
```

* Protocol `GRArrayDelegate` declares a few modifier methods (namely: `-replaceObjectAtIndex:withObject:`, `-exchangeObjectAtIndex:withObjectAtIndex:` and `-purge`). Hence, the following stub implementations define each protocol declaration, respectively:

``` Objective-C
#pragma mark -
#pragma mark Modifying

/**
 *	Replaces the object at the given index in this array with the given object.
 *
 *	@param	index	An array index.
 *	@param	object	An object.
 *
 *	@return	The object originally at the given index in this array.
 */
- (id)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object
{
    [self boundsCheck:index];
    
    id data = _data[index - _baseIndex];
    
    _data[index - _baseIndex] = [object retain];
    
    return [data autorelease];
}
```

``` Objective-C
/**
 *	Exchanges the objects at the given indices in this array.
 *
 *	@param	index1	An array index.
 *	@param	index2	An array index.
 */
- (void)exchangeObjectAtIndex:(NSUInteger)index1 withObjectAtIndex:(NSUInteger)index2
{
    [self boundsCheck:index1];
    [self boundsCheck:index2];
    
    id tmp = _data[index1 - _baseIndex];
    
    _data[index1 - _baseIndex] = _data[index2 - _baseIndex];
    _data[index2 - _baseIndex] = tmp;
}
```

``` Objective-C
/**
 *	Removes all the objects from this array.
 */
- (void)purge
{
    for (NSUInteger idx = 0;
         idx < _length;
         ++idx) {
        
        [_data[idx] release];
        _data[idx] = nil;
    }
}
```

* As you may recall in `GRArrayDelegate` the method `-shuffle` is declared `@optional`. As such, you may wish to include the following stub implementation for `-shuffle` and you may also wish to ignore it. Note that you are not obligated to fully implement this method, for as long as you do not wish to incorporate its functionality into your class.

``` Objective-C
/**
 *  Executes the Fisher Yates shuffling algorithm.
 *  Shuffles the contents of this array for random pick of the points.
 *
 *  @discussion This method enhances the GRArray class by providing methods to randomly shuffle the elements.
 */
- (void)shuffle
{
    NSUInteger count = _length;
    
    for (NSUInteger idx = 0;
         idx < count;
         ++idx) {
        
        // Select a random element between (idx) and end of array to swap with.
        NSInteger numberOfElements = count - idx;
        NSInteger number = (arc4random() % numberOfElements) + idx;
        
        // Swap.
        [self exchangeObjectAtIndex:idx
                  withObjectAtIndex:number];
    }
}
```

* Splendid! You are almost done! Add the following stub implementation for `-copyWithZone:` method, which implements (and confirms to) a procedure (defined by `NSCopying`) for returning "deep copies" of existing `GRArray` instances:

``` Objective-C
#pragma mark -
#pragma mark NSCopying

/**
 *  Returns a new array that is a deep copy of this array.
 *
 *  @param zone The zone in which to allocate the new array.
 *
 *  @return The new array.
 */
- (id)copyWithZone:(NSZone *)zone
{
    // Establish a new array copy.
    GRArray *copy = [[GRArray allocWithZone:zone] initWithLength:self.length baseIndex:self.baseIndex];
    
    if (copy) {
        
        // Copy all array properties.
        for (NSUInteger idx = 0;
             idx < self.length;
             ++idx) {
            
            copy->_data[idx] = [_data[idx] copyWithZone:zone];
        }
    }
    
    // Return a copy of this array.
    return copy;
}
```

* Next, type the following stub implementation for `-countByEnumeratingWithState:objects:count:` method, which implements (and confirms to) a procedure (defined by `NSFastEnumeration`) for returning (by reference) C arrays of objects over which the sender should iterate:

``` Objective-C
#pragma mark -
#pragma mark NSFastEnumeration

/**
 *    Returns by reference a C array of objects over which the sender should iterate,
 *    and as the return value the number of objects in the array.
 *
 *    @param    state    Context information that is used in the enumeration to, in addition to other possibilities, ensure that the collection has not been mutated.
 *    @param    buffer    A C array of objects over which the sender is to iterate.
 *    @param    len        The maximum number of objects to return in buffer.
 *
 *    @return    The number of objects returned in stackbuf. Returns 0 when the iteration is finished.
 */
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len
{
    NSUInteger result = 0;
    BOOL done = (BOOL)state->state;
    
    if (!done) {
        
        done = YES;
        state->itemsPtr = _data;
        state->state = (unsigned long)done;
        state->mutationsPtr = (unsigned long *)self;
        result = _length;
    }
    
    return result;
}
```

* One last non-protocol, class method remains: `+unitTest`. Add the following final stub implementation to `GRArray.m`:

``` Objective-C
#pragma mark -
#pragma mark Testing

/**
 *	GRArray unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest
{
    NSLog(@"GRArray unit test program.\n\
          --------------------------------------------");
    
    // Seed the random number generator.
    srandomdev();
    
    GRArray *a1 = [GRArray arrayWithLength:5];
    NSLog(@"a1 = %@", [a1 description]);
    
    [a1 replaceObjectAtIndex:0 withObject:@(arc4random_uniform(100))];
    [a1 replaceObjectAtIndex:1 withObject:@(arc4random_uniform(100))];
    [a1 replaceObjectAtIndex:2 withObject:@(arc4random_uniform(100))];
    [a1 replaceObjectAtIndex:3 withObject:@(arc4random_uniform(100))];
    [a1 replaceObjectAtIndex:4 withObject:@(arc4random_uniform(100))];
    
    NSLog(@"a1[0] = %@", [a1 objectAtIndex:0]);
    NSLog(@"a1[1] = %@", [a1 objectAtIndex:1]);
    
    [a1 exchangeObjectAtIndex:0 withObjectAtIndex:1];
    NSLog(@"a1 = %@", a1);
    
    NSUInteger idx = 0;
    
    NSLog(@"Enumerating a1...");
    for (NSNumber *number in a1) {
        
        NSLog(@"a1[%lu] = %@", idx, number);
        
        idx++;
    }
    
    a1.length = 3;
    a1.baseIndex = 1;
    NSLog(@"a1 = %@", a1);
    
    GRArray *b1 = a1.copy;
    NSLog(@"b1 = %@", b1);
    
    b1.length = 3;
    b1.baseIndex = 0;
    NSLog(@"b1 = %@", b1);
    
    NSLog(@"Purging b1...");
    [b1 purge];
    NSLog(@"b1 = %@", b1);
    
    GRArray *a2 = [GRArray arrayWithLength:5 baseIndex:0];
    
    [a2 replaceObjectAtIndex:0 withObject:@(arc4random_uniform(200))];
    [a2 replaceObjectAtIndex:1 withObject:@(arc4random_uniform(200))];
    [a2 replaceObjectAtIndex:2 withObject:@(arc4random_uniform(200))];
    [a2 replaceObjectAtIndex:3 withObject:@(arc4random_uniform(200))];
    [a2 replaceObjectAtIndex:4 withObject:@(arc4random_uniform(200))];
    NSLog(@"a2 = %@", a2);
    
    NSLog(@"Shuffling a2...");
    [a2 shuffle];
    NSLog(@"a2 = %@", a2);

    NSLog(@"Purging a2...");
    [a2 purge];
    NSLog(@"a2 = %@", a2);

    a2.length = 0;
    NSLog(@"a2 = %@", a2);

    // Successful.
    return YES;
}
```

> **Note:** As you may have already noticed, the implementation we provided for the `GRArray` class assumes that it will handle memory allocation and deallocation, **manually**. This can be confirmed by querying the warnings that are prompted by Xcode, like the following:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.7.png" width="100%" /></div>
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.8.png" width="100%" /></div>
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.9.png" width="100%" /></div>

### Disabling ARC

* To disable ARC for this class only (and not for the entire project), Hide both Utility and Debug areas and only show both Editor and Navigator areas. This view configuration grants you more space to work on and keeps you from getting distracted by other elements that might not be of relevance to tis current task.

* Click on the "Arrays" project file (blue icon in the Navigator area) and confirm that you have a similar view like this one:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.10.png" width="100%" /></div>

* Configure your view according to the following sequence of actions: Highlight the "Arrays" executable (under "TARGETS") → Click on "Build Phases" to expand its options → Unfold "Compile Sources" to view two implementation sources (both `main.m` and `GRArray.m`), like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.11.png" width="100%" /></div>

* Double-click on `GRArray.m` and set a special compiler flag to `-fno-objc-arc` so that you disables ARC (i.e. Automatic Reference Counting if you forgot what it stands for) for this source whenever you build or rebuild your project, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.12.png" width="100%" /></div>

* Confirm that you have a view similar to this one:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.13.png" width="100%" /></div>

> All compiler warnings should disappear by now!

### Testing your Code

* Everything is ready now for us to use this new class. Edit `main.m` (your project’s main implementation file) and make sure it confirms to the following code snippet:

``` Objective-C
@import Foundation;

#import "GRArray.h"

/**
 *  Main tester program.
 *
 *  @param argc The argc.
 *  @param argv The argv.
 *
 *  @return The execution return code.
 */
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Run the GRArray unit test program.
        [GRArray unitTest];
    }
    
    return 0;
}
```

* Compile and run the program by clicking on the Run button (located on the top-left corner of Xcode), or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-02-26 20:14:11.706 Arrays[8403:1372962] GRArray unit test program.
          --------------------------------------------
2016-02-26 20:14:11.708 Arrays[8403:1372962] a1 = <GRArray: length=5, base=0, data=[(null), (null), (null), (null), (null)]>
2016-02-26 20:14:11.709 Arrays[8403:1372962] a1[0] = 97
2016-02-26 20:14:11.709 Arrays[8403:1372962] a1[1] = 58
2016-02-26 20:14:11.709 Arrays[8403:1372962] a1 = <GRArray: length=5, base=0, data=[58, 97, 89, 23, 36]>
2016-02-26 20:14:11.709 Arrays[8403:1372962] Enumerating a1...
2016-02-26 20:14:11.710 Arrays[8403:1372962] a1[0] = 58
2016-02-26 20:14:11.710 Arrays[8403:1372962] a1[1] = 97
2016-02-26 20:14:11.710 Arrays[8403:1372962] a1[2] = 89
2016-02-26 20:14:11.710 Arrays[8403:1372962] a1[3] = 23
2016-02-26 20:14:11.711 Arrays[8403:1372962] a1[4] = 36
2016-02-26 20:14:11.711 Arrays[8403:1372962] a1 = <GRArray: length=3, base=1, data=[58, 97, 89]>
2016-02-26 20:14:11.711 Arrays[8403:1372962] b1 = <GRArray: length=3, base=1, data=[58, 97, 89]>
2016-02-26 20:14:11.712 Arrays[8403:1372962] b1 = <GRArray: length=3, base=0, data=[58, 97, 89]>
2016-02-26 20:14:11.712 Arrays[8403:1372962] Purging b1...
2016-02-26 20:14:11.712 Arrays[8403:1372962] b1 = <GRArray: length=3, base=0, data=[(null), (null), (null)]>
2016-02-26 20:14:11.712 Arrays[8403:1372962] a2 = <GRArray: length=5, base=0, data=[105, 9, 85, 96, 84]>
2016-02-26 20:14:11.779 Arrays[8403:1372962] Shuffling a2...
2016-02-26 20:14:11.780 Arrays[8403:1372962] a2 = <GRArray: length=5, base=0, data=[85, 96, 84, 9, 105]>
2016-02-26 20:14:11.780 Arrays[8403:1372962] Purging a2...
2016-02-26 20:14:11.780 Arrays[8403:1372962] a2 = <GRArray: length=5, base=0, data=[(null), (null), (null), (null), (null)]>
2016-02-26 20:14:11.781 Arrays[8403:1372962] a2 = <GRArray: length=0, base=0, data=[]>
Program ended with exit code: 0
```

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Exercise 4: Integer Arrays

In this exercise, you will expand your previous Foundation tool to include additional functionality for dealing with integers-based data streams. More importantly, this example shows how to create a special `GRIntegerArray` class, suitable for dealing with integer values (only).

The behavior of this class is expected to be quite similar to the `GRArray` class you've implemented previously.

* Add a new class by highlighting on the "Arrays" yellow (group) folder and selecting "New File" from the File menu.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise4.0.1.png" width="100%" /></div>

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:

* Choose "Objective-C" from the Language pop-up menu.

* When prompted for options, type `GRIntegerArray` as the class name. Make sure `GRArray` is selected for subclassing (a.k.a. inheriting) from, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise4.0.2.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `GRIntegerArray.h` and the implementation file `GRIntegerArray.m` to your project.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise4.0.3.png" width="100%" /></div>

> **Important:** ARC needs to be disabled for this file too, prior completing the following tasks.

### Disabling ARC

* Hide both Utility and Debug areas and only show both Editor and Navigator areas, and click on the "Arrays" project file (blue icon in the Navigator area).

* Configure your view according to the following sequence of actions: Highlight the "Arrays" executable (under "TARGETS") → Click on "Build Phases" to expand its options → Unfold "Compile Sources" to view three implementation sources (`main.m`, `GRArray.m` and `GRIntegerArray.m`).

* Double-click on `GRIntegerArray.m` and (like what you've done for `GRArray.m` in the previous exercise) set the compiler flag to `-fno-objc-arc` so that you disable ARC for this source whenever you build or rebuild your project.

* Confirm that you have a similar view to what follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise4.0.4.png" width="100%" /></div>

> All ARC warnings and errors should disappear when you manually allocate and deallocate memory for this class!

### Creating Your Model Class

* Replace what currently exists in `GRIntegerArray.h` with the following snippet:

``` Objective-C
#import "GRArray.h"

/**
 *  A tuple.
 *	Tuples are a grouping of multiple values into a single type.
 *
 *  @param i The first integer.
 *  @param j The second integer.
 *
 *  @return The new integer array.
 */
#define GRTuple(i, j) [GRIntegerArray arrayWithIntegers:i :j]

/**
 *  Represents an array of integers.
 */
@interface GRIntegerArray : GRArray

#pragma mark -
#pragma mark Accessing

/**
 *  A C array of integers.
 */
@property (assign, nonatomic) NSInteger *data;

#pragma mark -
#pragma mark Creating

/**
 *	Returns a new array with the given length, base index, and initial value.
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *	@param	value		The initial value.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex initialValue:(NSInteger)value;

/**
 *  Returns an array of length 2 that contains the given integers.
 *
 *	@param	firstInteger	The first integer.
 *	@param	secondInteger	The second integer.
 *
 *  @return The new array.
 */
+ (instancetype)arrayWithIntegers:(NSUInteger)firstInteger :(NSInteger)secondInteger;

#pragma mark -
#pragma mark Initializing

/**
 *	Initializes a newly allocated array with the given length, base index and initial value.
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *	@param	value		The initial value.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex initialValue:(NSInteger)value;

#pragma mark -
#pragma mark Querying

/**
 *	Returns the int value at the given index in this array.
 *
 *	@param	index	An array index.
 *
 *	@return	The integer value.
 */
- (NSInteger)integerAtIndex:(NSUInteger)index;

#pragma mark -
#pragma mark Modifying

/**
 *	Replaces the integer at the given index in this array with the given integer.
 *
 *	@param	index	An array index.
 *	@param	integer	An integer.
 *
 *	@return	The object originally at the given index in this array.
 */
- (NSInteger)replaceIntegerAtIndex:(NSUInteger)index withInteger:(NSInteger)integer;

/**
 *	Exchanges the integers at the given indices in this array.
 *
 *	@param	index1	An array index.
 *	@param	index2	An array index.
 */
- (void)exchangeIntegerAtIndex:(NSUInteger)index1 withIntegerAtIndex:(NSUInteger)index2;

@end
```

* Your class interface is now ready for a proper implementation! Edit "GRIntegerArray.m" and type the following code snippet for declaring global variables used throughout the scope of your implementation (preferably under the import declaration):

``` Objective-C
#import "GRIntegerArray.h"

/**
 *	Static constants.
 */
static const NSUInteger kGRLengthDefault = 0;
static const NSUInteger kGRBaseDefault = 0;
static const NSUInteger kGRValueDefault = 0;
```

* Add the following class category right above `@implementation` (which is used to redefine the `data` property as a C array of integers instead of the old "inherited" generic objects array, which is originally declared in the superclass `GRArray`):

``` Objective-C
/**
 *  A GRIntegerArray class category.
 */
@interface GRIntegerArray () {
    
    /**
     *  A C array of integers.
     */
    NSInteger *_data;
}

@end
```

* Add the following stub implementation that defines the scope and behavior of the accessible properties for the `GRIntegerArray` class:

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *  A C array of integers.
 */
@synthesize data = _data;

/**
 *	Sets the length of this array to the given value.
 *
 *	@param	length	The length.
 */
- (void)setLength:(NSUInteger)length
{
    if (_length != length) {
        
        NSInteger min = _length < length ? _length : length;
        NSInteger *integerData = NSZoneMalloc(NSZoneFromPointer(self), length * sizeof(NSInteger));
        NSUInteger idx;
        
        for (idx = 0; idx < min; ++idx) {
            
            integerData[idx] = _data[idx];
        }
        
        for (idx = min; idx < length; ++idx) {
            
            integerData[idx] = 0;
        }
        
        NSZoneFree(NSZoneFromPointer(self), _data);
        
        _data = integerData;
        _length = length;
    }
}
```

* Your class properties are now defined. Add the following class initializer stubs:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *	Designated constructor.
 *	Initializes a newly allocated array with the default length and base index.
 *
 *	@return	The new array.
 */
- (instancetype)init
{
    return [self initWithLength:kGRLengthDefault baseIndex:kGRBaseDefault initialValue:kGRValueDefault];
}

/**
 *	Initializes a newly allocated array with the given length.
 *
 *	@param	length	The length of the array.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length
{
    return [self initWithLength:length baseIndex:kGRBaseDefault initialValue:kGRValueDefault];
}

/**
 *	Initializes a newly allocated array with the given length and base index..
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex
{
    return [self initWithLength:length baseIndex:baseIndex initialValue:kGRValueDefault];
}

/**
 *	Initializes a newly allocated array with the given length, base index and initial value.
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *	@param	value		The initial value.
 *
 *	@return	The new array.
 */
- (instancetype)initWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex initialValue:(NSInteger)value
{
    self = [super initWithLength:length baseIndex:baseIndex];
    
    if (self) {
        
        _data = NSZoneMalloc(NSZoneFromPointer(self), length * sizeof(NSInteger));
        
        for (NSUInteger idx = 0;
             idx < _length;
             ++idx) {
            
            _data[idx] = value;
        }
    }
    
    return self;
}
```

* Add the following creator stubs to your class:

``` Objective-C
#pragma mark -
#pragma mark Creating

/**
 *	Returns a new array with the default length and base index.
 *
 *	@return	The new array.
 */
+ (instancetype)array
{
    return [[[[self class] alloc] init] autorelease];
}

/**
 *	Returns a new array with the given length.
 *
 *	@param	length	The length of the array.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length
{
    return [[[[self class] alloc] initWithLength:length] autorelease];
}

/**
 *	Returns a new array with the given length and base index.
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex
{
    return [[[[self class] alloc] initWithLength:length baseIndex:baseIndex] autorelease];
}

/**
 *	Returns a new array with the given length, base index, and initial value.
 *
 *	@param	length		The length of the array.
 *	@param	baseIndex	The base index of the array.
 *	@param	value		The initial value.
 *
 *	@return	The new array.
 */
+ (instancetype)arrayWithLength:(NSUInteger)length baseIndex:(NSUInteger)baseIndex initialValue:(NSInteger)value
{
    return [[[[self class] alloc] initWithLength:length baseIndex:baseIndex initialValue:value] autorelease];
}

/**
 *  Returns an array of length 2 that contains the given integers.
 *
 *	@param	firstInteger	The first integer.
 *	@param	secondInteger	The second integer.
 *
 *  @return The new array.
 */
+ (instancetype)arrayWithIntegers:(NSUInteger)firstInteger :(NSInteger)secondInteger
{
    GRIntegerArray *array = [[[[self class] alloc] initWithLength:2] autorelease];
    
    [array replaceIntegerAtIndex:0 withInteger:firstInteger];
    [array replaceIntegerAtIndex:1 withInteger:secondInteger];
    
    return array;
}
```

* Add the following stub implementation for the `-dealloc` method, which implements the procedure that frees `GRIntegerArray` objects from memory:

``` Objective-C
/**
 *  Deallocates the memory occupied by this array.
 */
- (void)dealloc
{
    [self purge];
    
    NSZoneFree(NSZoneFromPointer(self), _data);
    
    [super dealloc];
}
```

* Add the following stub implementation to overriding the default behavior of the `-description` method:

``` Objective-C
#pragma mark -
#pragma mark Querying

/**
 *	Returns a string that describes this array.
 *
 *	@return	The string.
 */
- (NSString *)description
{
    NSMutableString *string =
    [NSMutableString stringWithFormat:@"<GRIntegerArray: length=%lu, base=%lu, data=[", _length, _baseIndex];
    
    for (NSUInteger idx = 0;
         idx < _length;
         ++idx) {
        
        if (idx > 0)
            [string appendString:@", "];
        
        [string appendFormat:@"%ld", _data[idx]];
    }
    
    [string appendFormat:@"]>"];
    
    return string;
}
```

* After you implement `-description` you may wish to implement other remaining methods (namely the `-integerAtIndex:` method), in addition to a local `-boundsCheck:` method for confirming whether `GRIntegerArray` objects could still host additional integer entries or not:

``` Objective-C
/**
 *	Returns the int value at the given index in this array.
 *
 *	@param	index	An array index.
 *
 *	@return	The integer value.
 */
- (NSInteger)integerAtIndex:(NSUInteger)index
{
    [self boundsCheck:index];
    
    return _data[index - _baseIndex];
}
```

``` Objective-C
/**
 *	Generates an assertion if the given index is out of bounds.
 *
 *	@param	index	An array index.
 */
- (void)boundsCheck:(NSUInteger)index
{
    NSAssert(index >= _baseIndex && index < _baseIndex + _length, @"Index out of bounds.");
}
```

* Implement the modifier methods `-replaceIntegerAtIndex:withInteger:`, `-exchangeIntegerAtIndex:withIntegerAtIndex:` and `-purge` in respective order, like so:

``` Objective-C
#pragma mark -
#pragma mark Modifying

/**
 *	Replaces the integer at the given index in this array with the given integer.
 *
 *	@param	index	An array index.
 *	@param	integer	An integer.
 *
 *	@return	The object originally at the given index in this array.
 */
- (NSInteger)replaceIntegerAtIndex:(NSUInteger)index withInteger:(NSInteger)integer
{
    [self boundsCheck:index];
    
    NSInteger result = _data[index - _baseIndex];
	
    _data[index - _baseIndex] = integer;
    
    return result;
}
```

``` Objective-C
/**
 *	Exchanges the integers at the given indices in this array.
 *
 *	@param	index1	An array index.
 *	@param	index2	An array index.
 */
- (void)exchangeIntegerAtIndex:(NSUInteger)index1 withIntegerAtIndex:(NSUInteger)index2
{
    [self boundsCheck:index1];
    [self boundsCheck:index2];
    
    NSInteger tmp = _data[index1 - _baseIndex];
	
    _data[index1 - _baseIndex] = _data[index2 - _baseIndex];
    _data[index2 - _baseIndex] = tmp;
}
```

``` Objective-C
/**
 *	Removes all the objects from this array.
 */
- (void)purge
{
    for (NSUInteger idx = 0;
         idx < _length;
         ++idx) {
        
        _data[idx] = 0;
    }
}
```

* Implement the "optional" `-shuffle` method like so:

``` Objective-C
/**
 *  Executes the Fisher Yates shuffling algorithm.
 *  Shuffles the contents of this array for random pick of the points.
 *
 *  @discussion This method enhances the OCArray class by providing methods to randomly shuffle the elements.
 */
- (void)shuffle
{
    NSUInteger count = _length;
    
    for (NSUInteger idx = 0;
         idx < count;
         ++idx) {
        
        // Select a random element between (idx) and end of array to swap with.
        NSInteger numberOfElements = count - idx;
        NSInteger number = (arc4random() % numberOfElements) + idx;
        
        // Swap.
        [self exchangeIntegerAtIndex:idx
                  withIntegerAtIndex:number];
    }
}
```

* Outstanding! Now add the following stub implementation for the `-copyWithZone:` method, which implements (and confirms to) a procedure (defined by `NSCopying`) for returning "deep copies" of existing `GRIntegerArray` instances:

``` Objective-C
#pragma mark -
#pragma mark NSCopying

/**
 *  Returns a new array that is a deep copy of this array.
 *
 *  @param zone The zone in which to allocate the new array.
 *
 *  @return The new array.
 */
- (id)copyWithZone:(NSZone *)zone
{
    GRIntegerArray *copy = [[GRIntegerArray allocWithZone:zone] initWithLength:self.length];
    
    if (copy) {
        
        for (NSUInteger idx = 0;
             idx < self.length;
             ++idx) {
            
            copy->_data[idx] = _data[idx];
        }
    }
    
    return copy;
}
```

* Next, type the following stub implementation for `-countByEnumeratingWithState:objects:count:` method, which confirms to `NSFastEnumeration` for returning (by reference) C arrays of objects over which the sender should iterate:

``` Objective-C
#pragma mark -
#pragma mark NSFastEnumeration

/**
 *	Returns by reference a C array of objects over which the sender should iterate,
 *	and as the return value the number of objects in the array.
 *
 *	@param	state	Context information that is used in the enumeration to, in addition to other possibilities, ensure that the collection has not been mutated.
 *	@param	buffer	A C array of objects over which the sender is to iterate.
 *	@param	len		The maximum number of objects to return in buffer.
 *
 *	@return	The number of objects returned in stackbuf. Returns 0 when the iteration is finished.
 */
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len
{
    int result = 0;
    int index = (int)state->state;
    
    if (index < _length && len > 0) {
        
        buffer[0] = @(_data[index++]);
        state->itemsPtr = buffer;
        state->state = (unsigned long)index;
        state->mutationsPtr = (unsigned long *)self;
        result = 1;
    }
    
    return result;
}
```

* One more method remains. Implement the class method `+unitTest` like so:

``` Objective-C
#pragma mark -
#pragma mark Testing

/**
 *	GRIntegerArray unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest
{
    NSLog(@"GRIntegerArray unit test program.\n\
          --------------------------------------------");
    
    GRIntegerArray *a1 = [GRIntegerArray arrayWithLength:3];
    NSLog(@"a1 = %@", a1);
    
    [a1 replaceIntegerAtIndex:0 withInteger:57];
    [a1 replaceIntegerAtIndex:1 withInteger:2011];
    NSLog(@"a1[0] = %li", [a1 integerAtIndex:0]);
    NSLog(@"a1[1] = %li", [a1 integerAtIndex:1]);
    
    [a1 exchangeIntegerAtIndex:0 withIntegerAtIndex:1];
    NSLog(@"a1 = %@", a1);
    
    NSLog(@"Enumerating a1...");
    for(NSNumber *element in a1) {
        
        NSLog(@"element = %@", element);
    }
    
    [a1 setLength:4];
    [a1 setBaseIndex:1];
    NSLog(@"a1 = %@", a1);
    
    GRIntegerArray *b1 = [[a1 copy] autorelease];
    NSLog(@"b1 = %@", b1);
    
    GRIntegerArray *a2 = GRTuple(57, 2011);
    NSLog(@"a2 = %@", a2);
    
    NSLog(@"Shuffling a2...");
    [a2 shuffle];
    NSLog(@"a2 = %@", a2);
    
    NSLog(@"Purging a2...");
    [a2 purge];
    NSLog(@"a2 = %@", a2);
    
    a2.length = 0;
    NSLog(@"a2 = %@", a2);
    
    // Successful.
    return YES;
}
```

### Testing your Code

* Everything is ready now for us to use this new class. Modify `main.m` by commenting out the previous unit testing program for `GRArray` and add a new unit testing program for `GRIntegerArray` like so:

``` Objective-C
@import Foundation;

#import "GRArray.h"
#import "GRIntegerArray.h"

/**
 *  Main tester program.
 *
 *  @param argc The argc.
 *  @param argv The argv.
 *
 *  @return The execution return code.
 */
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Run the GRArray unit test program.
        // [GRArray unitTest];
        
        // Run the GRIntegerArray unit test program.
        [GRIntegerArray unitTest];
    }
    
    return 0;
}
```

* Compile and run the program by clicking on the Run button (located on the top-left corner of Xcode), or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-02-26 23:24:44.791 Arrays[12312:2122964] GRIntegerArray unit test program.
          --------------------------------------------
2016-02-26 23:24:44.792 Arrays[12312:2122964] a1 = <GRIntegerArray: length=3, base=0, data=[0, 0, 0]>
2016-02-26 23:24:44.793 Arrays[12312:2122964] a1[0] = 57
2016-02-26 23:24:44.793 Arrays[12312:2122964] a1[1] = 2011
2016-02-26 23:24:44.793 Arrays[12312:2122964] a1 = <GRIntegerArray: length=3, base=0, data=[2011, 57, 0]>
2016-02-26 23:24:44.793 Arrays[12312:2122964] Enumerating a1...
2016-02-26 23:24:44.793 Arrays[12312:2122964] element = 2011
2016-02-26 23:24:44.794 Arrays[12312:2122964] element = 57
2016-02-26 23:24:44.794 Arrays[12312:2122964] element = 0
2016-02-26 23:24:44.794 Arrays[12312:2122964] a1 = <GRIntegerArray: length=4, base=1, data=[2011, 57, 0, 0]>
2016-02-26 23:24:44.794 Arrays[12312:2122964] b1 = <GRIntegerArray: length=4, base=0, data=[2011, 57, 0, 0]>
2016-02-26 23:24:44.794 Arrays[12312:2122964] a2 = <GRIntegerArray: length=2, base=0, data=[57, 2011]>
2016-02-26 23:24:44.795 Arrays[12312:2122964] Shuffling a2...
2016-02-26 23:24:44.795 Arrays[12312:2122964] a2 = <GRIntegerArray: length=2, base=0, data=[57, 2011]>
2016-02-26 23:24:44.804 Arrays[12312:2122964] Purging a2...
2016-02-26 23:24:44.804 Arrays[12312:2122964] a2 = <GRIntegerArray: length=2, base=0, data=[0, 0]>
2016-02-26 23:24:44.805 Arrays[12312:2122964] a2 = <GRIntegerArray: length=0, base=0, data=[]>
Program ended with exit code: 0
```

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Exercise 5: Multidimensional Arrays

Earlier in this course, we have described arrays that form singular (unidimensional) lists of key/value pairs (of both generic and numeric object representations). In our future Scene Graph iOS app however, the plan is to have the ability to store values with more than one key.

Therefore in this exercise, you will expand your previous Foundation tool to include additional functionality for dealing with multidimensional arrays (i.e. arrays containing one or more arrays, which are confined by the number of dimensions).

As an illustration:

* **2**-dimensional arrays require **2** indices to select an element from that array.
* **3**-dimensional arrays require **3** indices to select an element from that array.
* **N**-dimensional arrays require **N** indices to select an element from that array.

For this, you will need to create a special `GRMultidimensionalArray` class, suitable for dealing with arrays that are bound by the number of dimensions.

* Add a new class by highlighting on the "Arrays" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:

* When prompted for options, type `GRMultidimensionalArray` as the class name. Make sure you subclass `NSObject`, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise5.0.1.png" width="100%" /></div>

* Choose "Objective-C" from the Language pop-up menu.

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `GRMultidimensionalArray.h` and the implementation file `GRMultidimensionalArray.m` to your project.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise5.0.2.png" width="100%" /></div>

> **Important:** ARC needs to be kept enabled for this class, in spite of what you have done in the previous two exercises.

### Creating Your Model Class

* Replace what currently exists in `GRMultidimensionalArray.h` with the following two code snippets. They contain both protocol and class interface declarations for the `GRMultidimensionalArray` class, respectively:

``` Objective-C
@import Foundation;

@class GRArray;
@class GRIntegerArray;

/**
 *  Protocol implemented by multidimensional arrays.
 */
@protocol GRMultidimensionalArrayDelegate <NSObject>

#pragma mark -
#pragma mark Copying

/**
 *  Returns a clone (deep copy) of the multidimensional array
 *  containing a geometry that concatenates all the geometries contained in the multidimensional array hierarchy.
 *
 *  @return The cloned multidimensional array.
 */
- (id)clone;

#pragma mark -
#pragma mark Accessing

/**
 *  The dimensions of the array.
 */
@property (readonly, nonatomic) GRIntegerArray *dimensions;

#pragma mark -
#pragma mark Querying

/**
 *  Returns the object in this multidimensional array at the given indices.
 *
 *  @param  indices  An array of indices.
 *
 *  @return  An object.
 */
- (id)objectAtIndices:(GRIntegerArray *)indices;

#pragma mark -
#pragma mark Modifying

/**
 *  Replaces the object at the given index in this array with the given object.
 *
 *  @param  index  An array index.
 *  @param  object  An object.
 *
 *  @return  The object originally at the given index in this array.
 */
- (id)replaceObjectAtIndices:(GRIntegerArray *)indices withObject:(id)object;

/**
 *  Exchanges the objects at the given indices in this array.
 *
 *  @param  index1  An array index.
 *  @param  index2  An array index.
 */
- (void)exchangeObjectAtIndices:(GRIntegerArray *)indices1 withObjectAtIndices:(GRIntegerArray *)indices2;

/**
 *  Removes all the objects from this array.
 */
- (void)purge;

@end
```

``` Objective-C
/**
 *  Represents a multidimensional array of comparable components.
 */
@interface GRMultidimensionalArray : NSObject <GRMultidimensionalArrayDelegate> {
    
    /**
     *  The dimensions of the array.
     */
    GRIntegerArray *_dimensions;
    
    /**
     *  Used in the calculation that maps a set indices into an offset into a unidimensional array.
     */
    GRIntegerArray *_factors;
    
    /**
     *  A one-dimensional array that holds the elements of the multidimensional array.
     */
    GRArray *_data;
    
    /**
     *  Keeps track of the number of multiplications performed.
     */
    NSUInteger _numberOfMultiplications;
}

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a new multidimensional array with the given dimensions.
 *
 *  @param  dimensions  An array of dimensions.
 *
 *  @return  The new multidimensional array.
 */
- (instancetype)initWithDimensions:(GRIntegerArray *)dimensions;

#pragma mark -
#pragma mark Testing

/**
 *  OCMultidimensionalArray unit test program.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest;

@end
```

* Your class interface is now ready for a proper implementation! Add the following stub implementation that defines the scope and behavior of the accessible properties of the `GRMultidimensionalArray` class:

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *  The dimensions of the array.
 */
@synthesize dimensions = _dimensions;
```

* Your class properties are now defined. Add the following class initializer stub:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a new multidimensional array with the given dimensions.
 *
 *  @param  dimensions  An array of dimensions.
 *
 *  @return  The new multidimensional array.
 */
- (instancetype)initWithDimensions:(GRIntegerArray *)dimensions
{
    // Immutable multidimensional array, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize all parameters.
        NSUInteger length = dimensions.length;
        _dimensions = [GRIntegerArray arrayWithLength:length];
        _factors = [GRIntegerArray arrayWithLength:length];
        
        NSInteger product = 1;
        
        for (NSInteger idx = (NSInteger)length - 1;
             idx >= 0;
             --idx) {
            
            [_dimensions replaceIntegerAtIndex:idx
                                   withInteger:[dimensions integerAtIndex:idx]];
            
            [_factors replaceIntegerAtIndex:idx
                                withInteger:product];
            
            product *= [_dimensions integerAtIndex:idx];
        }
        
        _data = [GRArray arrayWithLength:product];
        
        _numberOfMultiplications = 0;
    }
    
    // Return this multidimensional array and its children.
    return self;
}
```

* Add the following stub implementation to overriding the default behavior of the `-description` method:

``` Objective-C
#pragma mark -
#pragma mark Querying

/**
 *  Returns a string that describes this multidimensional array.
 *
 *  @return  The string.
 */
- (NSString *)description
{
    NSMutableString *string = [NSMutableString stringWithString:@"<GRMultidimensionalArray: \n"];
    [string appendFormat:@"\tdimensions = %@, \n", _dimensions];
    [string appendFormat:@"\tfactors = %@, \n", _factors];
    [string appendFormat:@"\tdata = %@>", _data];
    
    return string;
}
```

* After you implement `-description` you may wish to implement other remaining protocol methods (namely the `-objectAtIndices:` method), in addition to a local `-offsetForIndices:` method that returns an offset in an array:

``` Objective-C
/**
 *  Returns the object in this multidimensional array at the given indices.
 *
 *  @param  indices  An array of indices.
 *
 *  @return  An object.
 */
- (id)objectAtIndices:(GRIntegerArray *)indices
{
    return [_data objectAtIndex:[self offsetForIndices:indices]];
}
```

``` Objective-C
/**
 *  Returns the offset in the one-dimensional array that corresponds to the given indices.
 *
 *  @param indices An array of indices.
 *
 *  @return The offset.
 */
- (NSUInteger)offsetForIndices:(GRIntegerArray *)indices
{
    NSAssert(indices.length == _dimensions.length, @"Illegal argument.");
    
    NSUInteger offset = 0;
    
    for (NSUInteger idx = 0;
         idx < _dimensions.length;
         ++idx) {
        
        NSUInteger index = [indices integerAtIndex:idx];
        
        NSAssert(index >= 0 && index < [_dimensions integerAtIndex:idx], @"Index out of bounds.");
        offset += index * [_factors integerAtIndex:idx];
    }
    
    return offset;
}
```

* Implement the modifier methods `-replaceObjectAtIndices:withObject:`, `-exchangeObjectAtIndices:withObjectAtIndices:` and `-purge` in respective order, like so:

``` Objective-C
#pragma mark -
#pragma mark Modifying

/**
 *  Replaces the object at the given index in this array with the given object.
 *
 *  @param  index  An array index.
 *  @param  object  An object.
 *
 *  @return  The object originally at the given index in this array.
 */
- (id)replaceObjectAtIndices:(GRIntegerArray *)indices withObject:(id)object
{
    return [_data replaceObjectAtIndex:[self offsetForIndices:indices]
                            withObject:object];
}
```

``` Objective-C
/**
 *  Exchanges the objects at the given indices in this array.
 *
 *  @param  index1  An array index.
 *  @param  index2  An array index.
 */
- (void)exchangeObjectAtIndices:(GRIntegerArray *)indices1 withObjectAtIndices:(GRIntegerArray *)indices2
{
    [_data exchangeObjectAtIndex:[self offsetForIndices:indices1]
               withObjectAtIndex:[self offsetForIndices:indices2]];
}
```

``` Objective-C
/**
 *  Removes the objects in this multidimensional array.
 */
- (void)purge
{
    [_data purge];
}
```

* Great! Now add the following stub implementation for the `-clone` method, which returns a clone (or deep copy) to the sender's multidimensional array reference:

``` Objective-C
#pragma mark -
#pragma mark Copying

/**
 *  Returns a clone (deep copy) of the multidimensional array containing a geometry that concatenates all the geometries contained in the multidimensional array hierarchy.
 *
 *  @return The cloned array.
 */
- (id)clone
{
    // Immutable multidimensional array, just return a new reference to itself (retained automatically by ARC).
    GRMultidimensionalArray *clone = [[[self class] alloc] initWithDimensions:_dimensions];
    
    if (clone) {
        
        // Copy all multidimensional array properties.
        for (NSUInteger idx = 0;
             idx < _data.length;
             ++idx) {
            
            id object = [[_data objectAtIndex:idx] copy];
            
            [clone->_data replaceObjectAtIndex:idx withObject:object];
        }
    }
    
    // Return a copy of this multidimensional array and its children.
    return clone;
}
```

* One more method remains. Implement the class method `+unitTest` like so:

``` Objective-C
#pragma mark -
#pragma mark Testing

/**
 *  GRMultidimensionalArray unit test program.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest
{
    NSLog(@"GRMultidimensionalArray unit test program.\n\
          --------------------------------------------");
    
    NSUInteger rows = 2;
    NSUInteger columns = 3;
    
    GRIntegerArray *dimensions = GRTuple(rows, columns);
    id<GRMultidimensionalArrayDelegate> mat1 = [[[GRMultidimensionalArray class] alloc] initWithDimensions:dimensions];
    
    float k = 0.0f;
    
    for (NSUInteger i = 0; i < rows; ++i) {
        
        for (NSUInteger j = 0; j < columns; ++j) {
            
            [mat1 replaceObjectAtIndices:GRTuple(i, j)
                              withObject:@(k++)];
        }
    }
    
    printf("mat1 = %s\n", [[mat1 description] UTF8String]);
    
    id<GRMultidimensionalArrayDelegate> mat2 = mat1.clone;
    printf("mat2 = %s\n", [[mat2 description] UTF8String]);
    
    return YES;
}
```

### Testing your Code

* Everything is ready now for us to use this new class. Modify `main.m` by commenting out the previous unit testing program for `GRIntegerArray` and add a new unit testing program for `GRMultidimensionalArray` like so:

``` Objective-C
@import Foundation;

#import "GRArray.h"
#import "GRIntegerArray.h"
#import "GRMultidimensionalArray.h"

/**
 *  Main tester program.
 *
 *  @param argc The argc.
 *  @param argv The argv.
 *
 *  @return The execution return code.
 */
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Run the GRArray unit test program.
        // [GRArray unitTest];
        
        // Run the GRIntegerArray unit test program.
        // [GRIntegerArray unitTest];
        
        // Run the GRMultidimensionalArray unit test program.
        [GRMultidimensionalArray unitTest];
    }
    
    return 0;
}
```

* Compile and run the program by clicking on the Run button (located on the top-left corner of Xcode), or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-02-27 01:12:57.912 Arrays[14760:2500323] GRMultidimensionalArray unit test program.
          --------------------------------------------
mat1 = <GRMultidimensionalArray: 
	dimensions = <GRIntegerArray: length=2, base=0, data=[2, 3]>, 
	factors = <GRIntegerArray: length=2, base=0, data=[3, 1]>, 
	data = <GRArray: length=6, base=0, data=[0, 1, 2, 3, 4, 5]>>
mat2 = <GRMultidimensionalArray: 
	dimensions = <GRIntegerArray: length=2, base=0, data=[2, 3]>, 
	factors = <GRIntegerArray: length=2, base=0, data=[3, 1]>, 
	data = <GRArray: length=6, base=0, data=[0, 1, 2, 3, 4, 5]>>
Program ended with exit code: 0
```

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## What's Next?

**Congratulations!** You are now ready to tackle the challenges introduced in [Day 3: Scene Graphs (Part I)](https://github.com/youldash/iOS/blob/master/Day%203/).
