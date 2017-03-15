//
//  CYTableViewHandler.h
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYCellData.h"
#import "UITableViewCell+CYHandler.h"

typedef void    (^CellConfigureBlock)(NSIndexPath *indexPath, id<CYCellData> item, UITableViewCell *cell);
typedef CGFloat (^CellHeightBlock)(NSIndexPath *indexPath, id<CYCellData> item);
typedef void    (^CellDidSelectedBlock)(NSIndexPath *indexPath, id<CYCellData> item);

// For Footer & Header
typedef UIView* (^SectionViewBlock)(NSInteger section);
typedef CGFloat (^SectionViewHeightBlock)(NSInteger section);

@interface CYTableViewHandler : NSObject <UITableViewDelegate, UITableViewDataSource>

/**
 *  Hold table view.
 */
@property (nonatomic, strong, readonly) UITableView *tableView;


@property (nonatomic, copy) CellConfigureBlock     cellConfigure;
@property (nonatomic, copy) CellHeightBlock        cellHeight;
@property (nonatomic, copy) CellDidSelectedBlock   celldidSelect;

@property (nonatomic, copy) SectionViewBlock        header;
@property (nonatomic, copy) SectionViewHeightBlock  headerHeight;

@property (nonatomic, copy) SectionViewBlock        footer;
@property (nonatomic, copy) SectionViewHeightBlock  footerHeight;


/**
 *  Init Method.
 *
 *  @param items            tableView Data.
 */
- (instancetype)initWithItems:(NSArray *)items;


/**
 *  Handler tableView Delegate & DataSource.
 *
 *  @param tableView tableView
 */
- (void)handleTableView:(UITableView *)tableView;

/**
 *  Item index in Items Array.
 *
 *  @param indexPath indexPath.
 *
 *  @return item.
 */
- (id<CYCellData>)itemAtIndexPath:(NSIndexPath *)indexPath ;

/**
 *  Reload table view with new items.
 *
 *  @param items data arrays
 */
- (void)reloadWithItem:(NSArray *)items;


- (void)setCellConfigure:(CellConfigureBlock)cellConfigure;
- (void)setCellHeight:(CellHeightBlock)cellHeight;
- (void)setCelldidSelect:(CellDidSelectedBlock)celldidSelect;
- (void)setHeader:(SectionViewBlock)header;
- (void)setHeaderHeight:(SectionViewHeightBlock)headerHeight;
- (void)setFooter:(SectionViewBlock)footer;
- (void)setFooterHeight:(SectionViewHeightBlock)footerHeight;
@end
