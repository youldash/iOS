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

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GRAbstractEnumerable` as the class name. Make sure SceneKit's base `SKNode` class is selected for subclassing from. `GRAbstractEnumerable` is a generic class from which all enumerable object facades are derived.

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

> Great! You are now finished with the Abstract class for the Enumerable data type. Next, we will introduce you to a new Base class for constructing Enumerable data types in your final iOS project.

##### Defining the Enumerable "Base" Class

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GREnumerable` as the class name. Make sure `GRAbstractEnumerable` is selected for subclassing from. `GREnumerable` is a base class from which all enumerable object facades (e.g. Node and Edge enumerable containers) will be deriving from, in your Graph.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.16.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GREnumerable.[h,m]` to your project.

> **Important:** ARC needs to be disabled for this class, too!

* Reveal both Editor and Navigator areas and click on the "Grapher" project blue icon.

* Highlight the "Grapher" app bundle (under "Targets") → Click on "Build Phases" to expand its options → Unfold "Compile Sources" to view seven implementation sources.

* Double-click on `GREnumerable.m` and set its compiler flag to `-fno-objc-arc` so that you disable ARC for this class.

* Confirm that you end up having a similar configuration to this one:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.17.png" width="100%" /></div>

> No warnings, nor any errors for the `GREnumerable` should ever be prompted, at this stage.

* Replace what currently exists in `GREnumerable.h` with the following code snippet:

``` Objective-C
#import "GRAbstractEnumerable.h"

/**
 *  An enumerable object facade.
 */
@interface GREnumerable : GRAbstractEnumerable {
    
    /**
     *  An object that provides an enumerator.
     */
    id _target;
    
    /**
     *  Action invoked to get the enumerator from the object.
     */
    SEL _action;
    
    /**
     *  Optional argument for action.
     */
    id _object;
}

#pragma mark -
#pragma mark Initializing

/**
 *  Designed initializer.
 *  Initializes this enumerable object facade for the given target object and action selector.
 *
 *  @param  target  The target object.
 *  @param  action  An action selector.
 *
 *  @return  The new enumerable.
 */
- (instancetype)initWithTarget:(id)target action:(SEL)action;

/**
 *  Initializes this enumerable object facade for the given target object, action selector, and argument object.
 *
 *  @param  target  The target object.
 *  @param  action  An action selector.
 *  @param  object  The argument.
 *
 *  @return  The new enumerable.
 */
- (instancetype)initWithTarget:(id)target action:(SEL)action object:(id)object;

@end
```

* The `GREnumerable` interface is now ready for implementation. Add the following initializer stubs in `GREnumerable.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designed initializer.
 *  Initializes this enumerable object facade for the given target object and action selector.
 *
 *  @param  target  The target object.
 *  @param  action  An action selector.
 *
 *  @return  The new enumerable.
 */
- (instancetype)initWithTarget:(id)target action:(SEL)action
{
    // Immutable enumerable, just return a new reference to itself (retained automatically by ARC).
    return [self initWithTarget:target action:action object:nil];
}

/**
 *  Initializes this enumerable object facade for the given target object, action selector, and argument object.
 *
 *  @param  target  The target object.
 *  @param  action  An action selector.
 *  @param  object  The argument.
 *
 *  @return  The new enumerable.
 */
- (instancetype)initWithTarget:(id)target action:(SEL)action object:(id)object
{
    // Immutable enumerable, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Pass the parameters.
        _target = [target retain];
        _action = action;
        _object = [object retain];
    }
    
    // Return this enumerable along with its children.
    return self;
}
```

* Add the following stub implementation for the `-dealloc` method, for releasing `GREnumerable` object blocks from memory:

``` Objective-C
/**
 *  Deallocates the memory occupied by this enumerable object facade.
 */
- (void)dealloc
{
    [_target release];
    [_object release];
    
    [super dealloc];
}
```

* Awesome! Now override the `GREnumeratorDelegate` protocol method implementation for `-objectEnumerator` (that was initially defined in its superclass, `GRAbstractEnumerable`) using this stub:

``` Objective-C
#pragma mark -
#pragma mark GREnumeratorDelegate

/**
 *  Returns an enumerator.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)objectEnumerator
{
    if (_object)
        return [_target performSelector:_action withObject:_object];
    else
        
        return [_target performSelector:_action];
}
```

You are now finished with the Base class for the Enumerable data type and as such, you have completed this exercise! In the proceeding exercise we will introduce you to a new Container class that defines the behavior of the Scene Graph data type.

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Exercise 7: Containers

As the title of this exercise suggests, Scene Graph elements need to be hosted in some sort of special Container facade. This host will be introduced next (and will be used later in future exercises of this training course).

### Defining the Container "Abstract" Class

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GRContainer` as the class name. Make sure `GRAbstractEnumerable` is selected for subclassing from. Like the `GREnumerable` class, `GRContainer` will act as an Enumerable data type.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise7.0.1.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GRContainer.[h,m]` to your project.

* Replace what currently exists in `GRContainer.h` with the following two code snippets. They contain both protocol and class interface declarations for the `GRContainer` class, respectively:

``` Objective-C
#import "GRAbstractEnumerable.h"
#import "GREnumerable.h"

/**
 *  Protocol implemented by all containers.
 */
@protocol GRContainerDelegate <GREnumerableDelegate>

#pragma mark -
#pragma mark Accessing

/**
 *  The number of objects in this container.
 */
@property (readonly, nonatomic) NSUInteger count;

/**
 *  Indicates whether this container is empty.
 */
@property (readonly, nonatomic) BOOL isEmpty;

/**
 *  Indicates whether this container is full.
 */
@property (readonly, nonatomic) BOOL isFull;

/**
 *  Purges the objects from this container.
 */
- (void)purge;

@end
```

``` Objective-C
/**
 *  Base class from which all containers are derived.
 */
@interface GRContainer : GRAbstractEnumerable <GRContainerDelegate> {
    
    /**
     *  The number of objects in this container.
     */
    NSUInteger _count;
}

#pragma mark -
#pragma mark Testing

/**
 *  GRContainer test program.
 *
 *  @param  container  The container to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testContainer:(id<GRContainerDelegate>)container;

@end
```

* The `GRContainer` interface is now ready for implementation. Edit `GRContainer.m` and add the following property synthesizer stub that defines the scope and behavior of the accessible properties of `GRContainer`:

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *  The number of objects in this container.
 */
@synthesize count = _count;
```

* Your class properties are now defined. Now, add the following class initializer stub to `GRContainer.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated container.
 *
 *  @return  The new container.
 */
- (instancetype)init
{
    NSAssert(![self isMemberOfClass:[GRContainer class]], @"GRContainer class instantiated.");
    
    // Immutable container, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize all parameters.
        _count = 0;
    }
    
    // Return this container along with its children.
    return self;
}
```

* Next, add the following stub implementation to overriding the default behavior of the `-description` method:

``` Objective-C
#pragma mark -
#pragma mark Querying

/**
 *  Returns a string that describes this container.
 *
 *  @return  The string.
 */
- (NSString *)description
{
    NSMutableString *string = [NSMutableString string];
    
    for (id object in self) {
        
        if (string.length > 0)
            [string appendFormat:@", "];
        
        [string appendFormat:@"%@", object];
    }
    
    return [NSString stringWithFormat:@"<%@: %@>", [self class], string];
}
```

* Great! The next thing to do is to specify how the `GRContainerDelegate` protocol properties will behave when called, or set (to be precise, both `isEmpty` and `isFull` properties, and the `-purge` method):

``` Objective-C
#pragma mark -
#pragma mark OCContainerDelegate

/**
 *  Indicates whether this container is empty.
 *
 *  @return The boolean result.
 */
- (BOOL)isEmpty
{
    return _count == 0;
}

/**
 *  Indicates whether this container is full.
 *
 *  @return The boolean result.
 */
- (BOOL)isFull
{
    return NO;
}

/**
 *  Removes all the objects from this container.
 */
- (void)purge
{
    [self doesNotRecognizeSelector:_cmd];
}
```

* One last thing to do. You need to implement the class method `+testContainer` like so:

``` Objective-C
#pragma mark -
#pragma mark Testing

/**
 *  GRContainer unit test program.
 *
 *  @param  container  The container to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testContainer:(id<GRContainerDelegate>)container
{
    [GRAbstractEnumerable testEnumerable:container];
    
    NSLog(@"GRContainer test program.\n\
          --------------------------------------------");
    
    NSLog(@"container = %@", container);
    NSLog(@"count = %lu", container.count);
    NSLog(@"isEmpty = %@", container.isEmpty ? @"YES" : @"NO");
    NSLog(@"isFull = %@", container.isFull ? @"YES" : @"NO");
    
    NSLog(@"Purging...");
    [container purge];
    NSLog(@"container = %@", container);
    NSLog(@"count = %lu", container.count);
    NSLog(@"isEmpty = %@", container.isEmpty ? @"YES" : @"NO");
    NSLog(@"isFull = %@", container.isFull ? @"YES" : @"NO");
    
    return YES;
}
```

Congratulations! Your Base class `GRContainer` is now properly defined and is ready for later use. What follows is the last two exercises for constructing Node and Edge data types for your final Grapher iOS app.

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Exercise 8: Scene Graph Nodes and Edges

As the title suggests, Nodes and Edges are both considered vital building blocks of any Graph facade (regardless if they are drawable or not), since they are key ingredients for constructing Scene Graphs in your final iOS project.

### But First...

Before we introduce both Node and Edge classes, we need to make a few adjustments to your Grapher `GameScene` class.

Since we are working with the same **prefix** in every element of our project (i.e. the `GR` class prefix), let us **enforce** (or rather, follow) the same naming convention to existing project files. This obviously includes the `GameScene` class, along with the `GameViewController` class (which hosts our main and only available scene in the final app).

### At First, Refractor Existing Scene and View Controller Sources

> **Note:** The refractor process means that files/code segments in our working Xcode project can be renamed, extracted, etc. In Xcode, you can easily refractor/rename files **automatically** without going through the hassle in attempting this tedious process manually! In fact, whenever your project gets any bigger, you might want to consider making good use of this feature before you ever decide on going through this process, manually.

> **Note:** The refractor mechanism in Xcode **only works** if you have enabled the **"Create Git repository on"** when you've first started your project, or if you've moved your entire Xcode project folder in a folder that is already tied-up/linked-to an existing Git repo. If you are working under the assumption that Git is in fact enabled for your project(s), then Xcode will create local Snapshots of your project (should you wish to revert back to code segments used prior any new changes in your code). [This article](https://developer.apple.com/library/ios/recipes/xcode_help-structure_navigator/articles/RestoringaProjectorWorkspacefromaSnapshot.html) has more to say regarding this topic.

#### Renaming "GameScene" to "GRScene"

Edit `GameScene.h` in the Editor area of Xcode and perform the following:

* Highlight the `GameScene` class name (or interface) by selecting the whole word using your keyboard/mouse/trackpad:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.1.png" width="100%" /></div>

* Goto "Edit" → "Refractor" → "Rename" from Xcode's menu bar (top menu), like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.2.png" width="100%" /></div>

* A dialog will appear, prompting for the new class name. Change it from `GameScene`:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.3.png" width="100%" /></div>
to `GRScene`:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.4.png" width="100%" /></div>

* If for any reason Xcode warns about any uncommitted changes in your project, don't worry!
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.5.png" width="75%" /></div>
You can simply click on Continue and proceed with the next steps. Xcode will rename the class for you.

#### Renaming "GameScene.sks" to "GRScene.sks"

In addition to the `GRScene` Objective-C class, you may wish to rename its referencing `GameScene.sks` SpriteKit Serialized Data file in `GameViewController.m`. This can be achieved by Editing `GameViewController.h` and highlighting the `GameScene` file reference from within the `-viewDidLoad` implementation, and changing it to reference `GRScene.sks` like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.6.png" width="100%" /></div>

#### Renaming "GameViewController" to "GRViewController"

Edit `GameViewController.h` and perform the following actions:

* Highlight the `GameViewController` class interface by selecting the whole word:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.8.png" width="100%" /></div>

* Goto "Edit" → "Refractor" → "Rename" from Xcode's top menu bar, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.9.png" width="100%" /></div>

* A dialog will appear, prompting for the new class name. Change it from `GameViewController`:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.10.png" width="100%" /></div>
to `GRViewController`:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.11.png" width="100%" /></div>

* If Xcode warns you about uncommitted changes in your project, don't worry! Just click on Continue and rename the file. Xcode will (behind the scenes) automatically rename every reference to this classname change in your project.

Awesome! You are now ready to start creating both Nodes and Edges for your iOS app :)

### Then, Start Working on the Node Class

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GRNode` as the class name. Make sure the `SKShapeNode` superclass is selected for it.

> **Pro Tip:** The `SKShapeNode` class is a special kind of `SKNode` that is ideally used for drawing custom shapes defined by a the app's graphics path context. In our context, `SKShapeNode` will be used for defining the shape of a typical Node data structure. See the [SKShapeNode Class Reference](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKShapeNode_Ref/index.html#//apple_ref/occ/cl/SKShapeNode) for more information on how to properly use it in your SpriteKit projects.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.12.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GRNode.[h,m]` to your project.

* Replace what code is currently present for `GRNode.h` with the following two code snippets. They contain both protocol and class interface declarations for the `GRNode` class, respectively:

``` Objective-C
@import SpriteKit;

@class GRNode;
@class GRScene;

/**
 *  Protocol implemented by a graph node.
 */
@protocol GRNodeDelegate <NSObject>

#pragma mark -
#pragma mark Accessing

/**
 *  An identifier.
 */
@property (copy, nonatomic) NSString *identifier;

/**
 *  A weight on this graphic.
 */
@property (strong, nonatomic) NSNumber *weight;

/**
 *  The number of this node.
 */
@property (readwrite, nonatomic) NSUInteger number;

/**
 *  Circular reference to a Grapher scene (not retained).
 */
@property (weak, nonatomic) GRScene *scene;

/**
 *  Default node color.
 *
 *  @return The color.
 */
+ (SKColor *)nodeColor;

#pragma mark -
#pragma mark Modifying

/**
 *  Centers this node's position in world space.
 */
- (void)center;

#pragma mark -
#pragma mark Querying

/**
 *  Calculates/recalculates the Euclidean distance.
 *
 *  @return The Euclidean distance from node.
 */
- (double)calculateEuclideanDistanceFromNode:(id<GRNodeDelegate>)node;

@end
```

``` Objective-C
/**
 *  Represents a node in a scene graph.
 */
@interface GRNode : SKShapeNode <GRNodeDelegate>

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated node with an identifier, weight, color, and scene properties.
 *
 *  @param  identifier  An identifier.
 *  @param  weight    A weight.
 *  @param  color    A color.
 *  @param  scene    A Grapher scene associated with this edge.
 *
 *  @return  The new node.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier
                            weight:(NSNumber *)weight
                             color:(SKColor *)color
                             scene:(GRScene *)scene;

/**
 *  Initializes a newly allocated node with an identifier, weight, color, position, and scene properties.
 *
 *  @param  identifier  An identifier.
 *  @param  weight    A weight.
 *  @param  size    A size.
 *  @param  color    A color.
 *  @param  scene    A Grapher scene associated with this edge.
 *
 *  @return  The new node.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier
                            weight:(NSNumber *)weight
                          position:(CGPoint)position
                             color:(SKColor *)color
                             scene:(GRScene *)scene;

@end
```

* The `GRNode` interface is now ready for implementation. Continue by edit `GRNode.m` and placing the following definition for new Node numbers (on top of the `@implementation` declarative):

``` Objective-C
/**
 *  Default node number (used every time whenever a new node is created).
 */
#define kGRNumberDefault 0
```

* Also, make sure that you include a reference to `GRScene.h` in your Node class:

``` Objective-C
#import "GRScene.h"
```

* Next, add the following property synthesizer stub that defines the scope and behavior of the accessible properties for your Nodes:

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *  An identifier.
 */
@synthesize identifier = _identifier;

/**
 *  Returns the identifier of this cluster (name).
 */
- (NSString *)identifier
{
    return self.name;
}

/**
 *  A weight on this graphic.
 */
@synthesize weight = _weight;

/**
 *  The number of this node.
 */
@synthesize number = _number;

/**
 *  Circular reference to a Grapher scene (not retained).
 */
@synthesize scene = _scene;

/**
 *  Default node color.
 *
 *  @return The color.
 */
+ (SKColor *)nodeColor
{
    return [SKColor colorWithRed:174.0 / 255.0
                           green:128.0 / 255.0
                            blue:255.2 / 255.0
                           alpha:001.0];
}
```

* Your class properties are now defined. Now, add the following class initializer stub to `GRNode.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated node with an identifier, weight, color, and scene properties.
 *
 *  @param  identifier  An identifier.
 *  @param  weight    A weight.
 *  @param  color    A color.
 *  @param  scene    A Grapher scene associated with this edge.
 *
 *  @return  The new node.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier
                            weight:(NSNumber *)weight
                             color:(SKColor *)color
                             scene:(GRScene *)scene
{
    // Immutable node, just return a new reference to itself (retained automatically by ARC).
    return [self initWithIdentifier:identifier
                             weight:weight
                           position:CGPointZero
                              color:color
                              scene:scene];
}

/**
 *  Initializes a newly allocated node with an identifier, weight, color, position, and scene properties.
 *
 *  @param  identifier  An identifier.
 *  @param  weight    A weight.
 *  @param  color    A color.
 *  @param  scene    A Grapher scene associated with this edge.
 *
 *  @return  The new node.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier
                            weight:(NSNumber *)weight
                          position:(CGPoint)position
                             color:(SKColor *)color
                             scene:(GRScene *)scene
{
    // Immutable node, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Pass the parameters.
        self.name = [identifier description];
        self.weight = weight;
        
        // Assign its scene reference.
        self.scene = scene;
        
        // The position of the node in the parent's coordinate system.
        self.position = position;
        
        // Creating a shape node from a path shows an example of how to create a shape node.
        // In the following lines we will create a circle with a "nodeColor" interior and a black outline.
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddArc(path, /* CGMutablePathRef. */
                     NULL, /* CGAffineTransform. */
                     0.0f, /* x. */
                     0.0f, /* y. */
                     30.0f, /* radius. */
                     0.0f, /* startAngle. */
                     M_PI * 2.0f, /* endAngle. */
                     YES); /* clockwise. */
        
        // The path is created and attached to the shape node's path property.
        self.path = path;
        
        // The width used to stroke the path
        self.lineWidth = 1.0f;
        
        // The color to draw the path with.
        self.strokeColor = [[self class] nodeColor];
        
        // Add a glow to the path stroke of the specified width.
        self.glowWidth = 1.0f;
        
        // The color to fill the path with.
        self.fillColor = (color == nil ? [UIColor blackColor] : color);
        
        // init its number to default.
        self.number = kGRNumberDefault;
        
        // Add a label node using the identifier.
        SKLabelNode *identifierLabel = [SKLabelNode labelNodeWithFontNamed:@"Farah"];
        identifierLabel.text = self.identifier;
        identifierLabel.fontSize = 36.0f;
        identifierLabel.position = CGPointMake(self.position.x, self.position.y - 10.0f);
        
        // Add it to the Grapher scene.
        [self.scene addChild:identifierLabel];
    }
    
    // Return this node and its children.
    return self;
}
```

* Next, add the following stub implementation to overriding the default behavior of the `-description` method:

``` Objective-C
#pragma mark -
#pragma mark Querying

/**
 *  Returns a string that describes this node.
 *
 *  @return  The string.
 */
- (NSString *)description
{
    // Establish the description string.
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"%@ [#%ld]", self.name, self.number];
    
    // Append its position.
    [string appendFormat:@" at %@", NSStringFromCGPoint(self.position)];
    
    // Weighted?
    if (self.weight)
        [string appendFormat:@" [%@]", self.weight];
    
    // Return it.
    return string;
}
```

* Next, implement the `GRNodeDelegate` protocol method: `-calculateEuclideanDistanceFromNode:`:

``` Objective-C
/**
 *  Calculates/recalculates the Euclidean distance.
 *
 *  @return The Euclidean distance from node.
 */
- (double)calculateEuclideanDistanceFromNode:(GRNode *)node
{
    // Calculate the difference.
    CGFloat x = self.position.x - node.position.x;
    CGFloat y = self.position.y - node.position.y;
    
    // Calculate the product.
    double product = powf(x, 2.0f) + powf(y, 2.0f);
    
    // Retun the computed length/norm.
    return sqrtf(product);
}
```

* Finally, implement the `GRNodeDelegate` protocol method: `-center`:

``` Objective-C
#pragma mark -
#pragma mark Modifying

/**
 *  Centers this node's position in world space.
 */
- (void)center
{
    // Reset the position vector.
    self.position = CGPointZero;
}
```

Fantastic! You now have a valid Node data structure for your Grapher app. All that remains is to add a little bit of effort to complete the Edge data structure. This part of the exercise will be introduced in the following day :)

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## What's Next?

**Congratulations!** You are now ready to tackle the challenges introduced in [Day 4: Scene Graphs (Part II)](https://github.com/youldash/iOS/blob/master/Day%204/).
