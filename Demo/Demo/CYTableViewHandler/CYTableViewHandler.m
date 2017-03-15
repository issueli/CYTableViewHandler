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

@end

@implementation CYTableViewHandler

- (instancetype)initWithItems:(NSArray *)items {
    
    self = [super init];
    
    if (self) {
        self.items = items;
    }
    return self;
}

#pragma mark - Public Method -

- (id<CYCellData>)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *subItems = _items[indexPath.section];
    id item = subItems[indexPath.row];
    
    return item;
}

- (void)handleTableView:(UITableView *)tableView {
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *subItems = _items[section];
    return subItems.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<CYCellData> item = [self itemAtIndexPath:indexPath] ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.reuseID] ;
    if (!cell) {
        [UITableViewCell registerTable:tableView nibIdentifier:item.reuseID] ;
        cell = [tableView dequeueReusableCellWithIdentifier:item.reuseID];
    }
    
    return cell ;
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_cellConfigure == nil) {
        return;
    }
    
    id<CYCellData> item = [self itemAtIndexPath:indexPath] ;
    _cellConfigure(indexPath, item, cell);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_cellHeight == nil) {
        return 44.0;
    }
    
    id<CYCellData> item = [self itemAtIndexPath:indexPath] ;
    return _cellHeight(indexPath,item) ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_celldidSelect == nil) {
        return;
    }
    
    id<CYCellData> item = [self itemAtIndexPath:indexPath] ;
    _celldidSelect(indexPath,item) ;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (_header == nil) {
        return nil;
    }
    return _header(section);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (_headerHeight == nil) {
        return 0.0f;
    }
    return _headerHeight(section);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (_footer == nil) {
        return nil;
    }
    return _footer(section);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (_footerHeight == nil) {
        return 0.0f;
    }
    return _footerHeight(section);
}


@end
