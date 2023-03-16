# select

## 查询某列

```sql
select age, name from girls;
```

![](./img/select1.png)

## 查询某列，并添加别名 

```sql
select age "年龄", name "女生名字" from girls;
```

![](./img/select2.png)

## 不显示重复的行

```java
select distinct * from loves;
```

![](./img/select3.png)