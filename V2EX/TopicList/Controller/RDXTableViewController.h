//
//  RDXTableViewController.h
//  V2EX
//
//  Created by Redeem_D on 2016/11/1.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDXNetworkManager.h"

@protocol RDXTableViewDataProtocol <NSObject>

- (void)requestRefreshWithCompletionHandler:(RDXResponseHandler)responseHandler;
- (void)requestLoadMoreWithCompletionHandler:(RDXResponseHandler)responseHandler;

@end

@interface RDXTableViewController : UITableViewController <RDXTableViewDataProtocol>

- (instancetype)initWithCellClassName:(NSString *)cellClassName
                       cellIdentifier:(NSString *)cellIdentifier
                            modelName:(NSString *)modelName NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;

@end
