//
//  RDXNetworkManager.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/23.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RDXRequestHandler)(id responseObject, NSError *error);

@interface RDXNetworkManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - GET

- (void)getLatestTopicListWithCompletionHandler:(RDXRequestHandler)handler;

- (void)getTopicDetailWithTopicID:(NSString *)topicID
                completionHandler:(RDXRequestHandler)handler;

- (void)getTopicListWithNodeID:(NSString *)nodeID
                          page:(NSInteger)page
             completionHandler:(RDXRequestHandler)handler;

- (void)getTopicListWithNodeName:(NSString *)nodeName
                            page:(NSInteger)page
               completionHandler:(RDXRequestHandler)handler;

- (void)getTopicListWithUserName:(NSString *)username
                            page:(NSInteger)page
               completionHandler:(RDXRequestHandler)handler;


@end
