//
//  FlowerShopTester.h
//  FlowerShop
//
//  Created by Moose on 14/03/2016.
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

#import <Foundation/Foundation.h>

#import "FlowerShop.h"

/**
 *  FlowerShop unit test class.
 */
@interface FlowerShopTester : NSObject <FlowerShopDelegate>

#pragma mark -
#pragma mark Testing

/**
 *	GRArray unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
- (BOOL)performTests;

@end
