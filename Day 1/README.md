# Day 1: Induction

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

In this part of the course, you will be introduced to a few remarks about creating apps from ideas, and what everyone should consider before starting work on the app projects. This is then immediately followed by two practicals/exercises.

The exercises are expected to be addressed in an orderly fashion. Having said that, you will not be able to finish the second exercise unless you finish the first one.

## A "Little Thing" About Passion

Have you ever thought of an idea that is going to be the "Next Big Thing", but you don't know where to start? … If this is the case, you're definitely in the right spot. The most important part of creativity is coming up with ideas, and mobile apps are no exception. Whether it be from seeing apps that are already in the App Store, thinking of a good solution to a problem you face, or simply thinking something would be cool are all great reasons to develop an app.

<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Lamp.png" width="25%" /></div>

Being passionate about your idea is going to carry you through the process. If you're not passionate, you're going to burn out.

From a business perspective, you view at all ideas in the app world through the lens of earning money. There are very few people out there that want to spend a lot of their own cash on something that's just cool, and this isn't for them. This is about making sure your idea is not only good, but will win, and last long in the app market.

In traditional business models, there are two general areas of success. Either you innovate something that no one else did, or you simply beat the competition by becoming better.

As you become very passionate about your idea, and discuss it with others, it is very important to make sure it's bulletproof from the start. For this, you should definitely ask your self this:

> **What makes your idea special?**

On this note, you need to remember that an app, or "solution", needs to be special in some way. This can be achieved through the following:

* **Featuring** → Navigating though different screens using swipe gestures instead of tapping.
* **Designing** → Making an app with animated backgrounds (makes your app more alive).
* **Storytelling** → Cataloging the story of an inspiring person/significant moment and sharing it with others.
* **Marketing** → Signing up with a Organization with millions/billions of fans e.g. Facebook, Instagram, Twitter, Pinterest, Snapchat, and similar.

As a final remark, try coming up with an idea that means something to you. Anyone today can think of good ideas, and only a handful present great ideas to the world. So, try thinking of something that is truly "awesome" in a sense.

## Exercise 1: Photography 1.0

In this exercise, you will develop a Photography app as a Foundation tool using Xcode. This example shows how to create a `Photo` class that forms the basis of a `PhotoAlbum` class using containers.

> **Pro Tip:** Working with command line projects often grants you experience in developing smaller packages and managing them with Xcode. Such packages can be reused later on in bigger, more complex projects or workspaces.

* Create a new project by launching Xcode (under the "/Applications" folder if you installed Xcode by downloading it directly from the App Store), and selecting "New Project" from the File menu.

* Under the "OS X" section, select "Application", and choose “Command Line Tool”, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.1.png" width="100%" /></div>

* When prompted for options, type "Photography" as the Product Name.

* You may consider leaving the Organization Identifier field as is by default (which is allowed in previous major releases of Xcode), or use a reverse DNS (Domain Name System). For instance, if you take a look at the College of Computer and Information Systems' domain name "http://cis.uqu.edu.sa", then its reverse DNS string should look like `sa.edu.uqu.cis`. The Bundle Identifier will be set automatically, which is used for identifying your app in the App Store. Your Bundle Identifier should look like `sa.edu.uqu.cis.Photography`.

* Choose "Objective-C" from the Language pop-up menu. By doing so, you allow your code to be linked to the [Foundation Framework](https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/ObjC_classic/index.html) that holds all the necessary handlers for defining simple data types like `NSObject` and others, using this language.

> **Note:** Choosing "Swift" will be entirely up to you, as this workshop is specifically aimed at teaching Objective-C as grounds for developing the final product in **[Day 5](https://github.com/youldash/iOS/blob/master/Day%205/)**. Objective-C has a lot to offer, and the differences between it and Swift will be briefly elaborated in **[Day 5](https://github.com/youldash/iOS/blob/master/Day%205/)**.

* Leave the Use Automatic Reference Counting checkbox checked (as it exists in earlier releases of Xcode).
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.2.png" width="100%" /></div>

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected. This feature allows you to create and manage different versions of your project using a bundled Git repository, as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.3.png" width="100%" /></div>

* Xcode then creates your project. It should look something like this:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.4.png" width="100%" /></div>

* To bring more insight into the Xcode IDE, a snapshot from Xcode's documentation files is borrowed for illustration:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/IDE.png" width="75%" /></div>

* Try hiding both Utility and Debug areas, and only show both Editor and Navigation areas. This may help you focus on code you manage and keeps from getting distracted by other elements that might not be of relevance to the current project, like so (never mind the color scheme):
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.5.png" width="100%" /></div>

* Add a new class by highlighting on the "Photography" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.6.png" width="100%" /></div>

* When prompted for options, type `Photo` as the class name. Make sure `NSObject` is selected for subclassing from, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.7.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file `Photo.h` and the implementation file `Photo.m` to your project.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.8.png" width="100%" /></div>

### Implementing

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
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.9.png" width="100%" /></div>

* Confirm by clicking Next and save the new class.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise1.0.10.png" width="100%" /></div>

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

* Type the code snippets listed below into `PhotoAlbum.m`:

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
```

``` Objective-C
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
```

``` Objective-C
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
```

``` Objective-C
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
```

``` Objective-C
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
    
    NSLog(@"Adding photos to album1…");
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
    
    NSLog(@"Enumerating album1…");
    for (Photo *photo in album1.photos) {
        
        NSLog(@"album1[%lu] = %@", idx, photo.description);
        
        idx++;
    }
    
    NSLog(@"Removing photos from album1…");
    NSLog(@"removed album1.photos[%d] = %@", photo1.number, [album1 removePhoto:photo1] ? @"YES" : @"NO");
    NSLog(@"removed album1.photos[%d] = %@", photo2.number, [album1 removePhoto:photo2] ? @"YES" : @"NO");
    NSLog(@"album1 = %@", [album1 description]);
    
    NSLog(@"Purging album1…");
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

### Compiling your Project

* Compile and run the program by clicking on the Run button (located on the top-left corner of Xcode), or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-02-24 19:04:03.625 Photography[2543:56278] PhotoAlbum unit test program.
          --------------------------------------------
2016-02-24 19:04:03.627 Photography[2543:56278] album1 = <PhotoAlbum: length=0, data=[]>
2016-02-24 19:04:03.627 Photography[2543:56278] Adding photos to album1…
2016-02-24 19:04:03.628 Photography[2543:56278] Enumerating album1…
2016-02-24 19:04:03.628 Photography[2543:56278] album1[0] = <Photo: data=[#0: Photo of a celebrity, brought to you by Paparazzi]>
2016-02-24 19:04:03.628 Photography[2543:56278] album1[1] = <Photo: data=[#1: Side photo of our College, brought to you by Manal]>
2016-02-24 19:04:03.628 Photography[2543:56278] album1[2] = <Photo: data=[#2: Photo of a celebrity, brought to you by Paparazzi]>
2016-02-24 19:04:03.629 Photography[2543:56278] Removing photos from album1…
2016-02-24 19:04:03.629 Photography[2543:56278] removed album1.photos[0] = YES
2016-02-24 19:04:03.629 Photography[2543:56278] removed album1.photos[1] = YES
2016-02-24 19:04:03.629 Photography[2543:56278] album1 = <PhotoAlbum: length=1, data=[<Photo: data=[#1: Side photo of our College, brought to you by Manal]>]>
2016-02-24 19:04:03.630 Photography[2543:56278] Purging album1…
2016-02-24 19:04:03.630 Photography[2543:56278] album1 = <PhotoAlbum: length=0, data=[]>
Program ended with exit code: 0
```

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Exercise 2: Photography 2.0

Here, you will develop your very first iOS app that reuses code form the previous exercise to create and display PhotoAlbum information on an alert view. This exercise confirms to the Three Ts of iOS app development:

| T | Description |
|:----:|:--------:|
| **Tools** | Utilize Xcode to create and manage your project(s). |
| **Technologies** | Create apps that responds to user input. |
| **Techniques** | Take advantage of the fundamental design patterns that iOS underlies. |

* Create a new project by launching Xcode, and selecting "New Project" from the File menu.

* Under the "iOS" section, select "Application", and choose "Single View Application", then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.1.png" width="100%" /></div>

> **App Frameworks:** "Single View Application" apps, along with similar view-based apps, generally depend on the [UIKit Framework](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKit_Framework/) for creating various UI elements for UI display, and for handling user interaction.

* When prompted for options, type "iPhotography" as the Product Name.

* You may consider leaving the Organization Identifier field as is by default (which is allowed in previous major releases of Xcode), or use a reverse DNS (Domain Name System). Here, the chosen reverse DNS string for Umm Al-Qura's College URL looks like `sa.edu.uqu.cis`. By doing so, you should confirm the Bundle Identifier to look like `sa.edu.uqu.cis.iPhotography`.

* Choose "Objective-C" from the Language pop-up menu.

* Leave the Use Core Data, Include Unit Tests, and Include UI Tests checkboxes unchecked (as they are not necessary for this part of the exercises).

* Depending on which Apple platform your is targeting, you should carefully consider either "iPhone", "iPad", or "Universal" from the Devices pop-up menu. By selecting "Universal" you allow your app to run on all iOS devices whilst making sure that the look and feel of your app is dynamically adjusted to the chosen platform.

> **Note:** Since the exercises will be deployed on an iPad that will be brought during the course of the workshop, we will assume you have already chosen "iPad" form the Devices pop-up menu. Selecting which device to target and working on the design aspects of your project will be entirely up to you.

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.2.png" width="100%" /></div>
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.3.png" width="100%" /></div>

* Xcode then creates your project. It should look something like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.4.png" width="100%" /></div>

* Try running the app on your iOS device (or Simulator if you don't have access to a physical device that has been enrolled in your iOS Developer Profile) by making sure that the Scheme pop-up menu in the Xcode toolbar (top-left corner of Xcode) has iPhotography > "YOUR DEVICE NAME" chosen. Then, press (⌘ + R). You should see the device/simulator running with a blank (white) screen like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.5.png" width="50%" /></div>

* Now, make sure you can see both Navigator and Utility areas. You are now ready to add a button for displaying `PhotoAlbum` data. Edit the `Main.storyboard` file in your project navigator to display the scene on the canvas, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.6.png" width="100%" /></div>

### Adding UI Elements

* Open the Object library (appears at the bottom of the Utilities area), and choose Controls from the Objects pop-up menu.

* Drag a Round Rect Button from the list to the view. Lay out your UI element appropriately to be centered on screen. Double-click on the Button and type the text "Show PhotoAlbum Info". Your view should confirm to the following screenshot:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.7.png" width="100%" /></div>

* Select your button again and hit (⌘ + =). This will allow the button to resize and fit based on the text width that you've entered. Your view should confirm to the following screenshot:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.8.png" width="100%" /></div>

* Run your app again. At this current stage, the button doesn't do much. To add the required logic, you need to make the appropriate connections between the UI element and the view controller. This connection is described next.

* In the toolbar, click the Utilities button to hide the Utilities area and click the Assistant editor button to display the Assistant editor pane.

* Make the Assistant displays the view controller's header `ViewController.h`.

* Control-drag from the Round Rect Button to the method declaration area in the header. When released, Xcode displays a popover for configuring the action connection you just made, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.9.png" width="100%" /></div>

<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.10.png" width="100%" /></div>

* In the Connection pop-up menu, choose Action.

*  the Name field, enter `-showPhotoAlbumInfo:` **and please do not forget to include the colon at the end!**

* Make sure the Type field contains `id`.

* Make sure that the Event pop-up menu contains "Touch Up Inside" (because you want the message to be sent when the user lifts the finger from inside the button).

* Make sure that the Arguments pop-up menu contains Sender.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.11.png" width="100%" /></div>

### Connecting Your UI to Your Data Model

* Finally in the popover, click Connect. Xcode adds a stub implementation of the new `showAddressBook:` method and indicates a connection has been made by showing a filled-in circle to the left of the method. Confirm your header includes this action method declaration:

``` Objective-C
- (IBAction)showPhotoAlbumInfo:(id)sender;
```

* Also, confirm the following stub implementation is included in `ViewController.m`:

``` Objective-C
- (IBAction)showPhotoAlbumInfo:(id)sender {
}
```
> A connection between the Round Rect Button and the `ViewController` class is now established and ready for use, but not yet…

* Verify that the connection has been established by clicking the Standard editor button to switch to the Standard editor view (to the left of the Assistant editor button). Select `View Controller` in the outline view, then view the Connections inspector in the Utilities area.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.12.png" width="100%" /></div>

> You're making progress! Yet, there's still no way to show relevant data, even if you press on the button. To do that, you have to import files from the Photography exercise.

### Importing Files from the Previous Exercise

*  If you have completed the Photography project, add (by copying) the following files into your current project: `Photo.[h,m]` and `PhotoAlbum.[h,m]`. Right-click on yellow project folder from the Navigator area and choose "Add Files to iPhotography"…
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.13.png" width="100%" /></div>

* Navigate to where you saved the four files and import them.

* Enable "Copy items if needed". Also make sure "Add to targets" is checked for the iPhotography app bundle, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.14.png" width="100%" /></div>

* You're almost done! Now go back and edit `ViewController.m` and import both `Photo.h` and `PhotoAlbum.h` headers.

* Confirm the following stub implementation is asserted into the `-showPhotoAlbumInfo:` method you've created earlier:

``` Objective-C
/**
 *  Reveals PhotoAlbum info within a window (popup).
 *
 *  @param sender A sender.
 */
- (IBAction)showPhotoAlbumInfo:(id)sender
{
    // Establish a new PhotoAlbum object.
    PhotoAlbum *album = [[PhotoAlbum alloc] init];

    // Establish a new Photo object.
    Photo *photo = [Photo new];
    photo.caption = @"A snapshot of foo";
    photo.photographer = @"Ahmed";
 
    // Inserts the photo into the PhotoAlbum's lcaol array.
    [album insertsPhoto:photo];
    
    // Establish an AlertController message string.
    NSMutableString *message = [NSMutableString stringWithFormat:@"%@, brought to you by %@",
     photo.caption,
     photo.photographer];

    // Log the currently saved PhotoAlbum data (for debugging purposes).
    NSLog(@"%@", album.description);
    
    // Present the PhotoAlbum info in an AlertController instance.
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:@"Alert!"
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    // Establish a "Dismiss" AlertAction object.
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss"
                                                            style:UIAlertActionStyleDefault
                                                          handler:NULL];
    
    // Add the AlertAction object to the AlertController object.
    [alertController addAction:dismissAction];
    
    // Present it.
    [self presentViewController:alertController animated:YES completion:NULL];
}
```

> Your button is now ready for use! What you have done is simply declared an `PhotoAlbum` object and passed it a new `Photo` object. For the `PhotoAlbum` data to be prompted, a special `UIAlertController` object is allocated and then is passed a new `UIAlertAction` instance (which adds a button in the alert controller and effectively handles its interaction). The final stage involved invoking `UIViewController`'s `-presentViewController:animated:completion:` method, which was used to reveal the alert popup.

### Running your App

* Run and test the final version of the app on your iOS device (or Simulator), and confirm that an alert popup is prompted after clicking on the button, revealing data generated from the `PhotoAlbum` object.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise2.0.15.png" width="100%" /></div>

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## What's Next?

**Congratulations!** You are now ready to tackle the challenges introduced in [Day 2: Uni- and Multi-dimensional Arrays](https://github.com/youldash/iOS/blob/master/Day%202/).
