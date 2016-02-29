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

* The `GREdge` interface is now ready for implementation. Continue by editing the corresponding `GREdge.m` file and adding the following import statements (under `#import "GREdge.h"`), along with the property synthesizer stub for your Edge properties:

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

> Good job! You now have a valid Edge data structure for your Grapher app. 

### But Wait!

As you may have already noticed, the implementation included a few lines for an expected Graph facade. To fill in the gaps, we shall instruct you to commence work on two new Graph-related classes: a `GRAbstractGraph` class, and immediately after that a new `GRSceneGraph` class...

> **Important:** This part of the exercises assumes that you have already finished constructing the GRContainer class form [Exercise 7](https://github.com/youldash/iOS/tree/master/Day%203#exercise-7-containers). If this isn't the case, then we strongly encourage you to complete it first prior going ahead with what follows.

### The "Abstract" Scene Graph Class

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
 *  This mutator inserts new node into a graph.
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
 *  GRAbstractGraph test program.
 *
 *  @param  graph  The graph to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testGraph:(id<GRGraphDelegate>)graph;

@end
```

* The `GRAbstractGraph` interface is now ready for coding. Edit the corresponding implementation file and add the following import statements (under `#import "GRAbstractGraph.h"`), along with the proceeding `GRAbstractGraph` Category class declaration:

``` Objective-C
#import "GRNode.h"
#import "GREdge.h"
#import "GREdgeEnumerator.h"
#import "GRScene.h"
#import "GRArray.h"
#import "GRContainerAsArrayEnumerator.h"
```

``` Objective-C
/**
 *  Grapher graph category.
 */
@interface GRAbstractGraph ()

#pragma mark -
#pragma mark Accessing

/**
 *  By re-declaring class properties as read-write,
 *  this class can assign values to the properties while still keeping everyone else from being able to do so.
 * 'nonatomic' means that the setter isn't guaranteed to be thread-safe.
 */
@property (readwrite, nonatomic) NSUInteger numberOfNodes;
@property (readwrite, nonatomic) NSUInteger numberOfEdges;

@end
```

* Next, add the `GRGraphDelegate` property synthesizer stub:

``` Objective-C
#pragma mark -
#pragma mark GRGraphDelegate

/**
 *  Returns the identifier of this cluster (name).
 */
- (NSString *)identifier
{
    return self.name;
}

/**
 *  The number of nodes.
 */
@synthesize numberOfNodes = _numberOfNodes;

/**
 *  The number of edges.
 */
@synthesize numberOfEdges = _numberOfEdges;
```

* Next, add the `GRContainerDelegate` property synthesizer stub and protocol methods:

``` Objective-C
#pragma mark -
#pragma mark GRContainerDelegate

/**
 *  Returns the number of nodes in this graph.
 *
 *  @return  The number of nodes.
 */
- (NSUInteger)count
{
    return _numberOfNodes;
}

/**
 *  Returns a boolean that indicates whether this graph is full.
 *
 *  @return  The boolean result.
 */
- (BOOL)isFull
{
    return self.count == _nodeArray.length;
}

/**
 *  Removes all the nodes and edges from this graph.
 *
 *  @param  graph  The graph.
 */
- (void)purge
{
    [_nodeArray purge];
    
    _numberOfNodes = 0;
    
    // Also remove all the nodes and edges from the Grapher scene.
    [self.scene removeAllChildren];
}
```

* Next, add the following class initializer stub to `GRAbstractGraph.m`:

``` Objective-C
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
- (instancetype)initWithIdentifier:(id<NSObject>)identifier length:(NSUInteger)length
{
    // Immutable graph, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize all parameters.
        self.name = identifier.description;
        _numberOfNodes = 0;
        _numberOfEdges = 0;
        _nodeArray = [[GRArray class] arrayWithLength:length];
    }
    
    // Returns this graph along with its children.
    return self;
}
```

* Next, add the following stub implementation to overriding the default behavior of the `-objectEnumerator` method:

``` Objective-C
#pragma mark -
#pragma mark Enumerating

/**
 *  Returns an enumerator that enumerates the nodes in this graph.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)objectEnumerator
{
    return [self nodeEnumerator];
}
```

* Next, add the following stub implementation to overriding the default behavior of the `-description` method:

``` Objective-C
#pragma mark -
#pragma mark Querying

/**
 *  Returns a string that contains a description of this graph.
 *
 *  @return  The string.
 */
- (NSString *)description
{
    NSMutableString *string = [NSMutableString string];
    
    NSUInteger idx = 0;
    
    for (GRNode *node in self.nodes)
        [string appendFormat:@"%@ %@\n", @(++idx), node];
    
    idx = 0;
    
    for (GREdge *edge in self.edges)
        [string appendFormat:@"%@ %@\n", @(++idx), edge];
    
    return [NSString stringWithFormat:@"%@ {\n%@}", self.identifier, string];
}
```

* Next, implement the remaining `GRAbstractGraph` methods:

``` Objective-C
/**
 *  Indicates whether this graph is valid or not.
 *
 *  @return  The boolean result.
 */
- (BOOL)isValid
{
    return _numberOfNodes > 0;
}

/**`
 *  Returns the node at the given index in this graph.
 *
 *  @param  index  An index.
 *
 *  @return  The node at the given index.
 */
- (GRNode *)nodeAtIndex:(NSUInteger)index
{
    return [_nodeArray objectAtIndex:index];
}

/**
 *  Returns an enumerator that enumerates the nodes of this graph.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)nodeEnumerator
{
    return [[GRContainerAsArrayEnumerator alloc] initWithContainer:self array:_nodeArray count:_numberOfNodes fromIndex:0];
}

/**
 *  Returns the nodes of this graph.
 *
 *  @return  The nodes.
 */
- (id<GREnumerableDelegate>)nodes
{
    return [[GREnumerable alloc] initWithTarget:self action:@selector(nodeEnumerator)];
}

/**
 *  Returns an enumerator that enumerates the edges of this graph.
 *
 *  @return  The enumerator.
 */
- (id<GREnumeratorDelegate>)edgeEnumerator
{
    return [[GREdgeEnumerator alloc] initWithGraph:self];
}

/**
 *  The edges of this graph.
 *
 *  @return  The edges of this graph.
 */
- (id<GREnumerableDelegate>)edges
{
    return [[GREnumerable alloc] initWithTarget:self action:@selector(edgeEnumerator)];
}

/**
 *  Returns a boolean that indicates whether there is an edge in this graph that connects the given nodes.
 *
 *  (-indexOfEdgeBeginningAt:endingAt:) accessor takes two node identification arguments.
 *  It returns a reference to the egde instance (if it exists) that connects the corresponding nodes.
 *  The behavior of this routine is undefined when the edge does not exist.
 *  An implementation SHOULD typically throw an exception!
 *
 *  This boolean-valued accessor takes two node identifications (assuming numbers) as arguments.
 *  It returns YES if the graph contains an edge that connects the corresponding nodes.
 *
 *  (-isEdgeBeginningAt:endingAt:) uses either an overflow exception or a warning exception...
 *
 *  @param  index1  index1 The from index.
 *  @param  index2  index2 The to index.
 *
 *  @return  The boolean result.
 */
- (BOOL)isEdgeFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2
{
    return [self edgeFromIndex:index1 toIndex:index2] != nil;
}

/**
 *  Returns the edge in this graph between the given nodes with the given indices.
 *
 *  @param  index1  The from index.
 *  @param  index2  The to index.
 *
 *  @return  The edge joining the given nodes.
 */
- (GREdge *)edgeFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

#pragma mark -
#pragma mark Mutating

/**
 *  Adds a node to this graph with parameters: identifier, weight, position, color, and scene.
 *  Node's position will be assigned later.
 *  Returns the number of the new node.
 *
 *  This mutator inserts new node into a graph.
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
                              scene:(GRScene *)scene
{
    GRNode *node = [[GRNode alloc] initWithIdentifier:identifier
                                               weight:weight
                                             position:position
                                                color:color
                                                scene:scene];
    
    // Insert the given node into this graph.
    [self insertNode:node];
    
    // Retain its designated number.
    return node.number;
}

/**
 *  Inserts the given node into this graph.
 *
 *  @param  node  The node to insert.
 */
- (void)insertNode:(GRNode *)node
{
    NSAssert(!self.isFull, @"Container full.");
    
    // Swap.
    [_nodeArray replaceObjectAtIndex:_numberOfNodes withObject:node];
    
    // Update its number with relation to the current total number of added nodes.
    node.number = _numberOfNodes;
    
    // Increment by 1.
    _numberOfNodes++;
}

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
                   scene:(GRScene *)scene
{
    // Create an appropriate identifier string.
    NSMutableString *identityString =
    [NSMutableString stringWithFormat:@"%lu-%lu", index1, index2];
    
    // Weighted?
    if (weight)
        [identityString appendFormat:@" [%.1f]", weight.doubleValue];
    
    // Create it.
    GREdge *edge = [[GREdge alloc] initWithIdentifier:identityString
                                                graph:self
                                               weight:weight
                                   emanatingFromIndex:index1
                                      insidentOnIndex:index2
                                                color:nil
                                                scene:scene];
    
    // Insert it.
    [self insertEdge:edge];
}

/**
 *  Inserts the given edge into this graph.
 *
 *  @param  edge  The edge to insert.
 */
- (void)insertEdge:(GREdge *)edge
{
    [self doesNotRecognizeSelector:_cmd];
}
```

* What remains now is the following stub implementation for the `+testGraph:` class method:

``` Objective-C
#pragma mark -
#pragma mark Testing

/**
 *  GRAbstractGraph test program.
 *
 *  @param  graph  The graph to test.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)testGraph:(id<GRGraphDelegate>)graph
{
    NSLog(@"GRAbstractGraph test program.\n\
          --------------------------------------------");

    GRScene *scene = [[GRScene alloc] init];
    
    NSUInteger n0 = [graph addNodeWithIdentifier:@"n0" weight:@345 position:CGPointZero color:nil scene:scene];
    NSUInteger n1 = [graph addNodeWithIdentifier:@"n1" weight:@123 position:CGPointZero color:nil scene:scene];
    NSUInteger n2 = [graph addNodeWithIdentifier:@"n2" weight:@234 position:CGPointZero color:nil scene:scene];
    
//  [graph addEdgeFromIndex:n0 toIndex:n0 weight:@0 scene:scene]; /* Will not work! */
    [graph addEdgeFromIndex:n0 toIndex:n1 weight:@9 scene:scene];
    [graph addEdgeFromIndex:n0 toIndex:n2 weight:@2 scene:scene];
//  [graph addEdgeFromIndex:n1 toIndex:n0 weight:@9 scene:scene]; /* Will not work if (n0--n1) already exists! */
//  [graph addEdgeFromIndex:n1 toIndex:n1 weight:@0 scene:scene]; /* Will not work! */
    [graph addEdgeFromIndex:n1 toIndex:n2 weight:@3 scene:scene];
//  [graph addEdgeFromIndex:n2 toIndex:n0 weight:@2 scene:scene]; /* Will not work if (n0--n2) already exists! */
//  [graph addEdgeFromIndex:n2 toIndex:n1 weight:@3 scene:scene]; /* Will not work if (n1--n2) already exists! */
//  [graph addEdgeFromIndex:n2 toIndex:n2 weight:@0 scene:scene]; /* Will not work! */
    
    NSLog(@"%@", graph);
    NSLog(@"Number of nodes = %@", @(graph.numberOfNodes));
    NSLog(@"Number of edges = %@", @(graph.numberOfEdges));
    
    NSLog(@"%@", [NSString stringWithFormat:@"Enumerating %lu nodes...", graph.numberOfNodes]);
    for (id<GRNodeDelegate> node in graph.nodes)
        NSLog(@"%@", node);
    
    NSLog(@"%@", [NSString stringWithFormat:@"Enumerating %lu edges...", graph.numberOfEdges]);
    for (id<GREdgeDelegate> edge in graph.edges)
        NSLog(@"%@", edge);

    [graph purge];
    
    return YES;
}
```

> Good job! You are now finished with the Abstract class for creating Graphs.

Next, we will introduce you to a new Base class for constructing actual Scene Graphs in your final iOS project.

### The "Base" Scene Graph Class

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GRSceneGraph` as the class name. Make sure the `GRAbstractGraph` superclass is selected for it.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.15.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GRSceneGraph.[h,m]` to your project.

* Replace what code is currently present for `GRSceneGraph.h` with the following class declaration stub:

``` Objective-C
#import "GRAbstractGraph.h"

@class GRMultidimensionalArray;

/**
 *  Represents a graph implemented using a dense matrix.
 */
@interface GRSceneGraph : GRAbstractGraph {
    
    /**
     *  A dense matrix.
     */
    GRMultidimensionalArray *_matrix;
}

#pragma mark -
#pragma mark Testing

/**
 *  GRSceneGraph unit test program.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest;

@end
```

* The `GRSceneGraph` interface is now ready for coding. Edit the corresponding implementation file and add the following import statements (under `#import "GRSceneGraph.h"`):

``` Objective-C
#import "GRMultidimensionalArray.h"
#import "GRIntegerArray.h"
#import "GREdge.h"
#import "GRNode.h"
#import "GRArray.h"
```

* Next, add the `GRGraphDelegate` property synthesizer stub:

``` Objective-C
#pragma mark -
#pragma mark GRGraphDelegate

/**
 *  Removes the nodes and edges from this graph as matrix.
 */
- (void)purge
{
    // Purge the matrix.
    [_matrix purge];
    
    // Reset the number of edges to 0.
    _numberOfEdges = 0;
    
    // Purge the node array.
    [super purge];
}

/**
 *  Inserts the given edge into this graph.
 *
 *  @param  edge  The edge to insert.
 */
- (void)insertEdge:(GREdge *)edge
{
    NSUInteger headIdx = edge.head.number;
    NSUInteger tailIdx = edge.tail.number;
    
    NSAssert(headIdx != tailIdx, @"Illegal argument.");
    NSAssert(![self isEdgeFromIndex:headIdx toIndex:tailIdx], @"Illegal argument.");
    
    [_matrix replaceObjectAtIndices:GRTuple(headIdx, tailIdx) withObject:edge];
    [_matrix replaceObjectAtIndices:GRTuple(tailIdx, headIdx) withObject:edge];
    
    // Increment the number of edges by 1.
    _numberOfEdges += 1;
}

/**
 *  Returns the edge in this graph for the given node indices.
 *
 *  @param  index1  The from index.
 *  @param  index2  The to index.
 *
 *  @return  The edge joining the given nodes.
 */
- (GREdge *)edgeFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2
{
    return [_matrix objectAtIndices:GRTuple(index1, index2)];
}
```

* Next, add the following class initializer stub to `GRSceneGraph.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designated initializer.
 *  Initializes a newly allocated graph as matrix with the given length (maximum number of nodes).
 *
 *  @param  identifier  An identifier.
 *  @param  length    The maximum number of nodes.
 *
 *  @return  The new graph as matrix.
 */
- (instancetype)initWithIdentifier:(id<NSObject>)identifier length:(NSUInteger)length
{
    // Immutable graph as matrix, just return a new reference to itself (retained automatically by ARC).
    self = [super initWithIdentifier:identifier length:length];
    
    if (self) {
        
        // Initialize all parameters.
        _matrix = [[GRMultidimensionalArray alloc] initWithDimensions:GRTuple(length, length)];
    }
    
    // Return this graph as matrix along with its children.
    return self;
}
```

* Finally, add the following stub implementation for the `+unitTest` class method:

``` Objective-C
#pragma mark -
#pragma mark Testing

/**
 *  GRSceneGraph unit test program.
 *
 *  @return  A boolean value that indicates whether all the tests were successful.
 */
+ (BOOL)unitTest
{
    NSLog(@"GRSceneGraph unit test program.\n\
          --------------------------------------------");
    
    GRSceneGraph *graph = [[GRSceneGraph alloc] initWithIdentifier:@"Scene Graph" length:5];
    [GRAbstractGraph testGraph:graph];
    
    return YES;
}
```

> That is all! You are now finished with the Base class for creating Graphs, which will be used for rendering your scene.

Next, we will introduce you to the remaining Enumerator classes (specifically `GRConnectedNodeEnumerator`, `GREdgeEnumerator` and `GRContainerAsArrayEnumerator`) that were referenced in you Graph code earlier, for constructing actual Scene Graphs in your final iOS project.

These tasks are made part of a separate exercise, which is described below:

## Exercise 9: Enumerating Scene Graph Objects

As the title of this exercise suggests, Scene Graph Nodes and Edges can be enumerated using some sort of Enumerator mechanism (which was presented in an earlier exercise: [Exercise 6: Enumerators and Enumerables](https://github.com/youldash/iOS/tree/master/Day%203#exercise-6-enumerators-and-enumerables)). These classes are defined as follows:

* The `GRConnectedNodeEnumerator` class for enumerating "connected" Graph Nodes,
* The `GREdgeEnumerator` class for enumerating "connected" Graph Nodes, and
* The `GRContainerAsArrayEnumerator` class for enumerating the Scene Graph (as a whole).

### Starting With the an Enumerator for Connected Nodes

* Add a new class by highlighting on the "Grapher" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GRConnectedNodeEnumerator` as the class name. Make sure `GREnumerator` is selected for subclassing from. This class is used as an enumerator that iterates through Node facades, connected to other Nodes by a given set of Edges.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise9.0.1.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GRConnectedNodeEnumerator.[h,m]` to your project.

* Replace what currently exists in `GRConnectedNodeEnumerator.h` with the class declaration stub:

``` Objective-C
#import "GREnumerator.h"
#import "GREnumerable.h"

@class GRNode;

/**
 *  Represents an enumerator that enumerates the nodes connected to a given node by a given set of edges.
 */
@interface GRConnectedNodeEnumerator : GREnumerator {
    
    /**
     *  A node.
     */
    GRNode *_node;
    
    /**
     *  An edge enumerator.
     */
    id<GREnumeratorDelegate> _enumerator;
}

#pragma mark -
#pragma mark Initializing

/**
 *  Designed initializer.
 *  Initializes a newly allocated connected node enumerator with the given node and edge enumerator.
 *
 *  @param  node  A node.
 *  @param  edges  The edges adjacent to the given node.
 *
 *  @return  The new enumerator.
 */
- (instancetype)initWithNode:(GRNode *)node edges:(id<GREnumerableDelegate>)edges;

@end
```

* Next, edit the corresponding `GRConnectedNodeEnumerator.m` file and add the following import statement (right under `#import "GRConnectedNodeEnumerator.h"`):

``` Objective-C
#import "GREdge.h"
```

* Now, add the following class initializer stub to `GRConnectedNodeEnumerator.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designed initializer.
 *  Initializes a newly allocated connected node enumerator with the given node and edge enumerator.
 *
 *  @param  node  A node.
 *  @param  edges  The edges adjacent to the given node.
 *
 *  @return  The new connected node enumerator.
 */
- (instancetype)initWithNode:(GRNode *)node edges:(id<GREnumerableDelegate>)edges
{
    // Immutable connected node enumerator, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize all parameters.
        _node = node;
        _enumerator = [edges objectEnumerator];
    }
    
    // Return this connected node enumerator along with its children.
    return self;
}
```

* Last, but not least, override the `GREnumeratorDelegate` protocol methods `-hasMoreObjects` and `nextObject`, using the following stub:

``` Objective-C
#pragma mark -
#pragma mark GREnumeratorDelegate

/**
 *  Indicates whether there are more nodes to be enumerated.
 *
 *  @return  The boolean result.
 */
- (BOOL)hasMoreObjects
{
    return [_enumerator hasMoreObjects];
}

/**
 *  The next object to be enumerated.
 *
 *  @return  The next object.
 */
- (id)nextObject
{
    GREdge *edge = [_enumerator nextObject];
    
    return [edge mateOfNode:_node];
}
```

> Good! You now have access to a valid ConnectedNodeEnumerator data structure for your Grapher app.

### After That, an Enumerator for Edges

* Add a new class by highlighting on the "Grapher" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GREdgeEnumerator` as the class name. Make sure `GREnumerator` is selected for subclassing from. This class is used as an enumerator that iterates through existing Grapher Edges.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise9.0.2.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GREdgeEnumerator.[h,m]` to your project.

* Replace what currently exists in `GREdgeEnumerator.h` with the this interface snippet:

``` Objective-C
#import "GREnumerator.h"
#import "GRAbstractGraph.h"

/**
 *  Represents an enumerator that enumerates the edges of a graph.
 */
@interface GREdgeEnumerator : GREnumerator {
    
    /**
     *  The graph.
     */
    id<GRGraphDelegate> _graph;
    
    /**
     *  The from index.
     */
    NSUInteger _headIdx;
    
    /**
     *  The to index.
     */
    NSUInteger _tailIdx;
}

#pragma mark -
#pragma mark Initializing

/**
 *  Designed initializer.
 *  Initializes a newly allocated edge enumerator for the given graph.
 *
 *  @param  graph  The graph the edges of which are to be enumerated.
 *
 *  @return  The new edge enumerator.
 */
- (instancetype)initWithGraph:(id<GRGraphDelegate>)graph;

@end
```

* Next, edit the corresponding `GREdgeEnumerator.m` file and add the following class initializer stub to `GREdgeEnumerator.m`:

``` Objective-C
#pragma mark -
#pragma mark Initializing

/**
 *  Designed initializer.
 *  Initializes a newly allocated edge enumerator for the given graph.
 *
 *  @param  graph  The graph the edges of which are to be enumerated.
 *
 *  @return  The new edge enumerator.
 */
- (instancetype)initWithGraph:(id<GRGraphDelegate>)graph
{
    // Immutable edge enumerator, just return a new reference to itself (retained automatically by ARC).
    self = [super init];
    
    if (self) {
        
        // Initialize all parameters.
        _graph = graph;
        
        for (_headIdx = 0;
             _headIdx < graph.numberOfNodes;
             ++_headIdx) {
            
            for (_tailIdx = _headIdx + 1;
                 _tailIdx < graph.numberOfNodes;
                 ++_tailIdx) {
                
                if ([graph isEdgeFromIndex:_headIdx
                                   toIndex:_tailIdx])
                    goto found;
            }
        }
        
    found:;
    }
    
    // Return this edge enumerator along with its children.
    return self;
}
```

* Last, but not least, override the `GREnumeratorDelegate` protocol methods `-hasMoreObjects` and `nextObject`, using the following stub:

``` Objective-C
#pragma mark -
#pragma mark GREnumeratorDelegate

/**
 *  Returns true if there are more objects to be enumerated.
 *
 *  @return  The boolean result.
 */
- (BOOL)hasMoreObjects
{
    return _headIdx < _graph.numberOfNodes && _tailIdx < _graph.numberOfNodes;
}

/**
 *  Returns the next object to be enumerated.
 *
 *  @return  The next edge.
 */
- (id)nextObject
{
    id result = nil;
    
    if (_headIdx < _graph.numberOfNodes && _tailIdx < _graph.numberOfNodes) {
        
        result = [_graph edgeFromIndex:_headIdx toIndex:_tailIdx];
        
        for (++_tailIdx;
             _tailIdx < _graph.numberOfNodes;
             ++_tailIdx) {
            
            if ([_graph isEdgeFromIndex:_headIdx toIndex:_tailIdx])
                goto found;
        }
        
        for (++_headIdx;
             _headIdx < _graph.numberOfNodes;
             ++_headIdx) {
            
            for (_tailIdx = _headIdx + 1;
                 _tailIdx < _graph.numberOfNodes;
                 ++_tailIdx) {
                
                if ([_graph isEdgeFromIndex:_headIdx toIndex:_tailIdx])
                    goto found;
            }
        }
        
    found:;
    }
    
    return result;
}
```

> That's it! You now have access to a valid EdgeEnumerator data structure for your Grapher app. All that remains is just one final class :)


















> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## What's Next?

**Congratulations!** You are now ready to tackle the final challenges presented in [Day 5: Scene Graphs (Part III)](https://github.com/youldash/iOS/blob/master/Day%205/).


