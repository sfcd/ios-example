//
//  FBAssembly.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FBAssembly : NSObject

+ (FBAssembly *)sharedInstance;

- (void)setupWithRootViewController:(UIViewController *)rootViewController;
- (void)receivedMemoryWarning;

@end
