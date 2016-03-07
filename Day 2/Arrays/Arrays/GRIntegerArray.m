//
//  GRIntegerArray.m
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

#import "GRIntegerArray.h"

/**
 *	Static constants.
 */
static const NSUInteger kGRLengthDefault = 0;
static const NSUInteger kGRBaseDefault = 0;
static const NSUInteger kGRValueDefault = 0;

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

#pragma mark -

@implementation GRIntegerArray

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

/**
 *  Deallocates the memory occupied by this array.
 */
- (void)dealloc
{
    [self purge];
    
    NSZoneFree(NSZoneFromPointer(self), _data);
    
    [super dealloc];
}

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

/**
 *	Generates an assertion if the given index is out of bounds.
 *
 *	@param	index	An array index.
 */
- (void)boundsCheck:(NSUInteger)index
{
    NSAssert(index >= _baseIndex && index < _baseIndex + _length, @"Index out of bounds.");
}

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

@end
