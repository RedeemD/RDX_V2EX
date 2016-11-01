//
//  RDXDataSource.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/21.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigBlock)(UITableViewCell *cell, id item);

@interface RDXDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier;
- (instancetype)init NS_UNAVAILABLE;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (void)appendItemsNamed:(NSString *)name fromArray:(NSArray *)dataArray;
- (void)refreshItemsNamed:(NSString *)name fromArray:(NSArray *)dataArray;

@end
