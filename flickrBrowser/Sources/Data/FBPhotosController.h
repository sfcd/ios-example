//
//  FBPhotosController.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBUtil.h"



@class FBPhoto;
@class FBRequest;



@interface FBPhotosController : NSObject {
    NSMutableArray<__kindof FBPhoto *> *_photos;
    
    NSUInteger _total;
    FBRequest *_request;
}

- (NSUInteger)photosCount;
- (FBPhoto *)photoAtIndex:(NSUInteger)index;

- (void)loadTailWithHandler:(void(^)(NSArray<__kindof FBPhoto *> *photos, NSError *error))handler;

@end
