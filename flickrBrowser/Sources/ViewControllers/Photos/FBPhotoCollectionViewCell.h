//
//  FBPhotoCollectionViewCell.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import <UIKit/UIKit.h>



@class FBPhoto;



@interface FBPhotoCollectionViewCell : UICollectionViewCell {
    IBOutlet UIImageView *_image;
}

@property (nonatomic) FBPhoto *photo;

@end
