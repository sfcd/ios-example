//
//  FBPhotosViewControllerModel.m
//  flickrBrowser
//
//  Created by Katekov Anton on 2/3/18.
//  Copyright © 2018 katekovanton. All rights reserved.
//

#import "FBPhotosViewControllerModel.h"
#import <UIKit/UIKit.h>



@implementation FBPhotosViewControllerModel

- (instancetype)init
{
    if (self = [super init]) {
        _photos = [NSMutableArray new];
    }
    return self;
}

- (void)reload
{
    _photos = [NSMutableArray new];
}

- (NSMutableArray<__kindof NSIndexPath *> *_Nullable)photosLoaded:(NSArray<__kindof FBPhoto*> *_Nullable)photos
{
    NSUInteger startIndex = _photos.count;
    NSUInteger count = photos.count;
    [_photos addObjectsFromArray:photos];
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (NSUInteger i = 0; i < count; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:startIndex + i inSection:0]];
    }
    return indexPaths;
}

- (NSInteger)numberOfPhotos
{
    return _photos.count;
}

- (FBPhoto *_Nonnull)photoAtIndex:(NSInteger)index
{
    return _photos[index];
}

@end
