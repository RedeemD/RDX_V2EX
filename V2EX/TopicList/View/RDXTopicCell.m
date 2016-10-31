//
//  RDXTopicCell.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/19.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicCell.h"
#import "RDXDotView.h"
#import "RDXTimeLabel.h"
#import "RDXNodeNameLabel.h"
#import "UIColor+RDXCommon.h"
#import <Masonry.h>

#import "RDXTopicModel.h"
#import "RDXConfigCellProtocol.h"


const CGFloat RDXTopicCellHeight = 70;

static CGFloat const kTopicCellTitleFontSize = 15;
static CGFloat const kAvatarImageViewWidth   = 48;
static NSString *const kTitleLabelTextColorHexString = @"0x758088";


@interface RDXTopicCell () <RDXConfigCellProtocol>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *memberLabel;
@property (nonatomic, strong) UILabel *replyLabel;
@property (nonatomic, strong) UIImageView  *avatarImageView;
@property (nonatomic, strong) RDXDotView   *dotView1;
@property (nonatomic, strong) RDXDotView   *dotView2;
@property (nonatomic, strong) RDXTimeLabel *timeLabel;
@property (nonatomic, strong) RDXNodeNameLabel *nodeLabel;

@end

@implementation RDXTopicCell

#pragma mark - Class Method

+ (void (^)(UITableViewCell *, id))configCellBlock {
    void (^configCellBlock)(UITableViewCell *,id) = ^(UITableViewCell *cell,id item) {
        
    };
    return configCellBlock;
}

#pragma mark - Initializer

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    
    _avatarImageView = ({
        UIImageView *avatarImageView        = [[UIImageView alloc] init];
        avatarImageView.backgroundColor     = [UIColor cyanColor];
        avatarImageView.layer.cornerRadius  = 5;
        avatarImageView.layer.masksToBounds = YES;
        [self addSubview:avatarImageView];
        [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(10);
            make.width.height.mas_equalTo(kAvatarImageViewWidth);
//            make.bottom.offset(-10);
//            make.width.equalTo(avatarImageView.mas_height);
        }];
        avatarImageView;
    });
    
    _titleLabel = ({
        UILabel *titleLabel  = [[UILabel alloc] init];
        titleLabel.font      = [UIFont systemFontOfSize:kTopicCellTitleFontSize];
        titleLabel.textColor = [UIColor colorWithHexString:@"758088"];
        titleLabel.numberOfLines = 0;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatarImageView.mas_right).offset(10);
            make.right.offset(-10);
            make.top.offset(10);
//            make.bottom.equalTo(_nodeLabel.mas_top).offset(-10);
        }];
        titleLabel;
    });
    
    _nodeLabel = ({
        RDXNodeNameLabel *label = [[RDXNodeNameLabel alloc] init];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.left.equalTo(_titleLabel);
            make.bottom.offset(-10);
            make.height.mas_equalTo(18);
        }];
        label;
    });
    
    _dotView1 = ({
        RDXDotView *dotView = [[RDXDotView alloc] init];
        [self addSubview:dotView];
        [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_nodeLabel);
            make.width.equalTo(dotView.mas_height).multipliedBy(0.75);
            make.left.equalTo(_nodeLabel.mas_right);
        }];
        dotView;
    });
    
    _timeLabel = ({
        RDXTimeLabel *label = [[RDXTimeLabel alloc] init];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_dotView1.mas_right);
            make.top.bottom.equalTo(_nodeLabel);
        }];
        label;
    });
    
    _dotView2 = ({
        RDXDotView *dotView = [[RDXDotView alloc] init];
        [self addSubview:dotView];
        [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.width.equalTo(_dotView1);
            make.left.equalTo(_timeLabel.mas_right);
        }];
        dotView;
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Configure Cell Protocol

- (void)fillDataWithModel:(id)model {
    self.topicModel = model;
    self.titleLabel.text = self.topicModel.title;
    self.nodeLabel.text = self.topicModel.node.title;
    self.timeLabel.timeInterval = self.topicModel.created;
}

@end
