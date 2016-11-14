//
//  RDXNetworkManager.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/23.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXNetworkManager.h"
#import <AFNetworking.h>
#import "RDXURLConst.h"

@interface RDXNetworkManager ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation RDXNetworkManager

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURL *baseURL = [NSURL URLWithString:RDXHTTPSBaseURL];
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    }
    return self;
}

+ (instancetype)sharedManager {
    static RDXNetworkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RDXNetworkManager alloc] init];
    });
    return manager;
}

#pragma mark - GET

- (void)getRequestWithURLString:(NSString *)URLString
                     parameters:(NSDictionary *)params
              completionHandler:(RDXResponseHandler)handler {
    [_manager GET:URLString
       parameters:params
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              handler(responseObject, nil);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              handler(nil, error);
          }];
}

- (void)getTopicListWithFixedURLString:(NSString *)URLString
                     completionHandler:(RDXResponseHandler)handler {
    [self getRequestWithURLString:URLString
                       parameters:nil
                completionHandler:handler];
}
- (void)getLatestTopicListWithCompletionHandler:(RDXResponseHandler)handler {
    [self getTopicListWithFixedURLString:RDXLatestTopicsURL
                       completionHandler:handler];
}
- (void)getHotTopicListWihCompletionHandler:(RDXResponseHandler)handler {
    [self getTopicListWithFixedURLString:RDXHotTopicsURL
                       completionHandler:handler];
}

- (void)getTopicListWithParameters:(NSDictionary *)params
                 completionHandler:(RDXResponseHandler)handler {
    RDXLog(@"%@", params);
    [self getRequestWithURLString:RDXTopicListURL
                       parameters:params
                completionHandler:handler];
//    [self.manager GET:RDXTopicListURL
//           parameters:params
//             progress:nil
//              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                  handler(responseObject, nil);
//              }
//              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                  handler(nil, error);
//              }];
}
- (void)getTopicDetailWithTopicID:(NSString *)topicID
                completionHandler:(RDXResponseHandler)handler {
    NSDictionary *param = @{ @"id": topicID };
    [self getTopicListWithParameters:param completionHandler:handler];
}

- (void)getTopicListWithNodeID:(NSString *)nodeID
                          page:(NSInteger)page
             completionHandler:(RDXResponseHandler)handler {
    NSDictionary *params = @{ @"node_id": nodeID, @"p": @(page) };
    [self getTopicListWithParameters:params completionHandler:handler];
}
- (void)getTopicListWithNodeName:(NSString *)nodeName
                            page:(NSInteger)page
               completionHandler:(RDXResponseHandler)handler {
    NSDictionary *params = @{ @"node_name": nodeName, @"p": @(page) };
    [self getTopicListWithParameters:params completionHandler:handler];
}
- (void)getTopicListWithUserName:(NSString *)username
                            page:(NSInteger)page
               completionHandler:(RDXResponseHandler)handler {
    NSDictionary *params = @{ @"username": username, @"p": @(page) };
    [self getTopicListWithParameters:params completionHandler:handler];
}

- (void)getReplyListWithTopicID:(NSString *)topicID
              completionHandler:(RDXResponseHandler)handler {
    NSDictionary *params = @{ @"topic_id": topicID };
    [self getRequestWithURLString:RDXReplyListURL
                       parameters:params
                completionHandler:handler];
}

@end
