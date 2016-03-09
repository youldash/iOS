//
//  main.m
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

#import "Node.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        Node *node = [Node nodeWithName:@"A new node" weight:@10.0 number:0 coordinates:MYPointMake(5.0f, -1.0f)];
        
        // Play with the color.
        node.color = [NSColor redColor];
        
        NSLog(@"Node name: %@", [node name]);
        
        NSLog(@"Node coordinates: (%f, %f)", node.coordinates.x, node.coordinates.y);
        
        [node center];
        
        NSLog(@"Node coordinates: (%f, %f)", node.coordinates.x, node.coordinates.y);
        
        NSMutableArray *arrayOfNodes = [NSMutableArray array];
        
        [arrayOfNodes addObject:node];
        
        NSLog(@"Node name: %@", [[arrayOfNodes objectAtIndex:0] name]);
        NSLog(@"Node weight: %@", [[arrayOfNodes objectAtIndex:0] weight]);
        
        NSLog(@"Using a normal for-loop...");
        for (NSInteger i = 0; i < [arrayOfNodes count]; i++) {
            
            NSLog(@"%lu Node name: %@", i, [[arrayOfNodes objectAtIndex:i] name]);
        }
        
        NSLog(@"Using fast enumeration...");
        NSInteger i = 0;
        for (Node *node in arrayOfNodes) {
            
            NSLog(@"%lu Node name: %@", i, node.name);
            
            i++;
        }
    }
    
    return 0;
}
