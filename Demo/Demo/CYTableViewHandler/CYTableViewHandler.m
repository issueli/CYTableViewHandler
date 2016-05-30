//
//  CYTableViewHanlder.m
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import "CYTableViewHandler.h"
@interface CYTableViewHandler()

@property (nonatomic, strong) NSArray *items ;

@property (nonatomic, copy) CellConfigureBlock     cellConfigureBlock ;
@property (nonatomic, copy) CellHeightBlock        cellHeightBlock ;
@property (nonatomic, copy) CellDidSelectedBlock   celldidSelectedBlock ;

@property (nonatomic, copy) SectionViewBlock        headerBlock;
@property (nonatomic, copy) SectionViewHeightBlock  headerHeightBlock;

@property (nonatomic, copy) SectionViewBlock        footerBlock;
@property (nonatomic, copy) SectionViewHeightBlock  footerHeightBlock;

@end

@implementation CYTableViewHandler

- (instancetype)initWithItems:(NSArray *)items configureCellBlock:(CellConfigureBlock)configureBlock cellHeightBlock:(CellHeightBlock)heightBlock didSelectBlock:(CellDidSelectedBlock)didSelectedBlock
{
    
    self = [super init] ;
    if (self) {
        self.items = items ;
        self.cellConfigureBlock = configureBlock ;
        self.cellHeightBlock = heightBlock ;
        self.celldidSelectedBlock = didSelectedBlock ;
        self.headerBlock = nil;
        self.headerHeightBlock = nil;
        self.footerBlock = nil;
        self.footerHeightBlock = nil;
    }
    
    return self ;
}

- (instancetype)initWithItems:(NSArray *)items
           configureCellBlock:(CellConfigureBlock)configureBlock
              cellHeightBlock:(CellHeightBlock)heightBlock
               didSelectBlock:(CellDidSelectedBlock)didSelectedBlock
                  headerBlock:(SectionViewBlock)headerBlock
            headerHeightBlock:(SectionViewHeightBlock)headerHeightBlock
                  footerBlock:(SectionViewBlock)footerBlock
            footerHeightBlock:(SectionViewHeightBlock)footerHeightBlock {
    
    self = [super init] ;
    if (self) {
        self.items = items ;
        self.cellConfigureBlock = configureBlock ;
        self.cellHeightBlock = heightBlock ;
        self.celldidSelectedBlock = didSelectedBlock ;
        self.headerBlock = headerBlock;
        self.headerHeightBlock = headerHeightBlock;
        self.footerBlock = footerBlock;
        self.footerHeightBlock = footerHeightBlock;
    }
    
    return self ;
    
}

#pragma mark - Public Method -
- (id<CYViewData>)itemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *subItems = _items[indexPath.section];
    id item = subItems[indexPath.row];
    
    return item;
}

- (void)handleDatasourceAndDelegateForTableView:(UITableView *)tableView
{
    _tableView = tableView;
    
    tableView.dataSource = self;
    tableView.delegate   = self;
}

- (void)reloadWithItem:(NSArray *)items {
    
    self.items = items;
    
    [_tableView reloadData];
}
#pragma mark - UITableViewDataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *subItems = _items[section];
    return subItems.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<CYViewData> item = [self itemAtIndexPath:indexPath] ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.key] ;
    if (!cell) {
        [UITableViewCell registerTable:tableView nibIdentifier:item.key] ;
        cell = [tableView dequeueReusableCellWithIdentifier:item.key];
    }
    
    return cell ;
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<CYViewData> item = [self itemAtIndexPath:indexPath] ;
    _cellConfigureBlock(indexPath, item, cell);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<CYViewData> item = [self itemAtIndexPath:indexPath] ;
    return _cellHeightBlock(indexPath,item) ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<CYViewData> item = [self itemAtIndexPath:indexPath] ;
    _celldidSelectedBlock(indexPath,item) ;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (_headerBlock == nil) {
        return nil;
    }
    return _headerBlock(section);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (_headerHeightBlock == nil) {
        return 0.0f;
    }
    return _headerHeightBlock(section);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (_footerBlock == nil) {
        return nil;
    }
    return _footerBlock(section);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (_footerHeightBlock == nil) {
        return 0.0f;
    }
    return _footerHeightBlock(section);
}


@end
