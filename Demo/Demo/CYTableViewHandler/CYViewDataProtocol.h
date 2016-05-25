//
//  CYViewDataProtocol.h
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#ifndef CYViewDataProtocol_h
#define CYViewDataProtocol_h

@protocol CYViewData <NSObject>

// For Table View and Collection View , "Key" == "Cell Identifier"
@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) id data;

@end

#endif /* CYViewDataProtocol_h */
