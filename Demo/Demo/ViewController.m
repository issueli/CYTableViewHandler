//
//  ViewController.m
//  Demo
//
//  Created by StarHub on 16/5/24.
//  Copyright © 2016年 Coy. All rights reserved.
//

#import "ViewController.h"

#import "CYTableViewHandler/CYTableViewHandler.h"
#import "CustomCellData.h"
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
    
    CustomCellData *cell0 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];
    CustomCellData *cell1 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];
    CustomCellData *cell2 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];
    CustomCellData *cell3 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];
    CustomCellData *cell4 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];
    CustomCellData *cell5 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];
    CustomCellData *cell6 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];
    CustomCellData *cell7 = [[CustomCellData alloc] initWithReuseID:kCustomCellID data:@"CustomCell"];


    _items = @[@[cell0, cell1, cell2], @[cell3, cell4, cell5], @[cell6, cell7]];
    _tableViewHandler = [[CYTableViewHandler alloc] initWithItems:_items];
    
    [_tableViewHandler setCellConfigure:^(NSIndexPath *indexPath, id<CYCellData> item, UITableViewCell *cell) {
        [cell configure:cell item:item indexPath:indexPath];
    }];

    [_tableViewHandler handleDatasourceAndDelegateForTableView:_tableView];
    
}

@end
