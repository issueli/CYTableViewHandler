//
//  CYCellData.m
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import "CYCellData.h"

@implementation CYCellData

- (instancetype)initWithKey:(NSString *)key data:(id)data performSegueID:(NSString *)performSegueID {
    
    if (self = [super init]) {
        
        _key = key;
        _data = data;
        _performSegueID = performSegueID;
    }
    
    return self;
}
@end
