//
//  RDXTopic.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/18.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//
@class RDXMember;
@class RDXNode;

#import <Foundation/Foundation.h>

@interface RDXTopic : NSObject

@property (nonatomic, assign) NSInteger topicID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *content_rendered;
@property (nonatomic, assign) NSInteger replies;
@property (nonatomic, strong) RDXMember *member;
@property (nonatomic, strong) RDXNode *node;



//[
// -{
//     "id": 32552,
//     "title": "新浪微博挂了吗？",
//     "url": "http://www.v2ex.com/t/32552",
//     "content": "我这里打开404，都有一会了。",
//     "content_rendered": "我这里打开404，都有一会了。",
//     "replies": 9,
//     -"member": {
//         "id": 9018,
//         "username": "tomheng",
//         "tagline": "伪技术男，绝对路痴。",
//         "avatar_mini": "//cdn.v2ex.co/avatar/a24b/dc3e/9018_mini.png?m=1434079495",
//         "avatar_normal": "//cdn.v2ex.co/avatar/a24b/dc3e/9018_normal.png?m=1434079495",
//         "avatar_large": "//cdn.v2ex.co/avatar/a24b/dc3e/9018_large.png?m=1434079495"
//     },
//     -"node": {
//         "id": 12,
//         "name": "qna",
//         "title": "问与答",
//         "url": "http://www.v2ex.com/go/qna",
//         "topics": 77313,
//         "avatar_mini": "//cdn.v2ex.co/navatar/c20a/d4d7/12_mini.png?m=1476375952",
//         "avatar_normal": "//cdn.v2ex.co/navatar/c20a/d4d7/12_normal.png?m=1476375952",
//         "avatar_large": "//cdn.v2ex.co/navatar/c20a/d4d7/12_large.png?m=1476375952"
//     },
//     "created": 1334747889,
//     "last_modified": 1335106999,
//     "last_touched": 1334836176
//  }
//]


//[ ]
@end
