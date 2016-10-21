//
//  RDXTopicCell.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/19.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicCell.h"
#import "RDXNodeNameLabel.h"

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
#warning need init
    }
    return self;
}

- (void)configureSubviews {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
