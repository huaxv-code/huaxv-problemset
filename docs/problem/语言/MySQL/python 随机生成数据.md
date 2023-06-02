# python 随机生成数据

=== "随机生成 student 表"

    ```py
    import random
    import pymysql as sql

    db = sql.connect(
        host = "127.0.0.1",
        port = 3306,
        user = 'root',
        password = '123456',
        charset = 'utf8'
    )

    cr = db.cursor()

    cr.execute('create database if not exists learn')
    db.commit()

    cr.execute('use learn')
    db.commit()

    cr.execute('create table if not exists student (id varchar(50), name varchar(20), age int)')
    db.commit()

    def name():
        len = random.randint(3, 10)
        s = ""
        for i in range(len):
            s += chr(random.randint(0, 25) + ord('a'))
        return s

    ls = [i for i in range(1, 1001)]
    p = 0

    def id_():
        global p
        s = "2023000"
        t = random.randint(p, 1000 - 1)
        s += "%03d" % ls[t]
        k = ls[t]
        ls[t] = ls[p]
        ls[p] = k
        p += 1
        return s

    def age():
        return random.randint(16, 24)

    for i in range(1000):
        cmd = f'''
            insert into student (
                id, name, age
            )
            values (
                "{id_()}", "{name()}", {age()}
            );
        '''
        
        cr.execute(cmd)
        db.commit()
    ```

=== "随机生成 store 表"

    ```py
    import random
    import pymysql as sql

    db = sql.connect(
        host = "127.0.0.1",
        port = 3306,
        user = 'root',
        password = '123456',
        charset = 'utf8'
    )

    cr = db.cursor()

    cr.execute('create database if not exists learn')
    db.commit()

    cr.execute('use learn')
    db.commit()

    cr.execute('create table if not exists store (id varchar(50), name varchar(20), price_before double, price_now double)')
    db.commit()

    def name():
        len = random.randint(3, 10)
        s = ""
        for i in range(len):
            s += chr(random.randint(0, 25) + ord('a'))
        return s

    ls = [i for i in range(1, 1001)]
    p = 0

    def id_():
        global p
        s = "2023000"
        t = random.randint(p, 1000 - 1)
        s += "%03d" % ls[t]
        k = ls[t]
        ls[t] = ls[p]
        ls[p] = k
        p += 1
        return s

    def before():
        return random.random() * random.randint(1, 1000)

    def now():
        return before()

    for i in range(1000):
        cmd = f'''
            insert into store (
                id, name, price_before, price_now
            )
            values (
                "{id_()}", "{name()}", {before()}, {now()}
            );
        '''
        
        cr.execute(cmd)
        db.commit()
    ```