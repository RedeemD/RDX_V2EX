//
//  RDXDataSource.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/21.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXDataSource.h"
#import "RDXConfigCellProtocol.h"
#import <YYModel.h>

@interface RDXDataSource ()

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigBlock configCellBlock;

@end

@implementation RDXDataSource

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier {
//- (instancetype)initWithItems:(NSArray *)items
//               cellIdentifier:(NSString *)cellIdentifier
//              configCellBlock:(TableViewCellConfigBlock)configCellBlock {
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
        _cellIdentifier = cellIdentifier;
//        _configCellBlock = configCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

- (void)appendItemsNamed:(NSString *)name fromArray:(NSArray *)dataArray {
    Class modelClass = NSClassFromString(name);
    for (NSDictionary *dict in dataArray) {
        NSObject *model = [modelClass yy_modelWithDictionary:dict];
        [self.items addObject:model];
    }
}

- (void)refreshItemsNamed:(NSString *)name fromArray:(NSArray *)dataArray {
    [self.items removeAllObjects];
    [self appendItemsNamed:name fromArray:dataArray];
}

#pragma mark - Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell<RDXConfigCellProtocol> *cell =
      [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                      forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    [cell fillDataWithModel:item];
    return cell;
}

@end
