# alter-add-添加新列到末尾

=== "python"

    ```py
    run = '''
        alter table aa_t
            add name varchar(20)
    '''

    crs.execute(run)
    db.commit()
    ```