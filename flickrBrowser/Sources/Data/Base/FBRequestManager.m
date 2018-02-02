//
//  FBRequestManager.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBRequestManager.h"
#import "FBRequest.h"



@interface FBRequest (Private)

- (void)setTask:(NSURLSessionDataTask *)task;

@end



@interface FBRequestManager ()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfiguration;

@end



@implementation FBRequestManager

static FBRequestManager *g_instance;

+ (FBRequestManager *)sharedInstance
{
    return g_instance;
}

+ (FBRequestManager *)initializeWithBaseURL:(NSURL *)url
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_instance = [[self alloc] initWithBaseURL:url];
    });
    return g_instance;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        _baseURL = url;
        _headers = [NSMutableDictionary new];
        [self initiliazeNetwork];
    }
    return self;
}

- (void)initiliazeNetwork
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.sessionConfiguration = configuration;
    self.session = [NSURLSession sessionWithConfiguration:self.sessionConfiguration];
}

- (NSURLRequest *)composeRequest:(FBRequest *)request
{
    NSString *string = self.baseURL.absoluteString;
    string = [string stringByAppendingString:request.URLString];
    NSURL *fullUrl = [NSURL URLWithString:string];
    NSMutableURLRequest *result = [[NSMutableURLRequest alloc] initWithURL:fullUrl];
    result.HTTPMethod = request.HTTPmethod;
//    compose http body
//    if ([request.HTTPmethod isEqualToString:kFBRequestMethodPOST]) {
//
//    }
    return result;
}

- (void)fetchRequest:(FBRequest *)request withProgress:(void (^)(NSProgress *))progress handler:(void(^)(id response, id error))handler
{
    NSURLSessionDataTask *result = nil;
    
    void (^errorHandler)(NSURLResponse *response, NSError *error) = ^
    (NSURLResponse *response, NSError *error)
    {
        NSInteger statusCode = 0;
        if ([response isKindOfClass:[NSHTTPURLResponse class]])
        {
            NSHTTPURLResponse *httpresponse = (NSHTTPURLResponse *)response;
            statusCode = httpresponse.statusCode;
        }
        
        id resultError = [request handleError:error statusCode:statusCode];
        PERFORM_BLOCK_IF_NOT_NIL(handler, nil, resultError);
    };
    
    NSString *method = request.HTTPmethod;
    if ([method isEqualToString:kFBRequestMethodGET])
    {
        NSURLRequest *urlRequest = [self composeRequest:request];
        result = [self.session dataTaskWithRequest:urlRequest
                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
        {
            if (error != nil) {
                PERFORM_BLOCK_IF_NOT_NIL(errorHandler, response, error);
                return;
            }
            
            
            id responseObject = [request handleSuccessResponce:response data:data];
            PERFORM_BLOCK_IF_NOT_NIL(handler, responseObject, nil);
        }];
        
//        result = [self.sessionManager GET:request.URLString
//                               parameters:request.parameters
//                                 progress:progress
//                                  success:^(NSURLSessionDataTask *task, id responseDict)
//                  {
//                      id responseObject = [request handleSuccessResponce:responseDict];
//                      PERFORM_BLOCK_IF_NOT_NIL(handler, responseObject, nil);
//                  }
//                                  failure:errorHandler];
    }
    [result resume];
    [request setTask:result];
}

@end
