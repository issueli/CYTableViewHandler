//
//  CustomCell.m
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
@implementation CustomCell

- (void)configure:(UITableViewCell *)cell item:(id<CYViewData>)item indexPath:(NSIndexPath *)indexPath {
    
    if ([item.data isKindOfClass:[NSString class]]) {
        _label.text = item.data;
    }
}

@end
