//
//  PhotoAlbum.h
//  Photography
//
//  Created by Mustafa Youldash on 24/02/2016.
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

@class Photo;

/**
 *  Base class from which all photo albums are derived.
 */
@interface PhotoAlbum : NSObject

#pragma mark -
#pragma mark Accessing

/**
 *  A photos array (mutable).
 */
@property NSMutableArray *photos;

#pragma mark -
#pragma mark Modifying

/**
 *  Inserts a photo to the local photos array.
 *
 *  @param photo A photo to add.
 */
- (void)insertsPhoto:(Photo *)photo;

/**
 *  Removes a photo to the local photos array.
 *
 *  @param photo A photo to remove.
 *
 *  @return A boolean value that indicates whether this operation was successful.
 */
- (BOOL)removePhoto:(Photo *)photo;

#pragma mark -
#pragma mark Modifying

/**
 *	Removes all the objects from the photos array.
 */
- (void)purge;

#pragma mark -
#pragma mark Testing

/**
 *	PhotoAlbum unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest;

@end
