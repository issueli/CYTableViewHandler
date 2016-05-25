//
//  MSHTableDataSourceDelegate.h
//  MyStarHub
//
//  Created by StarHub on 16/5/18.
//  Copyright © 2016年 SCFESCO. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CYViewDataProtocol.h"

@interface UITableViewCell (Extension)

+ (void)registerTable:(UITableView *)table nibIdentifier:(NSString *)identifier ;

- (void)configure:(UITableViewCell *)cell item:(id<CYViewData>)item indexPath:(NSIndexPath *)indexPath ;

+ (CGFloat)heightWithItem:(id<CYViewData>)item indexPath:(NSIndexPath *)indexPath ;

@end
