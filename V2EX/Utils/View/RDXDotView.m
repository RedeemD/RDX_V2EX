//
//  RDXDotView.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/31.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXDotView.h"

@interface RDXDotView ()

@property (nonatomic, strong) UIView *dotView;

@end

@implementation RDXDotView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    _dotView = [[UIView alloc] init];
    _dotView.backgroundColor = [UIColor colorWithHexString:@"cccccc"];
    _dotView.layer.cornerRadius = 1.5;
    [self addSubview:_dotView];
    [_dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.height.mas_equalTo(3);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
