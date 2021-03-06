//
//  CYCellData.h
//  Demo
//
//  Created by Yi Li on 16/8/29.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CYCellData <NSObject>

@property (nonatomic, copy) NSString *reuseID;
@property (nonatomic, strong) id data;

- (instancetype)initWithReuseID:(NSString *)reuseID data:(id)data;
@end
