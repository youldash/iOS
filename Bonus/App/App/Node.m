//
//  Node.m
//  Graphs
//
//  Created by Mustafa Youldash on 8/03/2016.
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

#import "Node.h"

@implementation Node

/**
 *  A color (using the RGB coloring system).
 */
@synthesize color;

/**
 *  An identifier.
 */
@synthesize name = _name;

/**
 *  A weight on this graphic.
 */
@synthesize weight = _weight;

/**
 *  The number of this node.
 */
@synthesize number = _number;

/**
 *  The (x, y) coordinates of this node.
 */
@synthesize coordinates = _coordinates;

/**
 *  Creates a new node instance.
 */
+ (instancetype)node
{
    return [[Node alloc] init];
}

/**
 *  Creates a new node instance with a given name.
 */
+ (instancetype)nodeWithName:(NSString *)name
{
    return [[Node alloc] initWithName:name];
}

/**
 *  Creates a new node instance with the following parameters:
 *  - name
 *  - weight
 */
+ (instancetype)nodeWithName:(NSString *)name weight:(NSNumber *)weight
{
    return [[Node alloc] initWithName:name weight:weight];
}

/**
 *  Creates a new node instance with a given weight.
 */
+ (instancetype)nodeWithWeight:(NSNumber *)weight
{
    return [[Node alloc] initWithWeight:weight];
}

/**
 *  Creates a new node instance with a given number.
 */
+ (instancetype)nodeWithNumber:(int)number
{
    return [[Node alloc] initWithNumber:number];
}

/**
 *  Creates a new node instance with a given point coordinates.
 */
+ (instancetype)nodeWithCoordinates:(CGPoint)coordinates
{
    return [[Node alloc] initWithCoordinates:coordinates];
}

/**
 *  Creates a new node instance with the following parameters:
 *  - name
 *  - weight
 *  - number
 *  - coordinates (x, y)
 */
+ (instancetype)nodeWithName:(NSString *)name
                      weight:(NSNumber *)weight
                      number:(int)number
                 coordinates:(CGPoint)coordinates
{
    // OPTION (A):
    
//    Node *node = [[Node alloc] init];
//    
//    node.name = name;
//    node.weight = weight;
//    node.number = number;
//    node.coordinates = coordinates;
//    
//    return node;
    
    // OPTION (B):

    return [[Node alloc] initWithName:name
                               weight:weight
                               number:number
                          coordinates:coordinates];
}

/**
 *  OPTIONAL
 *  Initializes a newly allocated node.
 */
- (instancetype)init
{
    return [self initWithName:@"Foo"
                       weight:[NSNumber numberWithDouble:0.0]
                       number:0
                  coordinates:CGPointMake(0.0f, 0.0f)]; // Or use: CGPointZero
}

/**
 *  Initializes a newly allocated node with a given name.
 */
- (instancetype)initWithName:(NSString *)name
{
    return [self initWithName:name
                       weight:[NSNumber numberWithDouble:0.0]
                       number:0
                  coordinates:CGPointZero];
}

/**
 *  Initializes a newly allocated node instance with the following parameters:
 *  - name
 *  - weight
 */
- (instancetype)initWithName:(NSString *)name weight:(NSNumber *)weight
{
    return [self initWithName:name
                       weight:weight
                       number:0
                  coordinates:CGPointZero];
}

/**
 *  Initializes a newly allocated node instance with a given weight.
 */
- (instancetype)initWithWeight:(NSNumber *)weight
{
    return [self initWithName:@"Foo"
                       weight:weight
                       number:0
                  coordinates:CGPointZero];
}

/**
 *  Initializes a newly allocated node instance with a given number.
 */
- (instancetype)initWithNumber:(int)number
{
    return [self initWithName:@"Foo"
                       weight:[NSNumber numberWithDouble:0.0]
                       number:number
                  coordinates:CGPointZero];
}

/**
 *  Initializes a new node instance with a given point coordinates.
 */
- (instancetype)initWithCoordinates:(CGPoint)coordinates
{
    return [self initWithName:@"Foo"
                       weight:[NSNumber numberWithDouble:0.0]
                       number:0
                  coordinates:CGPointZero];
}

/**
 *  Initializes a newly allocated node instance with the following parameters:
 *  - name
 *  - weight
 *  - number
 *  - coordinates (x, y)
 */
- (instancetype)initWithName:(NSString *)name
                      weight:(NSNumber *)weight
                      number:(int)number
                 coordinates:(CGPoint)coordinates
{
    self = [super init];
    
    if (self) {
        
        self.name = name;
        self.weight = weight;
        self.number = number;
        self.coordinates = coordinates;
    }
    
    return self;
}

/**
 *  Centers this node's position (i.e. x = 0.0f and y = 0.0f).
 */
- (void)center
{
    self.coordinates = CGPointMake(0.0f, 0.0f);;
}

@end
