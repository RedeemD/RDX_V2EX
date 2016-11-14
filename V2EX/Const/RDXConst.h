//
//  RDXConst.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/23.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

//#import <Foundation/Foundation.h>

// 日志打印
#ifdef DEBUG

#define RDXLog(format, ...) NSLog(format, ##__VA_ARGS__)

#else

#define RDXLog(format, ...)

#endif

// 屏幕尺寸
#define RDXScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define RDXScreenWidth ([UIScreen mainScreen].bounds.size.width)
// 系统版本
#define RDXSystemVersion [[UIDevice currentDevice] systemVersion]

extern NSString *const RDXTopicCellIdentifier;
