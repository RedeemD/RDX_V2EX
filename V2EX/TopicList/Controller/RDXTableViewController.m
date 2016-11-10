//
//  RDXTableViewController.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/1.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTableViewController.h"
#import "RDXDataSource.h"
#import <MJRefresh.h>

@interface RDXTableViewController () 

@property (nonatomic, copy  ) NSString *cellClassName;
@property (nonatomic, copy  ) NSString *cellIdentifier;
@property (nonatomic, copy  ) NSString *modelName;
@property (nonatomic, strong) RDXDataSource *dataSource;

@end

@implementation RDXTableViewController

#pragma mark - Initializer

- (instancetype)initWithCellClassName:(NSString *)cellClassName
                       cellIdentifier:(NSString *)cellIdentifier
                            modelName:(NSString *)modelName {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _cellClassName  = cellClassName;
        _cellIdentifier = cellIdentifier;
        _modelName      = modelName;
    }
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDataSource];
    [self setupTableView];
    
    // Uncomment the following line to preserve selection between presentations.
    //     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setupDataSource {
    self.dataSource = [[RDXDataSource alloc] initWithCellIdentifier:self.cellIdentifier];
    self.tableView.dataSource = self.dataSource;
}

- (void)setupTableView {
    
    Class cellClass = NSClassFromString(self.cellClassName);
    [self.tableView registerClass:cellClass
           forCellReuseIdentifier:self.cellIdentifier];
    
    self.tableView.estimatedRowHeight = 70;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    

    @weakify(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self refreshData];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)refreshData {
    
    @weakify(self);
    RDXResponseHandler responseHandler = ^(id responseObject, NSError *error) {
        @strongify(self);
        if (!responseObject) {
            [self.tableView.mj_header endRefreshing];
            RDXLog(@"%@", error.localizedDescription);
            return ;
        }
        [self.dataSource refreshItemsNamed:self.modelName fromArray:responseObject];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    };
    
    [self requestRefreshWithCompletionHandler:responseHandler];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RDXTableView Protocol
- (void)requestRefreshWithCompletionHandler:(RDXResponseHandler)responseHandler {
    [NSException raise:NSInternalInconsistencyException
                format:@"%@ must be overridden in a subclass", NSStringFromSelector(_cmd)];
}
- (void)requestLoadMoreWithCompletionHandler:(RDXResponseHandler)responseHandler {
    [NSException raise:NSInternalInconsistencyException
                format:@"%@ must be overridden in a subclass", NSStringFromSelector(_cmd)];
}

#pragma mark - Table View Delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
////    cell.selected = YES;
//    RDXLog(@"%ld------%d----%s", indexPath.row, cell.isSelected, __func__);
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
