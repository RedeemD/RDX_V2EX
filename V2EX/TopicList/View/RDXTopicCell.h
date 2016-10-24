//
//  RDXTopicCell.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/19.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//
@class RDXTopicModel;

#import <UIKit/UIKit.h>

extern const CGFloat RDXTopicCellHeight;

@interface RDXTopicCell : UITableViewCell

@property (nonatomic, strong) RDXTopicModel *topicModel;

+ (void (^)(UITableViewCell *,id))configCellBlock;

@end
