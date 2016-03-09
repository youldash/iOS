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
#import <UIKit/UIKit.h>

/**
 *  A node class.
 */
@interface Node : NSObject {
    
@private
    UIColor *color;
}

/**
 *  A color (using the RGB coloring system).
 */
@property (retain) UIColor *color;

/**
 *  An identifier.
 */
@property (copy) NSString *name;

/**
 *  A weight on this graphic.
 */
@property (retain) NSNumber *weight;

/**
 *  The number of this node.
 */
@property (readwrite) int number;

/**
 *  The (x, y) coordinates of this node.
 */
@property (assign) CGPoint coordinates;

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
+ (instancetype)nodeWithCoordinates:(CGPoint)coordinates;

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
                 coordinates:(CGPoint)coordinates;

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
- (instancetype)initWithCoordinates:(CGPoint)coordinates;

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
                 coordinates:(CGPoint)coordinates;

/**
 *  Centers this node's position (i.e. x = 0.0f and y = 0.0f).
 */
- (void)center;

@end
