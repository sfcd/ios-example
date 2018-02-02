//
//  FBPhotoSearchPage.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBPhotoSearchPage.h"
#import "FBPhoto.h"



@implementation FBPhotoSearchPageContent

+ (EKObjectMapping *)objectMapping
{
    EKObjectMapping *result = [super objectMapping];
    [result mapKeyPath:@"page" toProperty:@"page"];
    [result mapKeyPath:@"pages" toProperty:@"pages"];
    [result mapKeyPath:@"perpage" toProperty:@"perpage"];
    [result mapKeyPath:@"total" toProperty:@"total"];
    [result hasMany:[FBPhoto class] forKeyPath:@"photo"];
    return result;
}

@end



@implementation FBPhotoSearchPage

+ (EKObjectMapping *)objectMapping
{
    EKObjectMapping *result = [super objectMapping];
    [result mapKeyPath:@"stat" toProperty:@"stat"];
    [result hasOne:[FBPhotoSearchPageContent class] forKeyPath:@"photos"];
    return result;
}

@end
