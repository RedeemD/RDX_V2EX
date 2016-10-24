//
//  RDXTopicListController.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/23.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXLatestViewController.h"
#import "RDXTopicCell.h"
#import "RDXDataSource.h"
#import "RDXNetworkManager.h"
#import <MJRefresh.h>

static NSString *const kTopicCellIdentifier = @"topicCellIdentifier";

@interface RDXLatestViewController ()

@property (nonatomic, strong) RDXDataSource *dataSource;

@end

@implementation RDXLatestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDataSource];
    [self setupTableView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setupTableView {
    
    [self.tableView registerClass:[RDXTopicCell class]
           forCellReuseIdentifier:kTopicCellIdentifier];
    
    __weak typeof(self) weakSelf = self;
    RDXResponseHandler responseHandler = ^(id responseObject, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!responseObject) {
            [strongSelf.tableView.mj_header endRefreshing];
            return ;
        }
        [strongSelf.dataSource refreshItemsNamed:@"RDXTopicModel" fromArray:responseObject];
        [strongSelf.tableView reloadData];
        [strongSelf.tableView.mj_header endRefreshing];
    };
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;
        RDXNetworkManager *manager = [RDXNetworkManager sharedManager];
        [manager getLatestTopicListWithCompletionHandler:responseHandler];
//        [manager getTopicListWithNodeName:@"python"
//                                     page:0
//                        completionHandler:responseHandler];
//        strongSelf.dataSource refreshItemsNamed:@"RDXTopicModel" fromArray:
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)setupDataSource {
    
    
    
//    TableViewCellConfigBlock configCellBlock = ^(UITableViewCell *cell, id item) {
//
//    };
//    self.dataSource = [[RDXDataSource alloc] initWithItems:@[]
//                                        cellIdentifier:kTopicCellIdentifier
//                                       configCellBlock:configCellBlock];
    self.dataSource = [[RDXDataSource alloc] initWithCellIdentifier:kTopicCellIdentifier];
    
    self.tableView.dataSource = self.dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
