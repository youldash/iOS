//
//  GRArray.m
//  Grapher
//
//  Created by Mustafa Youldash on 20/02/2016.
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
 *	Static constants.
 */
static const NSUInteger kGRLengthDefault = 0;
static const NSUInteger kGRBaseDefault = 0;

@implementation GRArray

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
    
    GRArray *b1 = [[a1 copy] autorelease];
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

@end
