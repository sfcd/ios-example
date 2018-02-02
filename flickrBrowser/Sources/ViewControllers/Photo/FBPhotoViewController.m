//
//  FBPhotoViewController.m
//  flickrBrowser
//
//  Created by Katekov Anton on 2/3/18.
//  Copyright © 2018 katekovanton. All rights reserved.
//

#import "FBPhotoViewController.h"
#import "UIKit+AFNetworking.h"
#import "FBPhoto.h"



@implementation FBPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.photo.title;
    [_image setImageWithURL:[self.photo completeUrl]];
}

@end
