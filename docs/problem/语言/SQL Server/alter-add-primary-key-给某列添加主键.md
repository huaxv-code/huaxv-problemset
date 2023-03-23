# alter-add-primary-key-给某列添加主键

=== "python"

    ```py
    run = '''
        alter table aa_t
            add primary key(id)
    '''

    crs.execute(run)

    db.commit()
    ```