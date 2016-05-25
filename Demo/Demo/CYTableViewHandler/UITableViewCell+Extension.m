//
//  MSHTableDataSourceDelegate.h
//  MyStarHub
//
//  Created by StarHub on 16/5/18.
//  Copyright © 2016年 SCFESCO. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

#pragma mark --
+ (UINib *)nibWithIdentifier:(NSString *)identifier
{
    return [UINib nibWithNibName:identifier bundle:nil];
}

#pragma mark - Public
+ (void)registerTable:(UITableView *)table nibIdentifier:(NSString *)identifier
{
    [table registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier] ;
}

#pragma mark - Rewrite these func in SubClass ! -
- (void)configure:(UITableViewCell *)cell item:(id<CYViewData>)item indexPath:(NSIndexPath *)indexPath {
    
    // Rewrite this func in SubClass !
}

+ (CGFloat)heightWithItem:(id<CYViewData>)item indexPath:(NSIndexPath *)indexPath {
    
    // Rewrite this func in SubClass if necessary
    if (!item) {
        return 0.0f ; // if obj is null .
    }
    return 44.0f ; // default cell height
}

@end
