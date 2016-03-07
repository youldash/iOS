//
//  GRArray.h
//  Arrays
//
//  Created by Mustafa Youldash on 26/02/2016.
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

@import Foundation;

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

#pragma mark -

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
