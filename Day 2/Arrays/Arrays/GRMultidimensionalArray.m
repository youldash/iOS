//
//  GRMultidimensionalArray.m
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

#import "GRMultidimensionalArray.h"
#import "GRIntegerArray.h"
#import "GRArray.h"

@implementation GRMultidimensionalArray

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

#pragma mark -
#pragma mark Accessing

/**
 *  The dimensions of the array.
 */
@synthesize dimensions = _dimensions;

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

/**
 *  Removes the objects in this multidimensional array.
 */
- (void)purge
{
    [_data purge];
}

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
    id<GRMultidimensionalArrayDelegate> mat1 = [[GRMultidimensionalArray alloc] initWithDimensions:dimensions];
    
    float k = 0.0f;
    
    for (NSUInteger i = 0; i < rows; ++i) {
        
        for (NSUInteger j = 0; j < columns; ++j) {
            
            [mat1 replaceObjectAtIndices:GRTuple(i, j)
                              withObject:@(k++)];
        }
    }
    
    printf("mat1 = %s\n", [[mat1 description] UTF8String]);
    
    id<GRMultidimensionalArrayDelegate> mat2 = [mat1 clone];
    printf("mat2 = %s\n", [[mat2 description] UTF8String]);
    
    return YES;
}

@end
