//
//  FBPhotosViewControllerModel.h
//  flickrBrowser
//
//  Created by Katekov Anton on 2/3/18.
//  Copyright © 2018 katekovanton. All rights reserved.
//

#import <Foundation/Foundation.h>



@class FBPhoto;



@interface FBPhotosViewControllerModel : NSObject {
    NSMutableArray *_Nonnull _photos;
}

- (void)reload;
- (NSMutableArray<__kindof NSIndexPath *> *_Nullable)photosLoaded:(NSArray<__kindof FBPhoto*> *_Nullable)photos;

- (NSInteger)numberOfPhotos;
- (FBPhoto *_Nonnull)photoAtIndex:(NSInteger)index;

@end
