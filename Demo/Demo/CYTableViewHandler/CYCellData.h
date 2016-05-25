//
//  CYCellData.h
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYViewDataProtocol.h"

@interface CYCellData : NSObject <CYViewData>

@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) id data;
@property (nonatomic, copy) NSString *performSegueID;

- (instancetype)initWithKey:(NSString *)key data:(id)data performSegueID:(NSString *)performSegueID;
@end
