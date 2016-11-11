//
//  RDXTopicTitleView.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/11.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicTitleView.h"
#import "RDXMemberLabel.h"
#import "RDXTimeLabel.h"
#import "RDXTopicModel.h"

static NSString *const kTitleTextColorHexString = @"0x000000";

@interface RDXTopicTitleView ()

@property (nonatomic, strong) UILabel        *titleLabel;
@property (nonatomic, strong) UIImageView    *avatarImageView;
@property (nonatomic, strong) RDXTimeLabel   *timeLabel;
@property (nonatomic, strong) RDXMemberLabel *memberLabel;

@end

@implementation RDXTopicTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
    }
    return self;
}
- (void)configureSubviews {
    
    _titleLabel = ({
        UILabel *titleLabel  = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.font      = [UIFont systemFontOfSize:20];
        titleLabel.textColor = [UIColor colorWithHexString:kTitleTextColorHexString];
        titleLabel.numberOfLines = 0;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(15);
            make.right.offset(-10);
        }];
        titleLabel;
    });
    
    _avatarImageView = ({
        UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:avatarImageView];
        [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.left.equalTo(_titleLabel);
            make.height.width.mas_equalTo(20);
            make.bottom.offset(-10);
        }];
        avatarImageView;
    });
    
    _memberLabel = ({
        RDXMemberLabel *memberLabel = [[RDXMemberLabel alloc] init];
        [self addSubview:memberLabel];
        [memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatarImageView.mas_right).offset(5);
            make.top.bottom.equalTo(_avatarImageView);
        }];
        memberLabel;
    });
    
    _timeLabel = ({
        RDXTimeLabel *timeLabel = [[RDXTimeLabel alloc] init];
        [self addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_memberLabel);
            make.right.offset(-10);
        }];
        timeLabel;
    });
}

- (void)setTopicModel:(RDXTopicModel *)topicModel {
    if (_topicModel == topicModel) {
        return;
    }
    _topicModel = topicModel;
    _titleLabel.text   = _topicModel.title;
    _memberLabel.text  = _topicModel.member.username;
    _timeLabel.timeInterval = _topicModel.created;
    [_avatarImageView sd_setImageWithURL:_topicModel.member.avatar_normal
                        placeholderImage:nil];

}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
