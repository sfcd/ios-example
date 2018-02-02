//
//  ViewController.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "ViewController.h"
#import "FBAssembly.h"



@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[FBAssembly sharedInstance] setupWithRootViewController:self];
}

- (void)didReceiveMemoryWarning {
    [[FBAssembly sharedInstance] receivedMemoryWarning];
}

@end
