//
//  RDXMenuView.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDXMenuView : UIView

@property (nonatomic, copy) void (^cellDidSelectedHandler)(NSInteger index);

@end
