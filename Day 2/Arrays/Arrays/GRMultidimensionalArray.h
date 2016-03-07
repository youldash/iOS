//
//  GRMultidimensionalArray.h
//  Arrays
//
//  Created by Mustafa Youldash on 27/02/2016.
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

#pragma mark -

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
