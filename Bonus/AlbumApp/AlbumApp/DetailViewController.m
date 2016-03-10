//
//  DetailViewController.m
//  AlbumApp
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

#import "DetailViewController.h"
#import "Photo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        Photo *photo = (Photo *)self.detailItem;
        
        NSMutableString *descriptionLabel = [NSMutableString string];
        [descriptionLabel appendFormat:@"Photo number: %d", photo.number];
        [descriptionLabel appendString:@"\n"];
        [descriptionLabel appendFormat:@"Caption: %@", photo.caption];
        [descriptionLabel appendString:@"\n"];
        [descriptionLabel appendFormat:@"Photographer: %@", photo.photographer];
        [descriptionLabel appendString:@"\n"];
        
        self.detailDescriptionLabel.text = descriptionLabel;
        self.detailDescriptionLabel.font = [UIFont boldSystemFontOfSize:24.0];
        self.detailDescriptionLabel.numberOfLines = 3;
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
