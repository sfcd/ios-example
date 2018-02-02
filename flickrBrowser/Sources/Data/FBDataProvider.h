//
//  FBDataProvider.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import <Foundation/Foundation.h>



@class FBPhotosController;



@interface FBDataProvider : NSObject

@property (nonatomic, readonly) FBPhotosController *photosController;

+ (FBDataProvider *)sharedInstance;

@end
