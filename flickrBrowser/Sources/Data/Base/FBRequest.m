//
//  FBRequest.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBRequest.h"
#import "FBRequestManager.h"



NSString * const kFBRequestMethodGET       = @"GET";




@implementation FBRequest

- (instancetype)init
{
    if (self = [super init]) {
        self.HTTPmethod = kFBRequestMethodGET;
    }
    return self;
}

- (void)setTask:(NSURLSessionDataTask *)task
{
    if (_task != nil && _task.state == NSURLSessionTaskStateRunning) {
        [_task cancel];
    }
    _task = task;
}

- (id)handleError:(NSError*)error statusCode:(NSInteger)statusCode
{
    //do something
    return error;
}

- (id)handleSuccessResponce:(NSURLResponse * _Nullable)response data:(NSData * _Nullable)data
{
    return [self performMappingForResponce:response data:data];
}

- (id)performMappingForResponce:(NSURLResponse * _Nullable)response data:(NSData * _Nullable)data
{
    if (data != nil)
    {
        NSError *error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error != nil || object == nil) {
            return nil;
        }
        if (self.responseMapping != nil)
        {
            id result = [EKMapper objectFromExternalRepresentation:object withMapping:self.responseMapping];
            return result;
        }
        return object;
    }
    
    return nil;
}

- (void)fetchWithProgress:(void (^)(NSProgress *))progress handler:(void(^)(id response, id error))handler
{
    [[FBRequestManager sharedInstance] fetchRequest:self withProgress:progress handler:handler];
}

- (void)dealloc
{
    [_task cancel];
}

@end
