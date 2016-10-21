//
//  RDXRootViewController.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RDXMenuSectionType) {
    RDXMenuSectionTypeLatest,
    RDXMenuSectionTypeHot,
    RDXMenuSectionTypeFavor,
    RDXMenuSectionTypeNode,
    RDXMenuSectionTypeProfile,
    RDXMenuSectionTypeSetting,
};

@interface RDXRootViewController : UINavigationController

- (void)showSection:(RDXMenuSectionType)section animated:(BOOL)animated;

@end
