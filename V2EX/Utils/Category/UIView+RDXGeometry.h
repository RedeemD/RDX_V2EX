//
//  UIView+RDXGeometry.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/25.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RDXGeometry)

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setOrigin:(CGPoint)origin;

- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setSize:(CGSize)size;

- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;

@end
