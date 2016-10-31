//
//  RDXTopic.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/18.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicModel.h"
#import <YYModel.h>

@interface RDXTopicModel () <YYModel>

@end

@implementation RDXTopicModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{ @"topicID": @"id" };
}

@end
