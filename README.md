# CYTableViewHandler
A more light-weighted view controller is resulted from the separation of tableview delegate and datasource.

## How to use ?

1. Create cell data inherit `CYViewData` Protocol.
2. Create table data, use `@[@[section0],@[section1],@[section2]]` 
3. Create custom cell & xib file, keep cell reuse id same with xib file name, and implement methods `UITableViewCell+Extension`.
4. Call method `handleDatasourceAndDelegateForTableView:`.

