# PyMySQL

安装第三方包：`PyMySQL`

=== "cmd"

    ```cmd
    pip install PyMySQL
    ```

---

=== "python"

    ```py
    import pymysql

    db = pymysql.connect (
        host = "127.0.0.1", # 数据库主机名.默认是用本地主机
        port = 3306,        # TCP端口.默认是3306
        user = "root",      # 数据库登陆名.默认是当前用户
        password = "123456",# 数据库登陆密码.默认为空
        db = "huaxv",       # 要使用的数据库名
        charset = "utf8"    # 数据库编码
    )   # 连接上数据库

    cur = db.cursor()       # 定义游标对象

    try: # 查询数据

        cur.execute("select * from Student")    # 执行 sql 语句

        # one_line = cur.fetchone()               # 获取一行数据

        # print(
        #     "name = " + one_line[0],
        #     "id = " + one_line[1],
        #     "sex = " + one_line[2],
        #     "score = " + one_line[3]
        # )

        all_lines = cur.fetchall()              # 获取所有数据

        for nd in all_lines:
            print(
                "name = " + nd[0],
                "id = " + nd[1],
                "sex = " + nd[2],
                "score = " + nd[3]
            )
        
        db.commit()                             # 将修改上传给数据库
    
    except:

        db.rollback()                           # 发生错误时回退

    try:

        cur.execute('drop table class_2') # 删除表格

        db.commit()

        cur.execute('create table class_2 (name varchar(20), id varchar(20), sex tinyint, score decimal(5, 2))') # 建表格

        db.commit()

        for i in range(1, 13):
            cur.execute( # 插入数据
                f"""
                insert into class_2 (
                    name, 
                    id, 
                    sex, 
                    score
                )
                
                values

                (
                    "{"student_" + (str(i) if i > 9 else "0" + str(i))}",
                    "{"211250120" + (str(i) if i > 9 else "0" + str(i))}",
                    0,
                    100.00
                )
                """
            )

            db.commit()

        cur.execute('select * from class_2')

        lines = cur.fetchall()

        for i in lines:
            print(
                *i
            )
        
        db.commit()

    except:
        db.rollback()

    db.close() # 关闭数据库服务
    ```