//
//  FBRequest.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping/EasyMapping.h>
#import "EasyMapping.h"



extern NSString *_Nonnull const kFBRequestMethodGET;



@interface FBRequest : NSObject

@property (nonatomic, readonly, nullable) NSURLSessionDataTask *task;
@property (nonatomic, nullable) EKObjectMapping *responseMapping;
@property (nonatomic, copy, nonnull) NSString *HTTPmethod;
@property (nonatomic, copy, nonnull) NSString *URLString;
@property (nonatomic, copy, nullable) id parameters;

- (id _Nullable)handleError:(NSError* _Nullable)error statusCode:(NSInteger)statusCode;
- (id _Nullable)handleSuccessResponce:(NSURLResponse * _Nullable)response data:(NSData * _Nullable)data;
- (id _Nullable)performMappingForResponce:(NSURLResponse * _Nullable)response data:(NSData * _Nullable)data;

- (void)fetchWithProgress:(void (^_Nullable)(NSProgress *_Nullable))progress handler:(void(^_Nullable)(id _Nullable response, id _Nullable error))handler;

@end
