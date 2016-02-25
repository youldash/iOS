# Day 2: Collections and Enumerations

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

In this part of the course, you will be introduced to Collection generics (i.e. Arrays, Sets, Dictionaries, etc.). Once you've fully grasped the idea of instantiating factory Collection factory classes (e.g. `NSArray`, `NSMutableArray`) in your projects, you will be instructed to implement a number of exercises related to creating custom Collection classes. These of which are necessary for establishing the building blocks for the final Scene Graph product.

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

* Add a new class by highlighting on the "Arrays" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.3.png" width="100%" /></div>

* When prompted for options, type `GRArray` as the class name. Make sure `NSObject` is selected for subclassing from, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.4.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `GRArray.h` and the implementation file `GRArray.m` to your project.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.5.png" width="100%" /></div>

* Type the code snippet listed below into `GRArray.h`. This class represents the building block for iOS creating custom array containers as part of a "future" Scene Graph iOS project:

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

* To establish `GRArray` as a class that confirms to `GRArrayDelegate`, go right ahead and jump to the top of the `GRArray.h` header (above the interface declaration) and define the properties and methods of the protocol, like so:

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

/**
 *  Returns an array that contains the given objects.
 *
 *  @param	firstObject	The first object.
 *	@pragma	...			The rest of the objects.
 *
 *  @return The new array.
 */
+ (instancetype)arrayWithObjects:(id)firstObject, ...;

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

#pragma mark -
#pragma mark Operating

/**
 *  Executes the Fisher Yates shuffling algorithm.
 *  Shuffles the contents of this array for random pick of the points.
 *
 *  @discussion This method enhances the GRArray class by providing methods to randomly shuffle the elements.
 */
- (void)shuffle;

@end
```

