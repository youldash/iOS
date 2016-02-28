# Day 3: Scene Graphs (Part I)

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

Over the course of this day, you will be introduced to other topics pertaining to the construction of Scene Graphs. In particular, we will explain how the [work in the previous three exercises ](https://github.com/youldash/iOS/blob/master/Day%202/) can be incorporated into a much bigger component. That is, forming the Nodes and Edges of a Graph, along with other vital components that allow such Graphs to be constructed, enumerated, and queried.

In practice, you will start building your final Scene Graph iOS app starting from **Exercise 6**. As you start, we will guide you through the necessary steps for configuring your app to gradually accept new components, test them out, and to move on to the final phases of your app development lifecycle.

## Exercise 6: Enumerators and Enumerables

* Create a new project by launching Xcode, and selecting "New Project" from the File menu.

* Under the "iOS" section, select "Application", and choose the "Game" template, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.1.png" width="100%" /></div>

* When prompted for options, enter "Grapher" in the Product Name field (which is the final product outcome of this training course).

* Use a reverse DNS in the Organization Identifier field. For example, the chosen reverse DNS string for Umm Al-Qura's College URL is `sa.edu.uqu.cis`. Then, confirm the Bundle Identifier ends up looking like `sa.edu.uqu.cis.Grapher`.

* Choose "Objective-C" from the Language pop-up menu.

* Make sure you select "SpriteKit" from the Game Technology pop-up menu.

> **App Frameworks:** The "Game" technology template is a good starting point for developing apps that heavily depend on extensive graphics drawings and animations as their output. With Xcode you have the ability to develop graphics-rich apps using (at least one, or more than one in advanced cases) of the following four app frameworks: **SceneKit**, **SpriteKit**, **OpenGL ES** and finally, **Metal**. For simplicity, it is best to incorporate the [SpriteKit Framework](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SpriteKitFramework_Ref/) in your project, as it is suitable for rendering two-dimensional (2D) Graph-based primitives like Nodes and Edges, and beyond. Of course all of this will make sense in later parts of this training course as you continue from this point onwards :)
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.2.png" width="100%" /></div>

* Leave the Include Unit Tests and Include UI Tests checkboxes unchecked (as they are not necessary for this part of the exercises).

* Depending on which Apple platform your is targeting, you should carefully consider either "iPhone", "iPad", or "Universal" from the Devices pop-up menu. By selecting "Universal" you allow your app to run on all iOS devices whilst making sure that the look and feel of your app is dynamically adjusted to the chosen platform.

> **Note:** Since the exercises will be deployed on an iPad that will be brought during the course of the workshop, we will assume you have already chosen "iPad" form the Devices pop-up menu. Selecting which device to target and working on the design aspects of your project will be entirely up to you.

* Confirm the final steps by clicking Next, You may wish to leave "Create Git repository on" checked and "My Mac" selected:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.3.png" width="100%" /></div>
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.4.png" width="100%" /></div>

* Choose somewhere on your drive to save your project, and click Create. Xcode then creates your project, and it should look something like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.5.png" width="100%" /></div>

* Run the app on either your enrolled iOS device or Simulator, by making sure that the Scheme pop-up menu in the Xcode toolbar (top-left corner of Xcode) has Grapher > "YOUR DEVICE NAME" chosen. Then, press (⌘ + R). You should see something similar to the following:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.6.png" width="50%" /></div>

> **Note:** As you attempt to touch anywhere inside the app's visible **Scene** view, you will immediately notice it adding rotating spaceships (rendered as textured point sprites) at exactly where you touch. In essence, Sprite Kit organizes your app into the concept of Scenes (which are kind of like the "levels" or "screens" of your average game).
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.7.png" width="37.5%" /></div>

### Customizing your Project

If you take a closer look at your Grapher project, you'll see the SpriteKit Game template has already created a scene for you by default (called "GameScene" and made present by both `GameScene.[h,m]` Objective-C class files, and the `GameScene.sks` SpriteKit Serialized Data file).

* Inspect `GameScene.m` in the Editor area of Xcode and as you do so, you will witness code similar to the following snippet, which puts a centered white label on your screen, and adds a rotating spaceship whenever you tap on it:

``` Objective-C
#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
```

* For starters, you need to tweak this file by omitting code segments that are responsible for adding both label and spaceships. This step is necessary for the purpose of accomplishing this exercise (as this boilerplate code may well distract you from achieving the intended goal of this exercise), like so:

``` Objective-C
#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
```

### Importing Files from Previous Exercises

> **Important:** If you have already finished Exercises [3](https://github.com/youldash/iOS/tree/master/Day%202#exercise-3-arrays), [4](https://github.com/youldash/iOS/tree/master/Day%202#exercise-4-integer-arrays) and [5](https://github.com/youldash/iOS/tree/master/Day%202#exercise-5-multidimensional-arrays), you need to add copies of certain classes into your Grapher project, namely: `GRArray.[h,m]`, `GRIntegerArray.[h,m]` and `GRMultidimensionalArray.[h,m]`. These classes are import and as such, they play an important part in constructing new components for your Scene Graph iOS project!

* Start by right-clicking on yellow project folder from the Navigator area and choose "Add Files to Grapher"…
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.8.png" width="75%" /></div>

* Navigate to where you saved the four files and import them.

* Enable "Copy items if needed". Also make sure "Add to targets" is checked for the Grapher app bundle, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.9.png" width="100%" /></div>

> **Important:** ARC needs to be disabled for both `GRArray` and `GRIntegerArray` before you attempt the following steps!

### Disabling ARC

* Reveal both Editor and Navigator areas and click on the "Grapher" project blue icon.

* Configure your view according to the following sequence of actions: Highlight the "Grapher" app bundle (under "Targets") → Click on "Build Phases" to expand its options → Unfold "Compile Sources" to view seven implementation sources:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.10.png" width="100%" /></div>
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.11.png" width="50%" /></div>

* Double-click on `GRArray.m` and set its compiler flag to `-fno-objc-arc` so that you disable ARC for this class whenever you build or rebuild your project.

* Repeat the previous step for `GRIntegerArray.m` and disable ARC for it, too.

* Confirm that you end up having a similar configuration to this one:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.12.png" width="100%" /></div>

> Great! Xcode should not warn you about any possible ARC errors for these two classes.

### Enumerating Array Objects

As the title of this exercise suggests, Scene Graph elements (literally Node and Edge collections) need to be enumerated (or traversed based on a specific algorithm or method). For this very reason we shall introduce ways for accomplishing this.

#### Starting With the Enumerator Class

* Add a new class by highlighting on the "Grapher" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GREnumerator` as the class name. Make sure `NSObject` is selected for subclassing from. `GREnumerator` is a base class from which all enumerators object facades are derived.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.13.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GREnumerator.[h,m]` to your project.

* Replace what currently exists in `GREnumerator.h` with the following two code snippets. They contain both protocol and class interface declarations for the `GREnumerator` class, respectively:

``` Objective-C
@import Foundation;

/**
 *  Protocol implement by object enumerators.
 */
@protocol GREnumeratorDelegate <NSObject>

/**
 *  Indicates whether there are more objects to be enumerated.
 *
 *  @return  The boolean result.
 */
- (BOOL)hasMoreObjects;

/**
 *  The next object to be enumerated.
 *
 *  @return  The next object.
 */
- (id)nextObject;

@end
```

``` Objective-C
/**
 *  Base class from which all enumerators are derived.
 */
@interface GREnumerator : NSObject <GREnumeratorDelegate>

@end
```

* The `GREnumerator` interface is now ready for a proper implementation. Add the following class initializer stub in `GREnumerator.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated enumerator.
 *
 *  @return The new enumerator.
 */
- (instancetype)init
{
    NSAssert(![self isMemberOfClass:[GREnumerator class]], @"GREnumerator class instantiated.");
    
    // Immutable enumerator, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    // Return this enumerator along with its children.
    return self;
}
```

* Now, implement the `GREnumeratorDelegate` protocol methods `-hasMoreObjects` and `-nextObject` like so:

``` Objective-C
#pragma mark -
#pragma mark GREnumeratorDelegate

/**
 *  Indicates whether there are more objects to be enumerated.
 *
 *  @return  The boolean result.
 */
- (BOOL)hasMoreObjects
{
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}

/**
 *  The next object to be enumerated.
 *
 *  @return  The next object.
 */
- (id)nextObject
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}
```

#### Then Comes the Enumerable Classes

Aster defining our base Enumerator class in Grapher, we need a host that would act as a container for enumerable objects. For this, we introduce the Enumerable classes.

##### Defining the Enumerable "Abstract" Class

* Add a new class by highlighting on the "Grapher" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GRAbstractEnumerable` as the class name. Make sure SceneKit's base `SKNode` class is selected for subclassing from. `GRAbstractEnumerable` is a base class from which all enumerable object facades are derived.

> **Pro Tip:** The `SKNode` class represents a fundamental building block of our Scene Graph rendering content. Because our visible objects will be exclusively visualized as Nodes and Edges, we may well expect to enumerate them, using an enumerable (container) reference type that matches their base `SKNode` type. See the [SKNode Class Reference](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKNode_Ref/) for more information on how to properly use it in your SpriteKit projects.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.14.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GRAbstractEnumerable.[h,m]` to your project.

> **Important:** ARC needs to be disabled for the `GRAbstractEnumerable` class!

* Reveal both Editor and Navigator areas and click on the "Grapher" project blue icon.

* Highlight the "Grapher" app bundle (under "Targets") → Click on "Build Phases" to expand its options → Unfold "Compile Sources" to view seven implementation sources.

* Double-click on `GRAbstractEnumerable.m` and set its compiler flag to `-fno-objc-arc` so that you disable ARC for this class whenever you build or rebuild your project.

* Confirm that you end up having a similar configuration to this one:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.15.png" width="100%" /></div>

> Good job! You should not be warned about what you will be doing next :)

* Replace what currently exists in `GRAbstractEnumerable.h` with the following two code snippets. They contain both protocol and class interface declarations for the `GRAbstractEnumerable` class, respectively:

``` Objective-C
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
```

``` Objective-C
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
```

* The `GRAbstractEnumerable` interface is now ready for implementation. Add the following initializer stub in `GRAbstractEnumerable.m`:

``` Objective-C
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
```

* Now, implement the `GREnumeratorDelegate` protocol method `-objectEnumerator` like so:

``` Objective-C
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
```

* Next, type the following stub implementation for `-countByEnumeratingWithState:objects:count:` method, which confirms to the `NSFastEnumeration` protocol:

``` Objective-C
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
    
    id<GREnumeratorDelegate> enumerator = (id<GREnumeratorDelegate>)(state->state);
    
    if (enumerator == nil)
        enumerator = [self objectEnumerator];
    
    if (len > 0 && [enumerator hasMoreObjects]) {
        
        buffer[0] = [enumerator nextObject];
        state->state = (unsigned long)enumerator;
        state->itemsPtr = buffer;
        state->mutationsPtr = (unsigned long *)self;
        
        count = 1;
    }
    
    return count;
}
```

* Add the following final stub implementation for the remaining class method `+testEnumerable` to `GRAbstractEnumerable.m`:

``` Objective-C
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
```





> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## What's Next?

**Congratulations!** You are now ready to tackle the challenges introduced in [Day 4: Scene Graphs (Part II)](https://github.com/youldash/iOS/blob/master/Day%204/).
