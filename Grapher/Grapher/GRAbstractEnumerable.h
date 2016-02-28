//
//  GRAbstractEnumerable.h
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

@import Foundation;
@import SpriteKit;

#import "GREnumerator.h"

/**
 *  Protocol implemented by enumerable classes.
 */
@protocol GREnumerableDelegate <NSFastEnumeration>

/**
 *  Returns an enumerator.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)objectEnumerator;

@end

#pragma mark -

/**
 *  Base class from which all enumerable classes are derived.
 */
@interface GRAbstractEnumerable : SKNode <GREnumerableDelegate>

#pragma mark -
#pragma mark Testing

/**
 *  OCAbstractEnumerable test program.
 *
 *  @param  enumerable  The enumerable object to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testEnumerable:(id<GREnumerableDelegate>)enumerable;

@end
