//
//  RDXMenuCell.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//


#import "RDXMenuCell.h"

static const CGFloat kSectionLabelFontSize = 14;

@interface RDXMenuCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *sectionLabel;
@property (nonatomic, strong) NSString *imageName;

@end

@implementation RDXMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    return [self initWithImageName:nil title:nil];
}

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        [self customUIWithImageName:imageName title:title];
    }
    return self;
}

- (void)customUIWithImageName:(NSString *)imageName title:(NSString *)title {
    
    _iconImageView = ({
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(20, 16, 17, 17);
        [self addSubview:imageView];
        imageView;
    });
    
    _sectionLabel = ({
        UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(60, 14, 140, 20)];
        label.text      = title;
        label.font      = [UIFont systemFontOfSize:kSectionLabelFontSize];
        label.textColor = [UIColor grayColor];
        [self addSubview:label];
        label;
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
