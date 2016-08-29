//
//  UITableViewCell+CYHandler.h
//  Demo
//
//  Created by Yi Li on 16/8/29.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYCellData.h"

@interface UITableViewCell (CYHandler)

+ (void)registerTable:(UITableView *)table nibIdentifier:(NSString *)identifier;

- (void)configure:(UITableViewCell *)cell item:(id<CYCellData>)item indexPath:(NSIndexPath *)indexPath;

+ (CGFloat)heightWithItem:(id<CYCellData>)item indexPath:(NSIndexPath *)indexPath;

@end
