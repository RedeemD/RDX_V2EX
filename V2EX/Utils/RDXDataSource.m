//
//  RDXDataSource.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/21.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXDataSource.h"

@interface RDXDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigBlock configCellBlock;

@end

@implementation RDXDataSource

- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)cellIdentifier
              configCellBlock:(TableViewCellConfigBlock)configCellBlock {
    self = [super init];
    if (self) {
        _items = items;
        _cellIdentifier = cellIdentifier;
        _configCellBlock = configCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

#pragma mark - Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    if (self.configCellBlock) {
        self.configCellBlock(cell, item);
    }
    return cell;
}

@end
