//
//  ViewController.m
//  App
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

#import "ViewController.h"
#import "Node.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickMe:(id)sender {
    
    Node *node = [Node node];
    
    NSMutableString * message = [NSMutableString string];
    [message appendFormat:@"%@ <", node.name];
    [message appendFormat:@"Number[%d], ", node.number];
    [message appendFormat:@"Weight[%@], ", node.weight];
    [message appendFormat:@"at %@", NSStringFromCGPoint(node.coordinates)];
    [message appendString:@">"];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    
    // Present Node info in an AlertController instance.
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:@"Alert!"
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    // Establish a "Dismiss" AlertAction object.
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss"
                                                            style:UIAlertActionStyleDefault
                                                          handler:NULL];
    
    // Add the AlertAction object to the AlertController object.
    [alertController addAction:dismissAction];
    
    // Present it.
    [self presentViewController:alertController animated:YES completion:NULL];
    
#else
    
    // Present Node info in an AlertView instance.
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil];
    
    // Present it.
    [alertView show];
    
#endif

}

@end
