# String

## charAt

返回指定索引的字符：

```java
String a = new String("hello world\n");

char c = a.charAt(4);
```

## compareTo

与其他字符串比较：

- 相同为：0
- 以大比小：正
- 以小比大：负

```java
String a = new String("hello");
String b = new String("helle");

int x = a.compareTo(b); // o - e
int y = b.compareTo(a); // e - o
int z = a.compareTo(a); // o - o
```

## compareToIgnoreCase

与其他字符串比较，并忽略大小写.

## concat

返回字符串拼接值

```java
String a = new String ("hello ");
String b = new String ("world");

String c = a.concat(b); // hello world
```

## length

放回字符串的长度

```java
String a = new String ("hello world");

int t = a.length(); // 11
```

