# Day 4: Scene Graphs (Part II)

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

Over the course of this day, you will be introduced to other topics pertaining to the construction of Scene Graphs. In particular, we will explain how the [work in the previous three exercises ](https://github.com/youldash/iOS/blob/master/Day%202/) can be incorporated into a much bigger component. That is, forming the Nodes and Edges of a Graph, along with other vital components that allow such Graphs to be constructed, enumerated, and queried.

In practice, you will start building your final Scene Graph iOS app starting from **Exercise 6**. As you start, we will guide you through the necessary steps for configuring your app to gradually accept new components, test them out, and to move on to the final phases of your app development lifecycle.

## Exercise 8: Scene Graph Nodes and Edges (Continued)

As the title suggests, Nodes and Edges are both considered vital building blocks of any Graph facade.

> **Important!** This part of the exercise assumes you've successfully completed all tasks in [Exercise 8 from yesterday](https://github.com/youldash/iOS/tree/master/Day%203#exercise-8-scene-graph-nodes-and-edges). If that isn't the case, then we **strongly recommend** that you complete them first prior attempting the tasks that are presented here.

### The Edge Class

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GREdge` as the class name. Make sure the `SKShapeNode` superclass is selected for it.

> **Pro Tip:** Like `GRNode`, the `SKShapeNode` class is the ideal candidate for drawing custom shapes defined by a the app's graphics path context. In our context, `SKShapeNode` will be used for defining the shape of a typical Edge data structure. See the [SKShapeNode Class Reference](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKShapeNode_Ref/index.html#//apple_ref/occ/cl/SKShapeNode) for more information on how to properly use it in your SpriteKit projects.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.13.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GREdge.[h,m]` to your project.

* Replace what code is currently present for `GREdge.h` with the following two code snippets. They contain both protocol and class interface declarations for the `GREdge` class, respectively:

``` Objective-C
@import Foundation;
@import UIKit;
@import SpriteKit;

#import "GRAbstractGraph.h"

@class GRNode;
@class GRScene;

/**
 *  Protocol implemented by a graph edge.
 */
@protocol GREdgeDelegate <NSObject>

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
 *  The head node of this edge.
 */
@property (readonly, nonatomic) GRNode *head;

/**
 *  The tail node of this edge.
 */
@property (readonly, nonatomic) GRNode *tail;

/**
 *  Circular reference to an undirected graph that contains this edge (not retained).
 */
@property (weak, nonatomic) id<GRGraphDelegate> graph;

/**
 *  Circular reference to a Grapher scene (not retained).
 */
@property (weak, nonatomic) GRScene *scene;

/**
 *  The color to draw the edge with.
 */
@property (copy, nonatomic) SKColor *color;

/**
 *  Edge color.
 *
 *  @return The color.
 */
+ (SKColor *)edgeColor;

#pragma mark -
#pragma mark Querying

/**
 *  The mate node for the given node.
 *
 *  @param  node  A node of this edge.
 *
 *  @return  The mate of the given node.
 */
- (GRNode *)mateOfNode:(GRNode *)node;

@end
```

``` Objective-C
/**
 *  Represents an edge in a graph.
 */
@interface GREdge : SKShapeNode <GREdgeDelegate>

#pragma mark -
#pragma mark Accessing

/**
 *  The index of the head node.
 */
@property (assign, nonatomic) NSUInteger headIdx;

/**
 *  The index of the tail node.
 */
@property (assign, nonatomic) NSUInteger tailIdx;

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated edge with the given graph, head and tail node indices, weight, color, line width, and scene reference.
 *
 *  @param  identifier  An identifier.
 *  @param  graph    An undirected graph.
 *  @param  weight    A weight.
 *  @param  headIdx    The index of the head node.
 *  @param  tailIdx    The index of the tail node.
 *  @param  color    A color vector.
 *  @param  scene    A Grapher scene associated with this edge.
 *
 *  @return  The new edge.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier
                             graph:(id<GRGraphDelegate>)graph
                            weight:(NSNumber *)weight
                emanatingFromIndex:(NSUInteger)headIdx
                   insidentOnIndex:(NSUInteger)tailIdx
                             color:(UIColor *)color
                             scene:(GRScene *)scene;

@end
```

* The `GREdge` interface is now ready for implementation. Continue by editing the corresponding `GREdge.m` file adding the following import statements (under `#import "GREdge.h"`), along with the property synthesizer stub for your Edge properties:

``` Objective-C
#import "GRNode.h"
#import "GRScene.h"
```

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *  An identifier.
 */
@synthesize identifier = _identifier;

/**
 *  Returns the identifier of this edge (name).
 */
- (NSString *)identifier
{
    return self.name;
}

/**
 *  A weight on this edge.
 */
@synthesize weight = _weight;

/**
 *  Circular reference to an undirected graph that contains this edge (not retained).
 */
@synthesize graph = _graph;

/**
 *  Circular reference to a Grapher scene (not retained).
 */
@synthesize scene = _scene;

/**
 *  Edge color.
 */
@synthesize color = _color;

/**
 *  Returns the head node.
 *
 *  @return  The head node.
 */
- (GRNode *)head
{
    return [self.graph nodeAtIndex:self.headIdx];
}

/**
 *  Returns the tail node.
 *
 *  @return  The tail node.
 */
- (GRNode *)tail
{
    return [self.graph nodeAtIndex:self.tailIdx];
}

/**
 *  Edge color.
 *
 *  @return The color.
 */
+ (SKColor *)edgeColor
{
    return [SKColor colorWithRed:128.0 / 255.0
                           green:196.0 / 255.0
                            blue:000.0 / 255.0
                           alpha:000.8];
}
```

* Your class properties are now defined. Now, add the following class initializer stub to `GREdge.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated edge with the given graph, head and tail node indices, weight, color, line width, and scene reference.
 *
 *  @param  identifier  An identifier.
 *  @param  graph    An undirected graph.
 *  @param  weight    A weight.
 *  @param  headIdx    The index of the head node.
 *  @param  tailIdx    The index of the tail node.
 *  @param  color    A color vector.
 *  @param  scene    A Grapher scene associated with this edge.
 *
 *  @return  The new edge.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier
                             graph:(id<GRGraphDelegate>)graph
                            weight:(NSNumber *)weight
                emanatingFromIndex:(NSUInteger)headIdx
                   insidentOnIndex:(NSUInteger)tailIdx
                             color:(SKColor *)color
                             scene:(GRScene *)scene
{
    // Immutable edge, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Pass all parameters.
        self.name = identifier.description;
        self.graph = graph;
        self.weight = weight;
        self.headIdx = headIdx;
        self.tailIdx = tailIdx;
        
        // Assign its scene reference.
        self.scene = scene;
        
        // Edge "path" construction functions.
        CGMutablePathRef path = CGPathCreateMutable();
        
        // Move the current point to "head" in "path" and begin a new subpath.
        CGPathMoveToPoint(path,
                          NULL,
                          self.head.position.x,
                          self.head.position.y);
        
        // Append a straight line segment from the current point to "head" in "path",
        // and then move the current point to "tail".
        CGPathAddLineToPoint(path,
                             NULL,
                             self.tail.position.x,
                             self.tail.position.y);
        
        // Set the path.
        self.path = path;
        
        // Set the stroke color.
        self.strokeColor = (color == nil ? [[self class] edgeColor] : color);
        
        // The width used to stroke the path
        self.lineWidth = 5.0f;
        
        // Add a glow to the path stroke of the specified width.
        self.glowWidth = 1.0f;
        
        // Add a label node using the identifier.
        SKLabelNode *identifierLabel = [SKLabelNode labelNodeWithFontNamed:@"Farah"];
        identifierLabel.text = self.identifier;
        identifierLabel.fontSize = 24.0f;
        identifierLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                               CGRectGetMidY(self.frame));
        
        // Add it to the Grapher scene.
        [self.scene addChild:identifierLabel];
    }
    
    // Return this edge and its children.
    return self;
}
```

* Next, add the following stub implementation to overriding the default behavior of the `-description` method:

``` Objective-C
#pragma mark -
#pragma mark Querying

/**
 *  Returns a string that contains a description of this edge.
 *
 *  @return  The string.
 */
- (NSString *)description
{
    // Establish the description string.
    NSMutableString *string = [NSMutableString stringWithFormat:@"%@", self.name];
    
    // Weighted?
    if (self.weight)
        [string appendFormat:@" [%@]", self.weight];
    
    // Return it.
    return string;
}
```

* Finally, implement the `GREdgeDelegate` protocol method: `-mateOfNode:`:

``` Objective-C
/**
 *  The mate node for the given node.
 *
 *  @param  node  A node of this edge.
 *
 *  @return  The mate of the given node.
 */
- (GRNode *)mateOfNode:(GRNode *)node
{
    // If either head or tail nodes matches the passed argument, then proceed. Otherwise return nothing.
    GRNode *mate = nil;
    
    if (node.number == self.headIdx)
        mate = self.tail;
    
    if (node.number == self.tailIdx)
        mate = self.head;
    
    NSAssert(mate != nil, @"Illegal argument.");
    return mate;
}
```

Good job! You now have a valid Edge data structure for your Grapher app. 

### But Wait!

As you may have already noticed, the implementation included a few lines for an expected Graph facade. To fill in the gaps, we shall instruct you to commence work on two new Graph-related classes: a `GRAbstractGraph` class, and immediately after that a new `GRSceneGraph` class...

> **Important:** This part of the exercises assumes that you have already finished constructing the GRContainer class form [Exercise 7](https://github.com/youldash/iOS/tree/master/Day%203#exercise-7-containers). If this isn't the case, then we strongly encourage you to complete it first prior going ahead with what follows.

### The `GRAbstractGraph` Class

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GRAbstractGraph` as the class name. Make sure the `GRContainer` superclass is selected for it.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.14.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GRAbstractGraph.[h,m]` to your project.

* Replace what code is currently present for `GRAbstractGraph.h` with the following two code snippets. They contain both protocol and class interface declarations, respectively:

``` Objective-C
#import "GRContainer.h"

@class GRAbstractGraph;
@class GRNode;
@class GREdge;
@class GRScene;
@class GRArray;

@import SpriteKit;

/**
 *  Protocol implemented by all graphs.
 */
@protocol GRGraphDelegate <GRContainerDelegate>

#pragma mark -
#pragma mark Accessing

/**
 *  An identifier.
 */
@property (readonly, nonatomic) NSString *identifier;

/**
 *  The number of nodes.
 */
@property (readonly, nonatomic) NSUInteger numberOfNodes;

/**
 *  The number of edges.
 */
@property (readonly, nonatomic) NSUInteger numberOfEdges;

/**
 *  The nodes in this graph.
 *
 *  An array of pointers to node instances, used to represent the elements of the node set N.
 */
@property (strong, readonly, nonatomic) id<GREnumerableDelegate> nodes;

/**
 *  The edges in this graph.
 *
 *  An array of pointers to edge instances, used to represent the elements of the edge set E.
 */
@property (strong, readonly, nonatomic) id<GREnumerableDelegate> edges;

#pragma mark -
#pragma mark Querying

/**
 *  Returns the node in this graph at the given index.
 *
 *  @param  index  An index.
 *
 *  @return  The node at the given index.
 */
- (GRNode *)nodeAtIndex:(NSUInteger)index;

/**
 *  Returns a boolean value that indicates whether there is an edge in this graph between the nodes with the given indices.
 *
 *  @param  index1  index1 The from index.
 *  @param  index2  index2 The to index.
 *
 *  @return  The boolean result.
 */
- (BOOL)isEdgeFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2;

/**
 *  Returns the edge in this graph between the given nodes with the given indices.
 *
 *  @param  index1  The from index.
 *  @param  index2  The to index.
 *
 *  @return  The edge joining the given nodes.
 */
- (GREdge *)edgeFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2;

/**
 *  Indicates whether this graph is valid or not.
 *
 *  @return  The boolean result.
 */
- (BOOL)isValid;

#pragma mark -
#pragma mark Mutating

/**
 *  Adds a node to this graph with parameters: identifier, weight, position, color, and scene.
 *  Node's position will be assigned later.
 *  Returns the number of the new node.
 *
 *  This mutator (-addNodeWithIdentifier:weight:size:color:scene:) inserts new node into a graph.
 *  For simplicity, we shall assume that a given node is inserted into exactly one graph.
 *  All the nodes contained in a graph must have a unique node number.
 *  Furthermore, if a graph contains (n) nodes, those nodes shall be numbered 0, 1, 2, ..., n-1.
 *  Therefore, the next node inserted into the graph shall have the number (n).
 *
 *  This accessor (brought forward from -indexOfNode:) takes an integer, say (i) where 0 <= i < n,
 *  and returns reference to the i'th node contained in the graph.
 *
 *  @param  identifier  An identifier.
 *  @param  weight    A weight.
 *  @param  position  A position.
 *  @param  color    A color.
 *  @param  scene    A Grapher scene associated with this edge.
 *
 *  @return  The index of the new node.
 */
- (NSUInteger)addNodeWithIdentifier:(id<NSObject>)identifier
                             weight:(NSNumber *)weight
                           position:(CGPoint)position
                              color:(SKColor *)color
                              scene:(GRScene *)scene;

/**
 *  Adds an edge to this graph between the nodes with the given indices, weight.
 *
 *  @param  index1  The from index.
 *  @param  index2  The to index.
 *  @param  weight  The weight on the edge.
 *  @param  scene  A Grapher scene associated with this edge.
 */
- (void)addEdgeFromIndex:(NSUInteger)index1
                 toIndex:(NSUInteger)index2
                  weight:(NSNumber *)weight
                   scene:(GRScene *)scene;

/**
 *  Removes all the nodes and edges from this graph.
 */
- (void)purge;

#pragma mark -
#pragma mark Enumerating

/**
 *  Returns an enumerator that enumerates the nodes of this graph.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)nodeEnumerator;

/**
 *  Returns an enumerator that enumerates the edges of this graph.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)edgeEnumerator;

@end
```

``` Objective-C
/**
 *  Base class from which all graph classes are derived.
 */
@interface GRAbstractGraph : GRContainer <GRGraphDelegate> {
    
    /**
     *  The number of nodes.
     */
    NSUInteger _numberOfNodes;
    
    /**
     *  The number of edges.
     */
    NSUInteger _numberOfEdges;
    
    /**
     *  A "mutable" array of nodes.
     */
    GRArray *_nodeArray;
}

#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated graph with the given length (maximum number of nodes).
 *
 *  @param  identifier  An identifier.
 *  @param  length    The maximum number of nodes.
 *
 *  @return  The new graph.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier length:(NSUInteger)length;

#pragma mark -
#pragma mark Testing

/**
 *  Weighted graph test program.
 *
 *  @param  graph  The graph to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testWeightedGraph:(id<GRGraphDelegate>)graph;

/**
 *  Graph test program.
 *
 *  @param  graph  The graph to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testGraph:(id<GRGraphDelegate>)graph;

@end
```










> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## What's Next?

**Congratulations!** You are now ready to tackle the final challenges presented in [Day 5: Scene Graphs (Part III)](https://github.com/youldash/iOS/blob/master/Day%205/).


