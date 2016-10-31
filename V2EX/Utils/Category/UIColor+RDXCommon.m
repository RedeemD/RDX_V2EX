//
//  UIColor+RDXCommon.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/25.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "UIColor+RDXCommon.h"

@implementation UIColor (RDXCommon)

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >>  8) & 0xFF;
    int b = (hex      ) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.f
                           green:g / 255.f
                            blue:b / 255.f
                           alpha:1.f];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if ([scanner scanHexInt:&hexNum]) {
        return [UIColor colorWithRGBHex:hexNum];
    }
    return nil;
}
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha {
    UIColor *color = [UIColor colorWithHexString:stringToConvert];
    return [color colorWithAlphaComponent:MIN(MAX(alpha, 0.f), 1.f)];
}

@end
