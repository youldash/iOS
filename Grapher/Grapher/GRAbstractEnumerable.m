//
//  GRAbstractEnumerable.m
//  Grapher
//
//  Created by Mustafa Youldash on 18/02/2016.
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

#import "GRAbstractEnumerable.h"

@implementation GRAbstractEnumerable

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated abstract enumerable.
 *
 *  @return  The new abstract enumerable.
 */
- (instancetype)init
{
    NSAssert(![self isMemberOfClass:[GRAbstractEnumerable class]], @"GRAbstractEnumerable class instantiated.");
    
    // Immutable abstract enumerable, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    // Return this abstract enumerable along with its children.
    return self;
}

#pragma mark -
#pragma mark GREnumerableDelegate

/**
 *  Returns an enumerator that enumerates the objects.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)objectEnumerator
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

#pragma mark -
#pragma mark NSFastEnumeration

/**
 *  Returns by reference a C array of objects over which the sender should iterate,
 *  and as the return value the number of objects in the array.
 *
 *  @param  state  Context information that is used in the enumeration to,
 *  in addition to other possibilities, ensure that the collection has not been mutated.
 *  @param  buffer  A C array of objects over which the sender is to iterate.
 *  @param  len  The maximum number of objects to return in stackbuf.
 *
 *  @return  The number of objects returned in stackbuf. Returns 0 when the iteration is finished.
 */
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len
{
    NSUInteger count = 0;
    
    /**
     *  These casts to avoid ARC retain operations.
     *  <http://supertommy.me/content/2013/implementing-nsfastenumeration/>
     */
    // void *_enumerator = (void *)(state->state);
    id<GREnumeratorDelegate> enumerator = (id<GREnumeratorDelegate>)(state->state);
    
    if (enumerator == nil)
        enumerator = [self objectEnumerator];
    
    if (len > 0 && [enumerator hasMoreObjects]) {
        
        buffer[0] = [enumerator nextObject];
        state->state = (unsigned long)enumerator;
        state->itemsPtr = buffer;
        state->mutationsPtr = (unsigned long *)self; // &state->extra[0];
        
        count = 1;
    }
    
    return count;
}

#pragma mark -
#pragma mark Testing

/**
 *  GRAbstractEnumerable test program.
 *
 *  @param  enumerable  The enumerable object to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testEnumerable:(id<GREnumerableDelegate>)enumerable
{
    NSLog(@"GRAbstractEnumerable test program.\n\
          --------------------------------------------");
    
    NSLog(@"Using objectEnumerator:");
    id<GREnumeratorDelegate> objectEnumerator = [enumerable objectEnumerator];
    while ([objectEnumerator hasMoreObjects]) {
        
        NSLog(@"%@", [objectEnumerator nextObject]);
    }
    
    NSLog(@"Using fast enumeration:");
    for (id object in enumerable) {
        
        NSLog(@"%@", object);
    }
    
    return YES;
}

@end
