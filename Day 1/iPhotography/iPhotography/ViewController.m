//
//  ViewController.m
//  iPhotography
//
//  Created by Mustafa Youldash on 24/02/2016.
//  Copyright © 2016 Umm Al-Qura University. All rights reserved.
//

#import "ViewController.h"
#import "PhotoAlbum.h"
#import "Photo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Reveals PhotoAlbum info within a window (popup).
 *
 *  @param sender A sender.
 */
- (IBAction)showPhotoAlbumInfo:(id)sender
{
    // Establish a new PhotoAlbum object.
    PhotoAlbum *album = [[PhotoAlbum alloc] init];

    // Establish a new Photo object.
    Photo *photo = [Photo new];
    photo.caption = @"A snapshot of foo";
    photo.photographer = @"Ahmed";
 
    // Inserts the photo into the PhotoAlbum's lcaol array.
    [album insertsPhoto:photo];
    
    // Establish an AlertController message string.
    NSMutableString *message = [NSMutableString stringWithFormat:@"%@, brought to you by %@",
     photo.caption,
     photo.photographer];

    // Log the currently saved PhotoAlbum data (for debugging purposes).
    NSLog(@"%@", album.description);
    
    // Present the PhotoAlbum info in an AlertController instance.
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
}

@end
