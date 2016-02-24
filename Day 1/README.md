# Day 1: Induction

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQUCS_F.svg?style=social?style=plastic)](https://twitter.com/UQUCS_F)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

> ***Update:*** This repo is under construction at the moment. For more updates please follow [@UQU_CS](https://twitter.com/UQU_CS) and [@UQUCS_F](https://twitter.com/UQUCS_F) on Twitter.

## A "Little Thing" About Passion

Have you ever thought of an idea that is going to be the "Next Big Thing", but you don't know where to start? … If this is the case, you're definitely in the right spot. The most important part of creativity is coming up with ideas, and mobile apps are no exception. Whether it be from seeing apps that are already in the App Store, thinking of a good solution to a problem you face, or simply thinking something would be cool are all great reasons to develop an app.

<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Lamp.png" width="25%" /></div>

Being passionate about your idea is going to carry you through the process. If you're not passionate, you're going to burn out. 
From a business perspective,  you view at all ideas in the app world through the lens of earning money. There are very few people out there that want to spend a lot of their own cash on something that's just cool, and this isn't for them. This is about making sure your idea is not only good, but will win, and last long in the app market.

In traditional business models, there are two general areas of success. Either you innovate something that no one else did, or you simply beat the competition by becoming better.

As you become very passionate about your idea, and discuss it with others, it is very important to make sure it's bulletproof from the start. For this, you should definitely ask your self this:

> **What makes your idea special?**

On this note, you need to remember that an app, or "solution", needs to be special in some way. This can be achieved through the following:

* **Featuring** → Navigating though different screens using swipe gestures instead of tapping.
* **Designing** → Making an app with animated backgrounds (makes your app more alive).
* **Storytelling** → Cataloging the story of an inspiring person/significant moment and sharing it with others.
* **Marketing** → Signing up with a company with millions/billions of fans e.g. Facebook, Instagram, Twitter, Pinterest, Snapchat, and similar.

As a final remark, try coming up with an idea that means something to you. Anyone today can think of good ideas, and only a handful present great ideas to the world. So, try thinking of something that is truly "awesome" in a sense.

## Exercise 1: Photography 1.0

In this exercise, you will develop a Photography application as a Foundation tool using Xcode. This example shows how to create a `Photo` class that forms the basis of a `PhotoAlbum` class using containers.

> **Pro Tip:** Working with command line projects often grants you experience in developing smaller packages and managing them with Xcode. Such packages can be reused later on in bigger, more complex projects or workspaces.

* Create a new project by launching Xcode (under the "/Applications" folder if you installed Xcode by downloading it directly from the App Store), and selecting "New Project" from the File menu.

* Under the "OS X" section, select "Application", and choose “Command Line Tool”, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.1.png" width="100%" /></div>

* When prompted for options, type "Photography" as the Product Name. You may consider leaving the Company Identifier field as is by default, or use a reverse DNS (Domain Name System). For instance, if you take a look at the College of Computer and Information Systems' domain name "http://cis.uqu.edu.sa", then its reverse DNS string should look like "sa.edu.uqu.cis". The Bundle Identifier will be set automatically, which is used for identifying your app in the App Store.

* Choose "Foundation" from the Type pop-up menu. By doing so, you allow your code to be linked to the Foundation Framework that holds all the necessary handlers for defining simple data types like `NSObject` and others.

* Leave the Use Automatic Reference Counting checkbox checked (as it exists in earlier releases of Xcode).
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.2.png" width="100%" /></div>

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected. This feature allows you to create and manage different versions of your project using a bundled Git repository, as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.3.png" width="100%" /></div>

* Xcode then creates your project. It should look something like this:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.4.png" width="100%" /></div>

* To bring more insight into the Xcode IDE, a snapshot from Xcode's documentation files is borrowed for illustration:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/IDE.png" width="75%" /></div>

* Try hiding both Utility and Debug areas, and only show both Editor and Navigation areas. This may help you focus on code you manage and keeps from getting distracted by other elements that might not be of relevance to the current project, like so (never mind the color scheme):
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.5.png" width="100%" /></div>

* Add a new class by highlighting on the "Photography" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.6.png" width="100%" /></div>

* When prompted for options, type `Photo` as the class name. Make sure `NSObject` is selected for subclassing from, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.7.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `Photo.h` and the implementation file `Photo.m` to your project.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.8.png" width="100%" /></div>

* Type the code snippet listed below into `Photo.h`. This class represents the building block for creating new photo instances as part of an photo album, which will be created later as a separate class:

``` Objective-C
@import Foundation;

/**
 *  Base class from which all photos are derived.
 */
@interface Photo : NSObject

#pragma mark -
#pragma mark Accessing

/**
 *  A number.
 */
@property int number;

/**
 *  A caption.
 */
@property NSString *caption;

/**
 *  A photographer.
 */
@property NSString *photographer;

@end
```

* Type the code snippet listed below into `Photo.m`:

``` Objective-C
#import "Photo.h"

/**
 *	Static constant.
 */
static const int kNumberDefault = 0;

@implementation Photo

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *	Initializes a newly allocated photo.
 *
 *  @return The new photo.
 */
- (instancetype)init
{
    NSAssert([self isMemberOfClass:[Photo class]], @"Photo class not instantiated.");
    
    // Immutable photo, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize the two properties with some dummy values.
        self.number = kNumberDefault;
        self.caption = @"Photo of a celebrity";
        self.photographer = @"Paparazzi";
    }
    
    // Return this photo.
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
    // Establish the description string.
    NSMutableString *string = [NSMutableString stringWithString:@"<Photo: data=["];
    
    [string appendFormat:@"#%i: %@, brought to you by %@",
     self.number,
     self.caption,
     self.photographer];
    
    [string appendFormat:@"]>"];
    
    // Return it.
    return string;
}

@end
```

* Now that the `Photo` class ready, add a new `PhotoAlbum` class for managing Photo instances. The following steps are exactly the same as the previous steps for creating the `Photo` class. Go ahead and add a new class by selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `PhotoAlbum` as the class name. Make it a subclass of `NSObject`. Also make sure "Targets" is checked for the exculpable:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.9.png" width="100%" /></div>

* Confirm by clicking Next and save the new class.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.10.png" width="100%" /></div>

* Type the code snippet listed below into `PhotoAlbum.h`. This class represents the building block for creating photo albums:

``` Objective-C
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
```

* Type the code snippet listed below into `PhotoAlbum.m`:

``` Objective-C
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
```

* Everything is ready now for use. Edit `main.m` (your project’s main implementation file) and make sure it confirms to the following snippet:

``` Objective-C
@import Foundation;

#import "PhotoAlbum.h"

/**
 *  Main Photography tester program.
 *
 *  @param argc The argc.
 *  @param argv The argv.
 *
 *  @return The execution return code.
 */
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Run the PhotoAlbum unit test program.
        [PhotoAlbum unitTest];
    }
    
    return 0;
}
```

* Compile and run the program by clicking on the Run button (located on the top-left corner of Xcode), or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-02-24 19:04:03.625 Photography[2543:56278] PhotoAlbum unit test program.
          --------------------------------------------
2016-02-24 19:04:03.627 Photography[2543:56278] album1 = <PhotoAlbum: length=0, data=[]>
2016-02-24 19:04:03.627 Photography[2543:56278] Adding photos to album1...
2016-02-24 19:04:03.628 Photography[2543:56278] Enumerating album1...
2016-02-24 19:04:03.628 Photography[2543:56278] album1[0] = <Photo: data=[#0: Photo of a celebrity, brought to you by Paparazzi]>
2016-02-24 19:04:03.628 Photography[2543:56278] album1[1] = <Photo: data=[#1: Side photo of our College, brought to you by Manal]>
2016-02-24 19:04:03.628 Photography[2543:56278] album1[2] = <Photo: data=[#2: Photo of a celebrity, brought to you by Paparazzi]>
2016-02-24 19:04:03.629 Photography[2543:56278] Removing photos from album1...
2016-02-24 19:04:03.629 Photography[2543:56278] removed album1.photos[0] = YES
2016-02-24 19:04:03.629 Photography[2543:56278] removed album1.photos[1] = YES
2016-02-24 19:04:03.629 Photography[2543:56278] album1 = <PhotoAlbum: length=1, data=[<Photo: data=[#1: Side photo of our College, brought to you by Manal]>]>
2016-02-24 19:04:03.630 Photography[2543:56278] Purging album1...
2016-02-24 19:04:03.630 Photography[2543:56278] album1 = <PhotoAlbum: length=0, data=[]>
Program ended with exit code: 0
```

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Exercise 2: Photography 2.0

Here, you will develop your very first iOS app that reuses code form the previous exercise to create and display PhotoAlbum information on an alert view. This exercise confirms to the Three Ts of iOS app development:

* **Tools** → Utilize Xcode to create and manage your project(s).
* **Technologies** → Create apps that responds to user input.
* **Techniques** → Take advantage of the fundamental design patterns that iOS underlies.

* Create a new project by launching Xcode, and selecting "New Project" from the File menu.

* Under the "iOS" section, select "Application", and choose “Single View Application”, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography2.0.1.png" width="100%" /></div>


