//
//  RDXNodeNameLabel.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/19.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXNodeNameLabel.h"

static CGFloat   const kNodeNameLabelFontSize    = 10;
static NSString *const kBackgroundColorHexString = @"0xf5f5f5";
static NSString *const kTextColorHexString       = @"0x999999";

@implementation RDXNodeNameLabel

// 根据节点名初始化
//- (instancetype)initWithText:(NSString *)text {
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font            = [UIFont systemFontOfSize:kNodeNameLabelFontSize];
        // 仿照 V2EX 站内节点颜色
        self.textColor       = [UIColor colorWithHexString:kTextColorHexString];
        self.backgroundColor = [UIColor colorWithHexString:kBackgroundColorHexString];
//        self.text = text;
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    // Masonry 布局，舍弃 frame
//    return [self initWithText:nil];
//}

// 略微拓宽背景色块，并返回原 text
- (void)setText:(NSString *)text {
    super.text = [NSString stringWithFormat:@" %@ ", text];
    [self sizeToFit];
}
- (NSString *)text {
    return [[super text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
