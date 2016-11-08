//
//  RDXReplyModel.h
//  V2EX
//
//  Created by Redeem_D on 2016/11/8.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDXMemberModel.h"

@interface RDXReplyModel : NSObject

@property (nonatomic, assign) NSInteger replyID;
@property (nonatomic, assign) NSInteger thanks;
@property (nonatomic, assign) NSInteger created;
@property (nonatomic, assign) NSInteger last_modified;

@property (nonatomic, copy  ) NSString *content;
@property (nonatomic, copy  ) NSString *content_rendered;

@property (nonatomic, strong) RDXMemberModel *member;



//{
//    "id": 3723586,
//    "thanks": 0,
//    "content": "赞",
//    "content_rendered": "赞",
//    "member": {
//        "id": 16996,
//        "username": "cai314494687",
//        "tagline": "",
//        "avatar_mini": "//cdn.v2ex.co/avatar/e8ff/7030/16996_mini.png?m=1475027827",
//        "avatar_normal": "//cdn.v2ex.co/avatar/e8ff/7030/16996_normal.png?m=1475027827",
//        "avatar_large": "//cdn.v2ex.co/avatar/e8ff/7030/16996_large.png?m=1475027827"
//    },
//    "created": 1478267884,
//    "last_modified": 1478267884
//}

@end
