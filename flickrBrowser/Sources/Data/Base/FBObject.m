//
//  FBObject.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBObject.h"



@implementation FBObject

+ (EKObjectMapping *)objectMapping
{
    EKObjectMapping *mapping = [[EKObjectMapping alloc] initWithObjectClass:self];
    return mapping;
}

@end
