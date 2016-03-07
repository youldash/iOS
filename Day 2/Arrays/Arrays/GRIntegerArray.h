//
//  GRIntegerArray.h
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
