//
//  RDXNodeNameLabel.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/19.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXNodeNameLabel.h"

@implementation RDXNodeNameLabel

// 根据节点名初始化
- (instancetype)initWithText:(NSString *)text {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        // 仿照 V2EX 站内节点颜色
        self.backgroundColor = [UIColor colorWithRed:245/255.f
                                               green:245/255.f
                                                blue:245/255.f
                                               alpha:1.f];
        self.textColor       = [UIColor colorWithRed:153/255.f
                                               green:153/255.f
                                                blue:153/255.f
                                               alpha:1.f];
        self.font = [UIFont systemFontOfSize:14];
        self.text = text;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    // Masonry 布局，舍弃 frame
    return [self initWithText:nil];
}

// 略微拓宽背景色块，并返回原 text
- (void)setText:(NSString *)text {
    super.text = [NSString stringWithFormat:@" %@ ", text];
    [self sizeToFit];
}
- (NSString *)text {
    return [[super text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
