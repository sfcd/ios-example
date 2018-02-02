//
//  FBPhotosViewController.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBUtil.h"



@class FBPhoto;



@interface FBPhotosViewController : UIViewController {
    IBOutlet UICollectionView *_collection;
}

@property (nonatomic, copy) void (^handlerOnScrollToBottom)(FBPhotosViewController *sender);
@property (nonatomic, copy) void (^handlerOnPhotoTap)(FBPhotosViewController *sender, FBPhoto *photo);

- (void)handleOnPhotosLoaded:(NSArray *)photos error:(NSError *)error;

@end
