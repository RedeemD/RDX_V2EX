//
//  RDXTopicDetailController.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/1.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicDetailController.h"
#import "RDXTopicTitleView.h"
#import "RDXTopicModel.h"
#import "RDXTimeLabel.h"
#import "RDXMemberLabel.h"

static NSString *const kReplyCellIdentifier     = @"kReplyCellIdentifier";
static NSString *const kTitleTextColorHexString = @"0x000000";

@interface RDXTopicDetailController ()

//@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *sectionHeaderView;

@end

@implementation RDXTopicDetailController

#pragma mark - Life Cycle

//- (instancetype)initWithTopicModel:(RDXTopicModel *)topicModel {
- (instancetype)init {
    self = [super initWithCellClassName:@"RDXReplyCell"
                         cellIdentifier:kReplyCellIdentifier
                              modelName:@"RDXReplyModel"];
    if (self) {
//        _topicModel = topicModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _topicModel.title;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self configureSubviews];
}

- (void)configureSubviews {
    [self setupHeaderView];
    [self setupSectionHeaderView];
    [self setupNavigationItem];
}

- (void)setupHeaderView {
    RDXTopicTitleView *headerView = [[RDXTopicTitleView alloc] init];
    headerView.topicModel = _topicModel;
    self.tableView.tableHeaderView = headerView;
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.tableView);
    }];
}

- (void)setupSectionHeaderView {
    _sectionHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        view;
    });
}

- (void)setupNavigationItem {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithCustomView:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.text     = self.title;
    label.minimumScaleFactor        = 0.8;
    label.adjustsFontSizeToFitWidth = YES;
    [label sizeToFit];
    self.navigationItem.titleView   = label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RDXTableView Protocol

- (void)requestRefreshWithCompletionHandler:(RDXResponseHandler)responseHandler {
    RDXNetworkManager *manager = [RDXNetworkManager sharedManager];
    [manager getReplyListWithTopicID:_topicModel.topicID
                   completionHandler:responseHandler];
//    [manager getLatestTopicListWithCompletionHandler:responseHandler];
}

#pragma mark - Table view delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return _sectionHeaderView;
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:c forIndexPath:indexPath];
    
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
