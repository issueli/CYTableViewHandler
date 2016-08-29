# CYTableViewHandler
A more light-weighted view controller is resulted from the separation of tableview delegate and datasource.

## How to use ?

1. Create cell data inherit `CYCellData` Protocol.
2. Create table data, use `@[@[section0],@[section1],@[section2]]` 
3. Create custom cell & xib file, keep cell reuse id same with xib file name, and implement methods `UITableViewCell+CYHandler`.
4. Set table view block: 

    ```
    [_tableViewHandler setCellConfigure:
    ^(NSIndexPath *indexPath, id<CYCellData> item, UITableViewCell *cell) {
        [cell configure:cell item:item indexPath:indexPath];
    }];
    ```
5. Call method `handleDatasourceAndDelegateForTableView:`.

## TODO:
1. Further improve the function.
2. Integrated cocoapods & carthage.

