//
//  RDXConfigCellProtocol.h
//  V2EX
//
//  Created by Redeem_D on 2016/10/24.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#ifndef RDXConfigCellProtocol_h
#define RDXConfigCellProtocol_h

@protocol RDXConfigCellProtocol <NSObject>

// 给 cell 填充数据定义统一接口，便于抽象 dataSource 的代理方法实现
- (void)fillDataWithModel:(id)model;

@end


#endif /* RDXConfigCellProtocol_h */
