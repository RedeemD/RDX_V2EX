//
//  RDXTopicDetailController.h
//  V2EX
//
//  Created by Redeem_D on 2016/11/1.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

@class RDXTopicModel;

#import <UIKit/UIKit.h>
#import "RDXTableViewController.h"

@interface RDXTopicDetailController : RDXTableViewController

@property (nonatomic, strong) RDXTopicModel *topicModel;

//- (instancetype)initWithTopicModel:(RDXTopicModel *)topicModel NS_DESIGNATED_INITIALIZER;

@end
