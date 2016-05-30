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

/**
 *  Hold table view.
 */
@property (nonatomic, strong, readonly) UITableView *tableView;

/**
 *  Init Method.
 *
 *  @param items            tableView Data.
 *  @param configureBlock   Cell Configure Block
 *  @param heightBlock      Cell Height Block
 *  @param didSelectedBlock Cell DidSelected Block
 *
 *  @return TableViewHandler
 */
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


/**
 *  Handler tableView Delegate & DataSource.
 *
 *  @param tableView tableView
 */
- (void)handleDatasourceAndDelegateForTableView:(UITableView *)tableView;

/**
 *  Item index in Items Array.
 *
 *  @param indexPath indexPath.
 *
 *  @return item.
 */
- (id<CYViewData>)itemAtIndexPath:(NSIndexPath *)indexPath ;

/**
 *  Reload table view with new items.
 *
 *  @param items data arrays
 */
- (void)reloadWithItem:(NSArray *)items;
@end
