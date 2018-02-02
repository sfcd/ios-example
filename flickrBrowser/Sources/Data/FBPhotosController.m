//
//  FBPhotosController.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBPhotosController.h"
#import "FBRequest.h"
#import "FBPhotoSearchPage.h"



@implementation FBPhotosController

- (instancetype)init
{
    if (self = [super init]) {
        _photos = [NSMutableArray new];
    }
    return self;
}

- (NSUInteger)photosCount
{
    return _photos.count;
}

- (FBPhoto *)photoAtIndex:(NSUInteger)index
{
    return _photos[index];
}

- (void)loadTailWithHandler:(void(^)(NSArray<__kindof FBPhoto *> *photos, NSError *error))handler
{
    if (_request != nil) {
        // or store the handler and call it later
        return;
    }
    
    NSInteger perPage = 100;
    NSInteger nextPage = _photos.count / perPage + 1;
    
    NSURLComponents *components = [NSURLComponents componentsWithString:@""];
    NSURLQueryItem *method = [NSURLQueryItem queryItemWithName:@"method" value:@"flickr.photos.search"];
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:@"3e7cc266ae2b0e0d78e279ce8e361736"];
    NSURLQueryItem *format = [NSURLQueryItem queryItemWithName:@"format" value:@"json"];
    NSURLQueryItem *nojsoncallback = [NSURLQueryItem queryItemWithName:@"nojsoncallback" value:@"1"];
    NSURLQueryItem *text = [NSURLQueryItem queryItemWithName:@"text" value:@"kittens"];
    NSURLQueryItem *page = [NSURLQueryItem queryItemWithName:@"page" value:@(nextPage).description];
    components.queryItems = @[method, apiKey, format, nojsoncallback, text, page];
    NSString *urlString = components.URL.absoluteString;
    
    WEAK(self);
    _request = [FBRequest new];
    _request.URLString = urlString;
    _request.HTTPmethod = kFBRequestMethodGET;
    _request.responseMapping = [FBPhotoSearchPage objectMapping];
    [_request fetchWithProgress:^(NSProgress *progress)
     {
         
     }
                   handler:^(FBPhotoSearchPage *response, id error)
     {
         [self_weak_ onPageLoaded:response];
         PERFORM_BLOCK_IF_NOT_NIL(handler, response.photos.photo, error);
     }];
     
}

- (void)onPageLoaded:(FBPhotoSearchPage *)page
{
    _request = nil;
    if (page == nil || ![page.stat isEqualToString:@"ok"]) {
        return;
    }
    _total = page.photos.total.integerValue;
    [_photos addObjectsFromArray:page.photos.photo];
}

@end
