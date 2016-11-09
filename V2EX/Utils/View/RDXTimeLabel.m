//
//  RDXTimeLabel.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/25.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXTimeLabel.h"

static CGFloat const kTimeLabelFontSize = 10;

static NSString *const kTextColorHexString = @"0xcececf";
static NSInteger const kSecondsPerMinute   = 60;
static NSInteger const kSecondsPerHour     = 60 * 60;
static NSInteger const kSecondsPerDay      = 60 * 60 * 24;
static NSInteger const kSecondsPerMonth    = 60 * 60 * 24 * 30;
static NSInteger const kSecondsPerYear     = 60 * 60 * 24 * 30 * 365;

@implementation RDXTimeLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor colorWithHexString:kTextColorHexString];
        self.font = [UIFont systemFontOfSize:kTimeLabelFontSize];
    }
    return self;
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSTimeInterval result = [date timeIntervalSinceNow];
    NSString *string = [self textForTimeInterval:-result];
    super.text = string;
    [self sizeToFit];
}


// 根据时间差返回 label 显示文字
- (NSString *)textForTimeInterval:(NSTimeInterval)timeInterval {
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    if (timeInterval < 0) {
        return nil;
    }
    else if (timeInterval < kSecondsPerMinute) {
        return @"刚刚";
    }
    else if (timeInterval < kSecondsPerHour) {
        return [NSString stringWithFormat:@"%ld 分钟前", (int)timeInterval / kSecondsPerMinute];
    }
    else if (timeInterval < kSecondsPerDay) {
        return [NSString stringWithFormat:@"%ld 小时前", (int)timeInterval / kSecondsPerHour];
    }
    else if (timeInterval < kSecondsPerMonth) {
        return [NSString stringWithFormat:@"%ld 天前", (int)timeInterval / kSecondsPerDay];
    }
    else if (timeInterval < kSecondsPerYear) {
        return [NSString stringWithFormat:@"%ld 月前", (int)timeInterval / kSecondsPerMonth];
    }
    else {
        return [NSString stringWithFormat:@"%ld 年前", (int)timeInterval / kSecondsPerYear];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
