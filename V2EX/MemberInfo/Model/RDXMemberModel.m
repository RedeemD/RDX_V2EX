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

- (NSDictionary *)modelCustomWillTransformFromDictionary:(NSDictionary *)dic {
    
    NSMutableDictionary *resultDic = dic.mutableCopy;
    
    NSArray *array = @[ @"mini", @"normal", @"large" ];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *keyPath = [NSString stringWithFormat:@"avatar_%@", obj];
        NSString *string  = [resultDic[keyPath] substringFromIndex:2];
//        dic[keyPath] = [dic[keyPath] substringFromIndex:2];
        resultDic[keyPath] = [NSString stringWithFormat:@"https:%@", string];
    }];
    return resultDic;
}

@end
