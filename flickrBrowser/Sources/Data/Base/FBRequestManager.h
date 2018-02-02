//
//  FBRequestManager.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBUtil.h"



@class FBRequest;



@interface FBRequestManager : NSObject

@property (nonatomic, copy) NSMutableDictionary *headers;

+ (FBRequestManager *)sharedInstance;
+ (FBRequestManager *)initializeWithBaseURL:(NSURL *)url;

- (void)fetchRequest:(FBRequest *)request withProgress:(void (^)(NSProgress *))progress handler:(void(^)(id response, id error))handler;

@end
