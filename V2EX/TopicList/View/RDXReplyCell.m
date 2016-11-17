//
//  RDXReplyCell.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/8.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXReplyCell.h"
#import "RDXMemberLabel.h"
#import "RDXTimeLabel.h"

#import "RDXReplyModel.h"
#import "RDXConfigCellProtocol.h"

static CGFloat const kAvatarImageViewWidth   = 48;

@interface RDXReplyCell () <RDXConfigCellProtocol>

@property (nonatomic, strong) UILabel        *replyLabel;
@property (nonatomic, strong) UIImageView    *avatarImageView;
@property (nonatomic, strong) RDXTimeLabel   *timeLabel;
@property (nonatomic, strong) RDXMemberLabel *memberLabel;


@end

@implementation RDXReplyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    
    _avatarImageView = ({
        UIImageView *avatarImageView        = [[UIImageView alloc] init];
        avatarImageView.layer.cornerRadius  = 5;
        avatarImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:avatarImageView];
        [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(10);
            make.width.height.mas_equalTo(kAvatarImageViewWidth);
            make.bottom.lessThanOrEqualTo(self.contentView).offset(-10);
//            make.bottom.
        }];
        avatarImageView;
    });
    
    _memberLabel = ({
        RDXMemberLabel *label = [[RDXMemberLabel alloc] init];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatarImageView.mas_right).offset(10);
            make.top.equalTo(_avatarImageView);
            make.height.mas_equalTo(18);
        }];
        label;
    });
    
    _timeLabel = ({
        RDXTimeLabel *label = [[RDXTimeLabel alloc] init];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_memberLabel);
            make.left.equalTo(_memberLabel.mas_right).offset(5);
        }];
        label;
    });
    
    _replyLabel = ({
        UILabel *label      = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_memberLabel.mas_bottom).offset(5);
            make.left.equalTo(_memberLabel);
//            make.right.bottom.offset(-10);
            make.right.bottom.lessThanOrEqualTo(self.contentView).offset(-10);
        }];
        label;
    });
    
    [self setNeedsLayout];
}

- (void)fillDataWithModel:(id)model {
    self.replyModel = model;
    
    _memberLabel.text = _replyModel.member.username;
    _replyLabel.text  = _replyModel.content;
    _timeLabel.timeInterval = _replyModel.created;
    [_avatarImageView sd_setImageWithURL:_replyModel.member.avatar_normal
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
