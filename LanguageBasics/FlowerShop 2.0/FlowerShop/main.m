//
//  main.m
//  FlowerShop
//
//  Created by Mustafa Youldash on 13/03/2016.
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

#import "Flower.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        Flower *flower = [Flower new];
        
        NSLog(@"Flower:");
        NSLog(@"Name: %@", [flower name]);
        NSLog(@"Number: %ld", [flower number]);
        NSLog(@"Price: %.2f", [[flower price] doubleValue]);
        NSLog(@"Image: %@", [flower image]);

        NSMutableArray *arrayOfFlowers = [[NSMutableArray alloc] init];
        [arrayOfFlowers addObject:flower];
        
        NSLog(@"%@", [[arrayOfFlowers objectAtIndex:0] description]);
        
        NSLog(@"Using a normal for-loop...");
        for (NSUInteger i = 0; i < [arrayOfFlowers count]; i++) {
            
            Flower *_flower = [arrayOfFlowers objectAtIndex:i];
            
            NSLog(@"%lu Name: %@", i, [_flower name]);
            NSLog(@"%lu Number: %ld", i, [_flower number]);
            NSLog(@"%lu Price: %.2f", i, [[_flower price] doubleValue]);
            NSLog(@"%lu Image: %@", i, [_flower image]);
        }
        
        NSLog(@"Using fast enumeration...");
        NSInteger i = 0;
        for (Flower *_flower in arrayOfFlowers) {
            
            NSLog(@"%lu Name: %@", i, [_flower name]);
            NSLog(@"%lu Number: %ld", i, [_flower number]);
            NSLog(@"%lu Price: %.2f", i, [[_flower price] doubleValue]);
            NSLog(@"%lu Image: %@", i, [_flower image]);
            
            i++;
        }
        
        [arrayOfFlowers removeAllObjects];
    }
    
    return 0;
}
