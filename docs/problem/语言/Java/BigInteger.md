# BigInteger

高精度整数

---

头文件：

```java
import java.math.BigInteger ;
```

## 类型转换

---

`String` 转 `Biginteger`:

```java
Biginteger a = new Biginteger("-114514");
```

---

`long` 转 `Biginteger`:

```java
// 第一种
Biginteger a = new BigInteger(-114514L + "");

// 第二种
Biginteger a = BigInteger.valueOf(-114514L);
```

---

转成 `String`:

```java
BigInteger a = new BigInteger("114514");

// 方法一
String s = a.toString(10); // 转成 10 进制下的字符串

// 方法二
String s = a + "";
```

---

## add

高精度加法：

```java
BigInteger a, b;

a = new BigInteger("-114514000000");
b = new BigInteger("-114514");

cout.println(a.add(b));
cout.println(a); // a.add(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
-114514114514
-114514000000
```

## subtract

高精度减法：

```java
BigInteger a, b;

a = new BigInteger("-114514114514");
b = new BigInteger("-114514");

cout.println(a.subtract(b));
cout.println(a); // a.subtract(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
-114514000000
-114514114514
```

## multiply

高精度乘法：

```java
BigInteger a, b;

a = new BigInteger("114514");
b = new BigInteger("100001");

cout.println(a.multiply(b));
cout.println(a); // a.multiply(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
11451514514
114514
```

## divide

高精度除法：(截断除法，或者称呼为「趋 0 取整」)

```java
BigInteger a, b;

a = new BigInteger("3");
b = new BigInteger("5");

cout.println(a.divide(b));
cout.println(a); // a.divide(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
0
3
```

---

```java
BigInteger a, b;

a = new BigInteger("-3");
b = new BigInteger("5");

cout.println(a.divide(b));
cout.println(a); // a.divide(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
0
-3
```

---

```java
BigInteger a, b;

a = new BigInteger("-13");
b = new BigInteger("5");

cout.println(a.divide(b));
cout.println(a); // a.divide(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
-2
-13
```

## mod

高精度取模：

```java
BigInteger a, b;

a = new BigInteger("114514114514");
b = new BigInteger("1000000");

cout.println(a.mod(b));
cout.println(a); // a.mod(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
114514
114514114514
```

## 幂方

高精度幂：

```java
BigInteger a;

a = new BigInteger("114514");
int b = 114514;

cout.println(a.pow(b));
cout.println(a); // a.pow(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
天空之数
114514
```

## gcd

最大公约数：

```java
BigInteger a, b;

a = new BigInteger("114514");
b = new BigInteger("415411");

cout.println(a.gcd(b));
cout.println(a); // a.gcd(b) 并不会改变 a、b 的值

cout.flush();
```

输出：

```
1
114514
```

## abs

绝对值：

```java
BigInteger a, b;

a = new BigInteger("-114514");

cout.println(a.abs());
cout.println(a); // a.abs() 并不会改变 a、b 的值

cout.flush();
```

输出：

```
114514
-114514
```

## negate

取反：

```java
BigInteger a, b;

a = new BigInteger("114514");

cout.println(a.negate());
cout.println(a); // a.abs() 并不会改变 a、b 的值

cout.flush();
```

输出：

```
-114514
114514
```

## compareTo

比较大小：

- 相同为 ------ 0
- 以大比小为 -- 正
- 以小比大为 -- 负

```java
BigInteger a, b;

a = new BigInteger("114514114514");
b = new BigInteger("114514");

cout.println(a.compareTo(b));
cout.println(b.compareTo(a));
cout.println(a.compareTo(a));
cout.println(a); // compareTo 并不会改变 a、b 的值

cout.flush();
```

输出：

```
1
-1
0
114514114514
```