//
//  RDXMemberLabel.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/31.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXMemberLabel.h"
#import "UIColor+RDXCommon.h"

static NSString *const kTextColorHexString = @"0x758088";

@implementation RDXMemberLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font      = [UIFont boldSystemFontOfSize:10];
        self.textColor = [UIColor colorWithHexString:kTextColorHexString];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
