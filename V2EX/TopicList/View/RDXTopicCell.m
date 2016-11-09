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
#import "RDXMemberLabel.h"
#import "RDXTopicDetailController.h"

#import "RDXTopicModel.h"
#import "RDXConfigCellProtocol.h"
#import "UIView+RDXHierarchy.h"


const CGFloat RDXTopicCellHeight = 70;

static CGFloat const kTopicCellTitleFontSize = 15;
static CGFloat const kAvatarImageViewWidth   = 48;
static NSString *const kTitleLabelTextColorHexString = @"0x758088";


@interface RDXTopicCell () <RDXConfigCellProtocol>

@property (nonatomic, strong) UILabel          *titleLabel;
@property (nonatomic, strong) UIImageView      *avatarImageView;
@property (nonatomic, strong) RDXDotView       *dotView1;
@property (nonatomic, strong) RDXDotView       *dotView2;
@property (nonatomic, strong) RDXTimeLabel     *timeLabel;
@property (nonatomic, strong) RDXMemberLabel   *memberLabel;
@property (nonatomic, strong) RDXNodeNameLabel *nodeLabel;

@end

@implementation RDXTopicCell

#pragma mark - Class Method

//+ (void (^)(UITableViewCell *, id))configCellBlock {
//    void (^configCellBlock)(UITableViewCell *,id) = ^(UITableViewCell *cell,id item) {
//
//    };
//    return configCellBlock;
//}

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
        avatarImageView.layer.cornerRadius  = 5;
        avatarImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:avatarImageView];
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
        [self.contentView addSubview:titleLabel];
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
        [self.contentView addSubview:label];
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
        [self.contentView addSubview:dotView];
        [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_nodeLabel);
            make.width.equalTo(dotView.mas_height).multipliedBy(0.75);
            make.left.equalTo(_nodeLabel.mas_right);
        }];
        dotView;
    });
    
    _memberLabel = ({
        RDXMemberLabel *label = [[RDXMemberLabel alloc] init];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_dotView1);
            make.left.equalTo(_dotView1.mas_right);
        }];
        label;
    });
    
    _dotView2 = ({
        RDXDotView *dotView = [[RDXDotView alloc] init];
        [self.contentView addSubview:dotView];
        [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.width.equalTo(_dotView1);
            make.left.equalTo(_memberLabel.mas_right);
        }];
        dotView;
    });
    
    _timeLabel = ({
        RDXTimeLabel *label = [[RDXTimeLabel alloc] init];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_dotView2.mas_right);
            make.top.bottom.equalTo(_nodeLabel);
        }];
        label;
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        RDXTopicDetailController *topicVC = [[RDXTopicDetailController alloc] init];
        topicVC.topicModel = _topicModel;
        [self.rdx_viewController.navigationController pushViewController:topicVC
                                                                animated:YES];
    }
}

#pragma mark - Configure Cell Protocol

//- (void)setTopicModel:(RDXTopicModel *)topicModel {
- (void)fillDataWithModel:(id)model {
    self.topicModel = model;
//    _topicModel = topicModel;
    _nodeLabel.text   = self.topicModel.node.title;
    _titleLabel.text  = self.topicModel.title;
    _memberLabel.text = self.topicModel.member.username;
    _timeLabel.timeInterval = self.topicModel.created;
    
    NSString *avatarURLString =
      [NSString stringWithFormat:@"https:%@", self.topicModel.member.avatar_normal];
    NSURL *avatarURL = [NSURL URLWithString:avatarURLString];
    [_avatarImageView sd_setImageWithURL:avatarURL placeholderImage:nil];
}

@end
