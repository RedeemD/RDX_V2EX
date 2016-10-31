//
//  UIView+RDXHierarchy.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/31.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "UIView+RDXHierarchy.h"

@implementation UIView (RDXHierarchy)

- (UIViewController *)rdx_viewController {
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = next.nextResponder;
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
