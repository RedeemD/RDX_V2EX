//
//  RDXHotViewController.m
//  V2EX
//
//  Created by Redeem_D on 2016/11/14.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXHotViewController.h"

@interface RDXHotViewController ()

@end

@implementation RDXHotViewController

- (instancetype)init {
    self = [super initWithCellClassName:@"RDXTopicCell"
                         cellIdentifier:RDXTopicCellIdentifier
                              modelName:@"RDXTopicModel"];
    if (self) {
        self.title = @"最热";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RDXTableView Protocol

- (void)requestRefreshWithCompletionHandler:(RDXResponseHandler)responseHandler {
    RDXNetworkManager *manager = [RDXNetworkManager sharedManager];
    [manager getHotTopicListWihCompletionHandler:responseHandler];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
