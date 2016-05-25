//
//  ViewController.m
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import "ViewController.h"

#import "CYTableViewHandler/CYTableViewHandler.h"
#import "CYCellData.h"
#define  kCustomCellID @"CustomCell"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) CYTableViewHandler *tableViewHandler;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configTableView {
    
    CYCellData *cell0 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];
    CYCellData *cell1 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];
    CYCellData *cell2 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];
    CYCellData *cell3 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];
    CYCellData *cell4 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];
    CYCellData *cell5 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];
    CYCellData *cell6 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];
    CYCellData *cell7 = [[CYCellData alloc] initWithKey:kCustomCellID data:@"CustomCell" performSegueID:nil];

    _items = @[@[cell0, cell1, cell2], @[cell3, cell4, cell5], @[cell6, cell7]];
    
    _tableViewHandler = [[CYTableViewHandler alloc] initWithItems:_items configureCellBlock:^(NSIndexPath *indexPath, id<CYViewData> item, UITableViewCell *cell) {
        
        [cell configure:cell item:item indexPath:indexPath];
        
    } cellHeightBlock:^CGFloat(NSIndexPath *indexPath, id<CYViewData> item) {
        return 40;
    } didSelectBlock:^(NSIndexPath *indexPath, id<CYViewData> item) {
        
        NSLog(@"selected cell at section: %d, row: %d", (int)indexPath.section, (int)indexPath.row);
        
    } headerBlock:^UIView *(NSInteger section) {
        
        return nil;
    } headerHeightBlock:^CGFloat(NSInteger section) {
        
        return 40.0;
    } footerBlock:^UIView *(NSInteger section) {
        
        return nil;
    } footerHeightBlock:^CGFloat(NSInteger section) {
        
        return 50.0f;
    }];
    
    [_tableViewHandler handleDatasourceAndDelegateForTableView:_tableView];
    
}

@end
