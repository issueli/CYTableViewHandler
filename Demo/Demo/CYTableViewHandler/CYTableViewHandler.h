//
//  CYTableViewHandler.h
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYViewDataProtocol.h"
#import "UITableViewCell+Extension.h"

typedef void    (^CellConfigureBlock)(NSIndexPath *indexPath, id<CYViewData> item, UITableViewCell *cell);
typedef CGFloat (^CellHeightBlock)(NSIndexPath *indexPath, id<CYViewData> item);
typedef void    (^CellDidSelectedBlock)(NSIndexPath *indexPath, id<CYViewData> item);

// For Footer & Header
typedef UIView* (^SectionViewBlock)(NSInteger section);
typedef CGFloat (^SectionViewHeightBlock)(NSInteger section);

@interface CYTableViewHandler : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items
           configureCellBlock:(CellConfigureBlock)configureBlock
              cellHeightBlock:(CellHeightBlock)heightBlock
               didSelectBlock:(CellDidSelectedBlock)didSelectedBlock;

- (instancetype)initWithItems:(NSArray *)items
           configureCellBlock:(CellConfigureBlock)configureBlock
              cellHeightBlock:(CellHeightBlock)heightBlock
               didSelectBlock:(CellDidSelectedBlock)didSelectedBlock
                  headerBlock:(SectionViewBlock)headerBlock
            headerHeightBlock:(SectionViewHeightBlock)headerHeightBlock
                  footerBlock:(SectionViewBlock)footerBlock
            footerHeightBlock:(SectionViewHeightBlock)footerHeightBlock;


- (void)handleDatasourceAndDelegateForTableView:(UITableView *)tableView;

- (id<CYViewData>)itemAtIndexPath:(NSIndexPath *)indexPath ;
@end
