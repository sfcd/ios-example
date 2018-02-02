//
//  FBAssembly.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBAssembly.h"
#import "FBDataProvider.h"
#import "FBPhotosController.h"
#import "FBPhotosViewController.h"
#import "FBPhotoViewController.h"
#import "UIKit+AFNetworking.h"



@interface FBAssembly ()

@property (nonatomic) UIViewController *rootViewController;
@property (nonatomic) UINavigationController *rootNavigationController;

@end



@implementation FBAssembly

+ (FBAssembly *)sharedInstance
{
    static FBAssembly *sharedFBAssembly = nil;
    @synchronized (self) {
        if (sharedFBAssembly == nil) {
            sharedFBAssembly = [FBAssembly new];
        }
    }
    return sharedFBAssembly;
}

- (void)setupWithRootViewController:(UIViewController *)rootViewController
{
    _rootViewController = rootViewController;
    [self setupApplication];
}

- (void)setupApplication
{
    FBPhotosViewController *photosScreen = [FBPhotosViewController new];
    self.rootNavigationController = [[UINavigationController alloc] initWithRootViewController:photosScreen];
    [self.rootViewController presentViewController:self.rootNavigationController animated:NO completion:nil];
    
    WEAK(photosScreen);
    photosScreen.handlerOnScrollToBottom = ^(FBPhotosViewController *sender)
    {
        [[FBDataProvider sharedInstance].photosController loadTailWithHandler:^(NSArray<__kindof FBPhoto *> *photos, NSError *error)
         {
             [photosScreen_weak_ handleOnPhotosLoaded:photos error:error];
         }];
    };
    
    photosScreen.handlerOnPhotoTap = ^(FBPhotosViewController *sender, FBPhoto *photo)
    {
        FBPhotoViewController *vc = [FBPhotoViewController new];
        vc.photo = photo;
        [sender.navigationController pushViewController:vc animated:YES];
    };
    
}

- (void)receivedMemoryWarning
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    AFImageDownloader *imageDownloader = [AFImageDownloader defaultInstance];
    NSURLCache *urlCache = imageDownloader.sessionManager.session.configuration.URLCache;
    [urlCache removeAllCachedResponses];
    
    [imageDownloader.imageCache removeAllImages];
}

@end
