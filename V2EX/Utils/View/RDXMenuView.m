//
//  RDXMenuView.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXMenuView.h"
#import "RDXMenuCell.h"
#import "RDXMenuHeaderView.h"
//#import "RDXDataSource.h"

static const CGFloat kMenuSectionCellHeight = 50;

@interface RDXMenuView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
//@property (nonatomic, strong) RDXDataSource *dataSource;

@end

@implementation RDXMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customUI];
        [self prepareData];
    }
    return self;
}

- (void)customUI {
    
    RDXMenuHeaderView *headerView =
      [[RDXMenuHeaderView alloc] initWithFrame:CGRectMake(0, 0, 200, 110)];
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                              style:UITableViewStylePlain];
        tableView.delegate   = self;
        tableView.dataSource = self;
        tableView.rowHeight  = kMenuSectionCellHeight;
        tableView.tableHeaderView = headerView;
        tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero);
        }];
        tableView;
    });
}

- (void)prepareData {
    
    _dataSource = [NSMutableArray array];
    NSArray *sectionNameArray = @[ @"最新", @"最热", @"节点", @"收藏", @"个人", @"设置" ];
    NSArray *imageNameArray   = @[ @"latest", @"latest", @"nodes", @"fav", @"profile", @"setting" ];
    
    for (NSInteger i=0; i<sectionNameArray.count; ++i) {
        NSString *imageName   = [NSString stringWithFormat:@"section_%@", imageNameArray[i]];
        NSString *sectionName = sectionNameArray[i];
        
        RDXMenuCell *cell = [[RDXMenuCell alloc] initWithImageName:imageName title:sectionName];
        [_dataSource addObject:cell];
    }
}

#pragma mark - Table view Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_cellDidSelectedHandler) {
        _cellDidSelectedHandler(indexPath.row + 1);
    }
}

#pragma mark - table view Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataSource[indexPath.row];
}

@end
