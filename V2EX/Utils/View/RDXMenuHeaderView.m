//
//  RDXMenuHeaderView.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/21.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXMenuHeaderView.h"

@interface RDXMenuHeaderView ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation RDXMenuHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customUI];
    }
    return self;
}

- (void)customUI {
    
    _avatarView = ({
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 60, 60)];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(30);
            make.width.height.mas_equalTo(60);
        }];
        imageView;
    });
    
    _lineView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.f];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@1);
        }];
        view;
    });
    
}

@end
