//
//  RDXReplyModel.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/8.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXReplyModel.h"
#import <YYModel.h>

@interface RDXReplyModel () <YYModel>

@end

@implementation RDXReplyModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{ @"replyID": @"id" };
}

@end
