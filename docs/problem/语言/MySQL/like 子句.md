# like 子句

=== "sql"

    ```sql
    select * from Student where id like "520";   -- 查询 id = 520 的匹配项

    select * from Student where id like "520%";  -- 查询 id 中以 520 开头的匹配项

    select * from Student where id like "%520%"; -- 查询 id 中含有 520 的匹配项
    ```