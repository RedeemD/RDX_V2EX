//
//  RDXTimeLabel.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/25.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDXTimeLabel : UILabel

@property (nonatomic, assign) NSTimeInterval timeInterval;

- (void)setText:(NSString *)text NS_UNAVAILABLE;

@end
