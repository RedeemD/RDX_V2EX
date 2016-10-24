//
//  RDXNode.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/18.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXNodeModel.h"
#import <YYModel.h>

@interface RDXNodeModel () <YYModel>

@end

@implementation RDXNodeModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{ @"nodeID": @"id" };
}

@end
