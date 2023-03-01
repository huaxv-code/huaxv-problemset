# BigDecimal

高精度浮点数运算.

---

头文件：

```java
import java.math.BigDecimal ;
```

## 类型转换

`String` 转 `BigDecimal`:

```java
BigDecimal a = new BigDecimal("3.141592653589793238462643383279");

cout.println(a);

cout.flush();
```

输出：

```
3.141592653589793238462643383279
```

---

不建议 `double` 或者 `float` 转 `BigDecimal`，比如：

```java
BigDecimal a = new BigDecimal(0.1);

cout.println(a);

cout.flush();
```

输出：

```
0.1000000000000000055511151231257827021181583404541015625
```

---

`BigDecimal` 转 `String`:

```java
BigDecimal a = new BigDecimal("3.141592653589793238462643383279000000000");

String s = a + "";

cout.println(s);

cout.flush();
```

输出：

```
3.141592653589793238462643383279000000000
```

---

转 `String` 去除末尾 $0$:

- **stripTrailingZeros**

```java
BigDecimal a = new BigDecimal("3.141592653589793238462643383279000000000");

String s = a.stripTrailingZeros() + "";

cout.println(s);

cout.flush();
```

输出：

```
3.141592653589793238462643383279
```

---

四舍五入保留 $4$ 位小数：

- **setScale(int, BigDecimal.ROUND_HALF_UP)**

```java
BigDecimal a = new BigDecimal("3.141592653589793238462643383279000000000");

String s = a.setScale(4, BigDecimal.ROUND_HALF_UP) + "";

cout.println(s);

cout.flush();
```

输出：

```
3.1416
```

## add、substract、multiply

加、减、乘大致一样

```java
BigDecimal a = new BigDecimal("3.141592653589793238462643383279000000000");
BigDecimal b = new BigDecimal("100");

cout.println(b.multiply(a.pow(2)).stripTrailingZeros());

cout.flush();
```

输出：

```
986.9604401089358618834490999872991420714831834895839696791841
```

## divide

高精度除法，要设定精度长度：

```java
BigDecimal a = new BigDecimal("2");
BigDecimal b = new BigDecimal("3");

// 精度到 30 位左右
cout.println(a.divide(b, 30, BigDecimal.ROUND_HALF_UP));

cout.flush();
```

输出：

```
0.666666666666666666666666666667
```