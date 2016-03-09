//
//  main.m
//  Example
//
//  Created by Mustafa Youldash on 9/03/2016.
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

#import "Rectangle.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        Rectangle *rect = [[Rectangle alloc] initWithW:20.0];
        
        rect.w = 0.0;
        
        NSLog(@"rect.w = %f\n", rect.w);
    }
    
    return 0;
}
