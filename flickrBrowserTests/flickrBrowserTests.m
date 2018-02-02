//
//  flickrBrowserTests.m
//  flickrBrowserTests
//
//  Created by Katekov Anton on 2/3/18.
//  Copyright © 2018 katekovanton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FBPhoto.h"
#import "FBPhotoSearchPage.h"
#import "FBPhotosViewControllerModel.h"
#import "FBRequest.h"

@interface flickrBrowserTests : XCTestCase {
    
    NSData *_testData;
    FBPhotosViewControllerModel *_model;
}

@end



@implementation flickrBrowserTests

- (void)setUp
{
    [super setUp];
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    _testData = [NSData dataWithContentsOfFile:[bundle pathForResource:@"TestResponse" ofType:@"txt"]];
    _model = [FBPhotosViewControllerModel new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPhotosReceived
{
    FBRequest *request = [FBRequest new];
    request.responseMapping = [FBPhotoSearchPage objectMapping];
    
    FBPhotoSearchPage *result = [request handleSuccessResponce:nil data:_testData];
    XCTAssertNotNil(result);
    XCTAssertNotNil(result.photos);
    XCTAssert([result.stat isEqualToString:@"ok"]);
    XCTAssert(result.photos.photo.count == 100);
    
    NSArray *itemsToAdd = [_model photosLoaded:result.photos.photo];
    XCTAssertNotNil(itemsToAdd);
    XCTAssert(itemsToAdd.count == 100);
    XCTAssert([_model numberOfPhotos] == 100);
}

- (void)testPerformanceExample
{
    FBRequest *request = [FBRequest new];
    request.responseMapping = [FBPhotoSearchPage objectMapping];
    
    [self measureBlock:^{
        [request handleSuccessResponce:nil data:_testData];
    }];
}

@end
