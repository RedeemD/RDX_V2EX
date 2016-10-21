//
//  RDXMenuCell.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDXMenuCell : UITableViewCell

- (instancetype)initWithImageName:(NSString *)imageName
                            title:(NSString *)title NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end
