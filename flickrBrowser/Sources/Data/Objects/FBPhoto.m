//
//  FBPhoto.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBPhoto.h"



@implementation FBPhoto

+ (EKObjectMapping *)objectMapping
{
    EKObjectMapping *result = [super objectMapping];
    
    [result mapPropertiesFromArray:@[@"id",
                                     @"owner",
                                     @"secret",
                                     @"server",
                                     @"farm",
                                     @"title",
                                     @"ispublic",
                                     @"isfriend",
                                     @"isfamily"
                                     ]];
    
    return result;
}

- (NSURL *)completeUrl
{
    NSString *pattern = @"http://farm%@.static.flickr.com/%@/%@_%@.jpg";
    pattern = [NSString stringWithFormat:pattern, self.farm.description, self.server, self.id, self.secret];
    return [NSURL URLWithString:pattern];
}

@end
