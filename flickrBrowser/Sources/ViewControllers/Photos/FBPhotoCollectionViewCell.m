//
//  FBPhotoCollectionViewCell.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBPhotoCollectionViewCell.h"
#import "FBPhoto.h"
#import "UIKit+AFNetworking.h"



@implementation FBPhotoCollectionViewCell

- (void)setPhoto:(FBPhoto *)photo
{
    _photo = photo;
    [_image setImageWithURL:[photo completeUrl]];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [_image cancelImageDownloadTask];
    _image.image = nil;
}

@end
