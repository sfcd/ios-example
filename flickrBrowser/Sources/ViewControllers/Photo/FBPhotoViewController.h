//
//  FBPhotoViewController.h
//  flickrBrowser
//
//  Created by Katekov Anton on 2/3/18.
//  Copyright © 2018 katekovanton. All rights reserved.
//

#import <UIKit/UIKit.h>



@class FBPhoto;



@interface FBPhotoViewController : UIViewController {
    IBOutlet UIImageView *_image;
}

@property (nonatomic, nullable) FBPhoto *photo;

@end
