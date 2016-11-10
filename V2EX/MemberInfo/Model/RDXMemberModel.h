//
//  RDXMember.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/18.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDXMemberModel : NSObject

//@property (nonatomic, copy) NSString *status;                 // found : notfound
@property (nonatomic, copy  ) NSString *memberID;
@property (nonatomic, copy  ) NSString *url;
@property (nonatomic, copy  ) NSString *username;
@property (nonatomic, copy  ) NSString *website;
@property (nonatomic, copy  ) NSString *twitter;
@property (nonatomic, copy  ) NSString *psn;
@property (nonatomic, copy  ) NSString *github;
@property (nonatomic, copy  ) NSString *btc;
@property (nonatomic, copy  ) NSString *location;
@property (nonatomic, copy  ) NSString *tagline;
@property (nonatomic, copy  ) NSString *bio;
@property (nonatomic, copy  ) NSURL    *avatar_mini;
@property (nonatomic, copy  ) NSURL    *avatar_normal;
@property (nonatomic, copy  ) NSURL    *avatar_large;
@property (nonatomic, assign) NSInteger created;

/*{
status: "found",
    id: 1,
url: "http://www.v2ex.com/member/Livid",
username: "Livid",
website: "",
twitter: "",
psn: "",
github: "",
btc: "",
location: "91789",
tagline: "Gravitated and spellbound",
bio: "I’ve managed to make something I could call my own world, over time, little by little. And when I’m inside it, I feel kind of relieved.",
avatar_mini: "//cdn.v2ex.co/avatar/c4ca/4238/1_mini.png?m=1466415272",
avatar_normal: "//cdn.v2ex.co/avatar/c4ca/4238/1_normal.png?m=1466415272",
avatar_large: "//cdn.v2ex.co/avatar/c4ca/4238/1_large.png?m=1466415272",
created: 1272203146
}*/

/* {
status: "notfound",
}*/

@end
