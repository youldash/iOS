//
//  Node.h
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

#import <Foundation/Foundation.h>

/**
 *  Represents a position structure.
 */
typedef struct {
    
    float x;
    float y;
    
} MYPoint;

/**
 *  Utility function.
 *  Returns a new "centered" MYPoint structure.
 */
static inline MYPoint MYPointMake(float x, float y)
{
    MYPoint point;
    point.x = 0.0f;
    point.y = 0.0f;
    
    return point;
}

/**
 *  A node class.
 */
@interface Node : NSObject

/**
 *  An identifier.
 */
@property NSString *name;

/**
 *  A weight on this graphic.
 */
@property NSNumber *weight;

/**
 *  The number of this node.
 */
@property int number;

/**
 *  The (x, y) coordinates of this node.
 */
@property MYPoint coordinates;

/**
 *  Creates a new node instance.
 */
+ (instancetype)node;

/**
 *  Creates a new node instance with a given name.
 */
+ (instancetype)nodeWithName:(NSString *)name;

/**
 *  Creates a new node instance with the following parameters:
 *  - name
 *  - weight
 */
+ (instancetype)nodeWithName:(NSString *)name weight:(NSNumber *)weight;

/**
 *  Creates a new node instance with a given weight.
 */
+ (instancetype)nodeWithWeight:(NSNumber *)weight;

/**
 *  Creates a new node instance with a given number.
 */
+ (instancetype)nodeWithNumber:(int)number;

/**
 *  Creates a new node instance with a given point coordinates.
 */
+ (instancetype)nodeWithCoordinates:(MYPoint)coordinates;

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
                 coordinates:(MYPoint)coordinates;

/**
 *  OPTIONAL
 *  Initializes a newly allocated node.
 */
- (instancetype)init;

/**
 *  Initializes a newly allocated node with a given name.
 */
- (instancetype)initWithName:(NSString *)name;

/**
 *  Initializes a newly allocated node instance with the following parameters:
 *  - name
 *  - weight
 */
- (instancetype)initWithName:(NSString *)name weight:(NSNumber *)weight;

/**
 *  Initializes a newly allocated node instance with a given weight.
 */
- (instancetype)initWithWeight:(NSNumber *)weight;

/**
 *  Initializes a newly allocated node instance with a given number.
 */
- (instancetype)initWithNumber:(int)number;

/**
 *  Initializes a new node instance with a given point coordinates.
 */
- (instancetype)initWithCoordinates:(MYPoint)coordinates;

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
                 coordinates:(MYPoint)coordinates;

/**
 *  Centers this node's position (i.e. x = 0.0f and y = 0.0f).
 */
- (void)center;

@end
