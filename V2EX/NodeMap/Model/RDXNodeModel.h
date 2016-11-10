//
//  RDXNode.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/18.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDXNodeModel : NSObject

@property (nonatomic, assign) NSInteger topics;
@property (nonatomic, assign) NSInteger stars;
@property (nonatomic, assign) NSInteger created;              // created time (seconds)
@property (nonatomic, copy  ) NSString *nodeID;
@property (nonatomic, copy  ) NSString *name;
@property (nonatomic, copy  ) NSString *url;
@property (nonatomic, copy  ) NSString *title;
@property (nonatomic, copy  ) NSString *title_alternative;
@property (nonatomic, copy  ) NSString *header;               // node introduction
@property (nonatomic, copy  ) NSString *footer;
@property (nonatomic, copy  ) NSString *avatar_mini;
@property (nonatomic, copy  ) NSString *avatar_normal;
@property (nonatomic, copy  ) NSString *avatar_large;

//{
//    "status" : "error",
//    "message" : "Object Not Found",
//    "rate_limit" : {
//        "used" : 1,
//        "hourly_quota" : 120,
//        "hourly_remaining" : 119
//    }
//}

//{
//    "id" : 90,
//    "name" : "python",
//    "url" : "http://www.v2ex.com/go/python",
//    "title" : "Python",
//    "title_alternative" : "Python",
//    "topics" : 5813,
//    "stars" : 3999,
//    
//    "header" : "这里讨论各种 Python 语言编程话题，也包括 Django，Tornado 等框架的讨论。这里是一个能够帮助你解决实际问题的地方。",
//    
//    
//    "footer" : null,
//    
//    "created" : 1278683336,
//    "avatar_mini" : "//cdn.v2ex.co/navatar/8613/985e/90_mini.png?m=1476398601",
//    "avatar_normal" : "//cdn.v2ex.co/navatar/8613/985e/90_normal.png?m=1476398601",
//    "avatar_large" : "//cdn.v2ex.co/navatar/8613/985e/90_large.png?m=1476398601"
//}
@end
