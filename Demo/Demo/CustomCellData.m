//
//  CustomCellData.m
//  Demo
//
//  Created by Yi Li on 16/8/29.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import "CustomCellData.h"

@implementation CustomCellData

- (instancetype)initWithReuseID:(NSString *)reuseID data:(id)data {
    
    if (self = [super init]) {
        self.reuseID = reuseID;
        self.data = data;
    }
    return self;
}
@end
