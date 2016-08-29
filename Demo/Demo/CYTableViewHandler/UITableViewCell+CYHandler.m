//
//  UITableViewCell+CYHandler.m
//  Demo
//
//  Created by Yi Li on 16/8/29.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import "UITableViewCell+CYHandler.h"

@implementation UITableViewCell (CYHandler)

#pragma mark - Helper -
+ (UINib *)nibWithIdentifier:(NSString *)identifier
{
    return [UINib nibWithNibName:identifier bundle:nil];
}

#pragma mark - Public -
+ (void)registerTable:(UITableView *)table nibIdentifier:(NSString *)identifier
{
    [table registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier] ;
}

#pragma mark - Rewrite these func in SubClass -
- (void)configure:(UITableViewCell *)cell item:(id<CYCellData>)item indexPath:(NSIndexPath *)indexPath {
    
    // Rewrite this func in SubClass !
}

+ (CGFloat)heightWithItem:(id<CYCellData>)item indexPath:(NSIndexPath *)indexPath {
    
    // Rewrite this func in SubClass if necessary
    if (!item) {
        return 0.0f ; // if obj is null .
    }
    return 44.0f ; // default cell height
}
@end
