# Integer

## 构造

构造对象：

```java
Integer a = new Integer(100);

Integer b = new Integer("100");

Integer c = Integer.valueOf("100");
```

---

## compareTo

比较两个 `Integer` 对象的大小：

```java
Integer a = new Integer(114514);
Integer b = new Integer(415411);

int t = a.compareTo(b);
```

---

## Integer.parseInt

```java
int a = Integer.parseInt("114514");
```

## equals

推荐比较数值相同用 `equals`，不要用 `==`，否则可能逻辑错误，因为比较的地址:

```java
Integer a, b;
a = 114514;
b = 114514;
cout.println(a == b);      // 输出：false

cout.println(a.equals(b)); // 输出：true
```

## 类型转换

```java
Integer a = 114514;

byte b = a.byteValue();
short c = a.shortValue();
int d = a.intValue();
String e = a.toString();
```
