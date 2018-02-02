//
//  FBPhoto.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBObject.h"



@interface FBPhoto : FBObject

@property (nonatomic, copy) NSString *id; //primary key
@property (nonatomic, copy) NSString *owner;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *server;
@property (nonatomic) NSNumber *farm;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) NSNumber *ispublic;
@property (nonatomic) NSNumber *isfriend;
@property (nonatomic) NSNumber *isfamily;

- (NSURL *)completeUrl;

@end
