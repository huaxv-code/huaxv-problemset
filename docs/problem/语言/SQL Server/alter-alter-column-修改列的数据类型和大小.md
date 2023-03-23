# alter-alter-column-修改列的数据类型和大小

=== "python"

    ```py
    run = '''
        alter table aa_t
            alter column id varchar(30) not null
    '''

    crs.execute(run)

    db.commit()
    ```