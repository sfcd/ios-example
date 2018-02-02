//
//  FBPhotoSearchPage.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBObject.h"



@class FBPhoto;



@interface FBPhotoSearchPageContent : FBObject

@property (nonatomic, copy) NSNumber *page;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSNumber *perpage;
@property (nonatomic, copy) NSNumber *total;
@property (nonatomic, copy) NSArray<__kindof FBPhoto *> *photo;

@end



@interface FBPhotoSearchPage : FBObject

@property (nonatomic, copy) NSString *stat;
@property (nonatomic) FBPhotoSearchPageContent* photos;

@end
