//
//  RDXTableViewController.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/23.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXLatestViewController.h"
//#import "RDXTopicCell.h"
//#import "RDXDataSource.h"
//#import "RDXNetworkManager.h"

static NSString *const kTopicCellIdentifier = @"kTopicCellIdentifier";

@interface RDXLatestViewController ()

@end

@implementation RDXLatestViewController

- (instancetype)init {
    self = [super initWithCellClassName:@"RDXTopicCell"
                         cellIdentifier:kTopicCellIdentifier
                              modelName:@"RDXTopicModel"];
    if (self) {
        self.title = @"最新";
    }
    return self;
}

#pragma mark - RDXTableView Protocol

- (void)requestRefreshWithCompletionHandler:(RDXResponseHandler)responseHandler {
    RDXNetworkManager *manager = [RDXNetworkManager sharedManager];
    [manager getLatestTopicListWithCompletionHandler:responseHandler];
}

//- (void)requestLoadMoreWithCompletionHandler:(RDXResponseHandler)responseHandler {
//
//}

@end
