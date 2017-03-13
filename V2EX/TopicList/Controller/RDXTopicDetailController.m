//
//  RDXTopicDetailController.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/1.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTopicDetailController.h"
#import "RDXTopicTitleView.h"
#import "RDXTopicContentView.h"
#import "RDXTimeLabel.h"
#import "RDXMemberLabel.h"
#import "RDXTopicModel.h"

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
        RDXTopicContentView *view = [[RDXTopicContentView alloc] init];
        view.content = _topicModel.content;
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.equalTo(self.tableView.tableHeaderView);
//        }];
        view;
    });
    self.tableView.estimatedSectionHeaderHeight = 200;
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

@end
