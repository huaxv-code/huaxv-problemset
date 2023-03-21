# union 子句

`union` 子句可以合并两个 `select` 的查询结果.

=== "sql"

    ```sql
    select name from class_1 
        union distinct 
    select name from class_2;
    ```