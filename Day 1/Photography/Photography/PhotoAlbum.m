//
//  PhotoAlbum.m
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

#import "PhotoAlbum.h"
#import "Photo.h"

@implementation PhotoAlbum

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *	Initializes a newly allocated photo album.
 *
 *  @return The new photo album.
 */
- (instancetype)init
{
    NSAssert([self isMemberOfClass:[PhotoAlbum class]], @"PhotoAlbum class not instantiated.");
    
    // Immutable photo album, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize the array.
        self.photos = [NSMutableArray array];
    }
    
    // Return this photo album.
    return self;
}

#pragma mark -
#pragma mark Querying

/**
 *	Returns a string that describes this photo.
 *
 *	@return	The string.
 */
- (NSString *)description
{
    // Establish the number of photos in the local array.
    NSUInteger length = [self.photos count];
    
    // Establish the description string.
    NSMutableString *string = [NSMutableString stringWithFormat:@"<PhotoAlbum: length=%lu, data=[", length];
    
    // Loop through each photo instance in the photos array.
    for (int idx = 0; idx < length; ++idx) {
        
        // If length > 0.
        if (idx > 0)
            [string appendString:@", "];
        
        // self.photos[idx] is similar to [self.photos objectAtIndex:idx]].
        [string appendFormat:@"%@", self.photos[idx]];
    }
    
    [string appendFormat:@"]>"];
    
    // Return it.
    return string;
}

#pragma mark -
#pragma mark Modifying

/**
 *  Inserts a photo to the local photos array.
 *
 *  @param photo A photo to add.
 */
- (void)insertsPhoto:(Photo *)photo
{
    // Update its number with relation to the current total number of added photos.
    photo.number = (int)self.photos.count;
    
    // Insert it.
    [self.photos addObject:photo];
}

/**
 *  Removes a photo to the local photos array.
 *
 *  @param photo A photo to remove.
 *
 *  @return A boolean value that indicates whether this operation was successful.
 */
- (BOOL)removePhoto:(Photo *)photo
{
    // Loop through each photo instance in the photos array.
    for (Photo *_photo in self.photos) {
        
        // A match is found if all parameter/property values appear to be identical.
        if (_photo.number == photo.number &&
            [_photo.caption isEqualToString:photo.caption] &&
            [_photo.photographer isEqualToString:photo.photographer]) {
            
            // Remove the photo.
            [self.photos removeObjectAtIndex:_photo.number];
            
            // Photo was removed.
            return YES;
        }
    }
    
    // Photo was not removed.
    return NO;
}

#pragma mark -
#pragma mark Modifying

/**
 *	Removes all the objects from the photos array.
 */
- (void)purge
{
    // Also remove all the photos and edges from the photo album.
    [self.photos removeAllObjects];
}

#pragma mark -
#pragma mark Testing

/**
 *	PhotoAlbum unit test program.
 *
 *	@return	A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest
{
    NSLog(@"PhotoAlbum unit test program.\n\
          --------------------------------------------");
    
    PhotoAlbum *album1 = [[PhotoAlbum alloc] init];
    NSLog(@"album1 = %@", [album1 description]);
    
    NSLog(@"Adding photos to album1...");
    Photo *photo1 = [[Photo alloc] init];
    
    Photo *photo2 = [[Photo alloc] init];
    photo2.caption = @"Some random snapshot";
    photo2.photographer = @"Sultan";
    
    Photo *photo3 = [[Photo alloc] init];
    photo2.caption = @"Side photo of our College";
    photo2.photographer = @"Manal";
    
    [album1 insertsPhoto:photo1];
    [album1 insertsPhoto:photo2];
    [album1 insertsPhoto:photo3];
    
    NSUInteger idx = 0;
    
    NSLog(@"Enumerating album1...");
    for (Photo *photo in album1.photos) {
        
        NSLog(@"album1[%lu] = %@", idx, photo.description);
        
        idx++;
    }
    
    NSLog(@"Removing photos from album1...");
    NSLog(@"removed album1.photos[%d] = %@", photo1.number, [album1 removePhoto:photo1] ? @"YES" : @"NO");
    NSLog(@"removed album1.photos[%d] = %@", photo2.number, [album1 removePhoto:photo2] ? @"YES" : @"NO");
    NSLog(@"album1 = %@", [album1 description]);
    
    NSLog(@"Purging album1...");
    [album1 purge];
    NSLog(@"album1 = %@", [album1 description]);
    
    // Successful.
    return YES;
}

@end
