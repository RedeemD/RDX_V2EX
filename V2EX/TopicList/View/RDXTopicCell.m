//
//  RDXTopicCell.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/19.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicCell.h"
#import "RDXNodeNameLabel.h"

#import <Masonry.h>

const CGFloat RDXTopicCellHeight = 70;

static const CGFloat kTopicCellTitleFontSize = 18;

@interface RDXTopicCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *memberLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *replyLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) RDXNodeNameLabel *nodeLabel;

@end

@implementation RDXTopicCell

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
        UIImageView *avatarImageView = [[UIImageView alloc] init];
        avatarImageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:avatarImageView];
        [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(10);
            make.bottom.offset(-10);
            make.width.equalTo(self.mas_height);
        }];
        avatarImageView;
    });
    
    _titleLabel = ({
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.font = [UIFont systemFontOfSize:kTopicCellTitleFontSize];
        titleLable.textColor = [UIColor colorWithRed:117/255.f green:128/255.f blue:136/255.f alpha:1.f];
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatarImageView.mas_right).offset(10);
            make.right.offset(-10);
            make.top.offset(10);
            make.bottom.equalTo(_nodeLabel.mas_top).offset(-10);
        }];
        titleLable;
    });
    
    _nodeLabel = ({
        RDXNodeNameLabel *label = [[RDXNodeNameLabel alloc] init];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.left.equalTo(_titleLabel);
            make.bottom.equalTo(_avatarImageView);
        }];
        label;
    });
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
