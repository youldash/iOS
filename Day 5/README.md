# Day 5: Scene Graphs (Part III)

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

Over the course of this workshop, we have shown you how to accomplish:

* Exercise [1](https://github.com/youldash/iOS/tree/master/Day%201#exercise-1-photography-10) → Build smaller (atomic) components using Xcode's Command Line Utility for testing them out separately before adding them into the bigger picture.
* Exercise [2](https://github.com/youldash/iOS/tree/master/Day%201#exercise-2-photography-20) → Build your very first iOS app that tested your previous atomic components through simple UI. In this exercise, we have also shown you how the MVC (Model View Controller) design paradigm was put into action (by separating your logic  code from both UI and controller classes).
* Exercises [3](https://github.com/youldash/iOS/tree/master/Day%202#exercise-3-arrays) through [5](https://github.com/youldash/iOS/tree/master/Day%202#exercise-5-multidimensional-arrays) → Construct custom Collection classes (i.e. both Unidimensional and Multidimensional Array facades) as atomic components for later use in proceeding tasks.
* Exercise [6](https://github.com/youldash/iOS/tree/master/Day%203#exercise-6-enumerators-and-enumerables) → Establish the foundations of your final iOS app (and modifying it to suite our needs). In addition to adding a few extra enumerable/iterative components (including their enumerators).
* Exercise [7](https://github.com/youldash/iOS/tree/master/Day%203#exercise-7-containers) → Build the skeleton code (using the Container class) for building Scene Graphs.
* Exercise [8 (Part I)](https://github.com/youldash/iOS/tree/master/Day%203#exercise-8-scene-graph-nodes-and-edges) → Construct the Nodes of your Scene Graphs.
* Exercise [8 (Part II) ](https://github.com/youldash/iOS/tree/master/Day%204#exercise-8-scene-graph-nodes-and-edges-continueds) → Construct the Edges and actual Graph facades of your Scene Graph app. The exercise also included a few tasks for constructing both Node and Edge enumerator and enumerable utility classes.
* Exercise [9](https://github.com/youldash/iOS/tree/master/Day%204#exercise-9-enumerating-scene-graph-objects) → Build the skeleton code (using the Container class) for building Scene Graphs.

In this final part, we will take you through the necessary steps for putting everything you've built together, along with a number of important steps for making your final product more appealing, and user responsive.

## Exercise 10: Modifying Your Scene Class

As the title suggests, you will be guided through a series of steps for making you Scene class handle user input and a such, you will have the ability in creating "labelled" Graph Nodes and connect them with Edges (using touch).

> **Note:** For the initial Nodes, we will assume that no Edges will be created for it. However for every consecutive touch, additional Nodes will be added to your Scene Graph, as they will be automatically connected through "labelled" Edges. Each Edge will display the computed distance/weight in a 2D Cartesian [(Euclidean)](https://en.wikipedia.org/wiki/Euclidean_distance) confined space.

* Edit your `GRScene.h` header from within the Editor area of Xcode and modify what is currently there using the following two code snippets as your guide. They contain both protocol and class interface declarations for defining the behavior of your Scenes, respectively:

``` Objective-C
@import SpriteKit;

#import "GRAbstractGraph.h"

@class GRScene;

/**
 *  Provides an interface for various scene graph calls.
 */
@protocol GRSceneDelegate <NSObject>

/**
 *  Scene graph did add a new node to its graph.
 *
 *  @param  scene  A Grapher scene associated with this edge.
 *  @param log  A log.
 */
- (void)scene:(GRScene *)scene addedNodeWithLog:(NSMutableString *)log;

/**
 *  Scene graph did purge its graph.
 *
 *  @param  scene  A Grapher scene associated with this edge.
 *  @param log  A log.
 */
- (void)scene:(GRScene *)scene purgedGraphWithLog:(NSMutableString *)log;

@end
```

``` Objective-C
/**
/**
 *  Provides an interface for playing around with interactive graph data structures.
 */
@interface GRScene : SKScene

#pragma mark -
#pragma mark Accessing

/**
 *  A Grapher scene delegate.
 */
@property (weak, nonatomic) id<GRSceneDelegate> sceneDelegate;

/**
 *  An undirected graph.
 */
@property (strong, nonatomic) id<GRGraphDelegate> graph;

/**
 *  The maximum number of nodes.
 */
@property (readwrite, nonatomic) NSUInteger length;

/**
 *  Logging.
 */
@property (copy, nonatomic) NSMutableString *log;

/**
 *  Indexing.
 */
@property (readwrite, nonatomic) NSUInteger idx;

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

* Your `GRScene` interface is now ready for some tweaks. Continue by editing the corresponding `GRScene.m` file and adding the following import statements (under `#import "GRScene.h"`), along with the property synthesizer stub for your Scene properties:

``` Objective-C
#import "GRSceneGraph.h"
#import "GRNode.h"
#import "GREdge.h"
```

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *  Sets the maximum number of nodes.
 */
- (void)setLength:(NSUInteger)length
{
    _length = length;
    
    // If our scene graph is not empty, reset it.
    if ([_graph isValid]) {
        
        [_graph purge];
        _graph = nil;
    }
    
    // Initialize graph data and initial settings.
    _graph = [[GRSceneGraph alloc] initWithIdentifier:@"Scene Graph" length:_length];
}
```

* You will also need to define a global default Graph length on top of your implementation file:

placing the following definition for new Node numbers (on top of the `@implementation` declarative):

``` Objective-C
/**
 *  Default scene graph length.
 */
#define kGRLengtDefault 10
```

* Next, update the Scene's `-didMoveToView:` method to match the following stub implementation (note that this method is responsible for initializing your Scene Graph):

``` Objective-C
#pragma mark -
#pragma mark Scene lifecycle

/**
 *  Any values set on nodes here will be used when the scene is rendered for the current frame.
 *
 *  @param view The view.
 */
- (void)didMoveToView:(SKView *)view
{
    /* Setup your scene here. */
    
    // Seed the random number generator.
    srandomdev();
    
    // Initialize graph data and initial settings.
    _graph = [[GRSceneGraph alloc] initWithIdentifier:@"Scene Graph" length:kGRLengtDefault];
    
    // Initialize the log.
    _log = [NSMutableString string];
    
    // Initialize the node number index.
    _idx = 0;
}
```

* Next, update the Scene's `-touchesBegan:withEvent:` method to match the following stub implementation (note that this method is responsible for adding both Nodes and Edges into your currently active Scene Graph):

``` Objective-C
/**
 *  Called when a touch begins.
 *
 *  @discussion Generally, all responders which do custom touch handling should override a number of methods.
 *  UIResponder will receive either -touchesEnded:withEvent: or -touchesCancelled:withEvent:
 *  for each touch it is handling (those touches it received in -touchesBegan:withEvent:).
 *
 *  @param touches A set of touches.
 *  @param event   An event.
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        
        // Attempt to add a new node if, and only if, the graph isn't full. Otherwise, start allover.
        if ([_graph isFull] == NO) {
            
            // Allow conversion of UITouch coordinates to scene-space.
            CGPoint location = [touch locationInNode:self];
            
            // Add a new node to the graph and get its number (index).
            _idx = [_graph addNodeWithIdentifier:NSLocalizedString(@"Node", @"Node Identifier")
                                          weight:@(arc4random_uniform(100)) /* Random weight. */
                                        position:location
                                           color:nil
                                           scene:self];
            
            // Get a reference to the new node.
            GRNode *head = [_graph nodeAtIndex:_idx];
            
            // Add it as a child node of the scene (it must not have a parent).
            [self addChild:head];
            
            // Append log updates.
            [_log appendFormat:@"\n%@", [head description]];
            
            // New node is successfully added. Alert the view controller to play a sound file.
            if ([_sceneDelegate respondsToSelector:@selector(scene:addedNodeWithLog:)])
                [_sceneDelegate scene:self addedNodeWithLog:_log];
            
            // Edges require at least two nodes.
            if (_idx >= 1) {
                
                // Get a reference to the new node.
                GRNode *tail = [_graph nodeAtIndex:_idx - 1];
                
                // Calculate the Euclidean distance from the head to tail nodes.
                double euclideanDistance = [head calculateEuclideanDistanceFromNode:tail];
                
                [_graph addEdgeFromIndex:head.number
                                 toIndex:tail.number
                                  weight:@(euclideanDistance)
                                   scene:self];
                
                // Get a reference to the new node.
                GREdge *edge = [_graph edgeFromIndex:head.number toIndex:tail.number];
                
                // Add it as a child node of the scene (it must not have a parent).
                [self addChild:edge];
            }
            
        } else { // start allover.
            
            // Remove all the nodes and edges from this graph.
            [_graph purge];
            
            // Removes all the nodes and edges from the Grapher scene.
            [self removeAllChildren];
            
            // Re-initialize the node number index.
            _idx = 0;
            
            // Scene graph is purged successfully. Alert the view controller to play a sound file.
            if ([_sceneDelegate respondsToSelector:@selector(scene:purgedGraphWithLog:)])
                [_sceneDelegate scene:self purgedGraphWithLog:_log];
        }
    }
}
```

* You may also wish to leave the `-update:` method block empty, like so:

``` Objective-C
/**
 *  Called before each frame is rendered
 *
 *  @param currentTime The current time interval.
 */
- (void)update:(CFTimeInterval)currentTime
{
    // NSLog(@"%s", __FUNCTION__);
}
```

> Awesome! Now you have a perfect good-looking Scene that responds to both user input, in addition to Graph creation and population. 

Time to update your View Controller class, too!

## Exercise 11: Modifying Your ViewController Class

Here, you will take you through a series of steps to initialize, and setup your Scene...









> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Wrap-up

**Congratulations!** You have made it through our intensive training course :)

Though... I have a confession to make! This is an enormous amount of information and should probably be a very lengthy handout. Nevertheless, I hope that you've enjoyed what was covered so far, and at least you've got a better understanding in making your ideas a living reality.

Thank you for sharing your interests!
Your feedback would definitely count towards making such workshops a success!

For any training requests (and if you have any specific topic you would like me to explain), please [**follow me on Twitter**](https://twitter.com/youldash) and I will (definitely) get back to as soon as I can!

Best wishes,

[**@youldash**](https://twitter.com/youldash)
