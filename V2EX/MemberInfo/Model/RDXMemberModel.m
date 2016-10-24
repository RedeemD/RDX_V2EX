//
//  RDXMember.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/18.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXMemberModel.h"
#import <YYModel.h>

@interface RDXMemberModel () <YYModel>

@end

@implementation RDXMemberModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{ @"memberID": @"id" };
}

@end
