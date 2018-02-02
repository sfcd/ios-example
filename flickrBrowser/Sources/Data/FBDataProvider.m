//
//  FBDataProvider.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBDataProvider.h"
#import "FBRequestManager.h"
#import "FBPhotosController.h"



@implementation FBDataProvider

+ (FBDataProvider *)sharedInstance
{
    static FBDataProvider *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [FBDataProvider new];
        }
    }
    return sharedInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        [FBRequestManager initializeWithBaseURL:[NSURL URLWithString:@"https://api.flickr.com/services/rest/"]];
        _photosController = [FBPhotosController new];
    }
    return self;
}

@end
