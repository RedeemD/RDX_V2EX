//
//  RDXTopicContentView.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/14.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicContentView.h"

@interface RDXTopicContentView ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation RDXTopicContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    //        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    //        view;
    _contentLabel = ({
        UILabel *label = [[UILabel alloc] init];
        //    label.text = _topicModel.content;
        label.numberOfLines = 0;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 15, 0, 15));
        }];
        label;
    });
}

- (void)setContent:(NSString *)content {
    if ([_content isEqualToString:content]) {
        return;
    }
    _content = content.copy;
    _contentLabel.text = _content;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
