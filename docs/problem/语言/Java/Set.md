# Set

创建：

```java
Set<Integer> st = new HashSet<>();
// 随机位置插入数据

Set<Integer> st = new LinkedHashSet<>();
// 保持插入顺序不变

Set<Integer> st = new TreeSet<>(
    (x, y) -> {
        return x - y;
    }
);
// 保持从小到大的顺序

Set<Integer> st = new TreeSet<>(
    (x, y) -> {
        return y - x;
    }
);
// 保持从大到小的顺序
```

---

获取元素个数：

```java
Set<Integer> st  = new HashSet<>();

for (int i = 0; i <= 10; i ++) {
    st.add(i);
}

int t = st.size();

cout.println(t); // 11
```

---

插入元素：

```java
Set<Integer> st = new TreeSet<>(
    (x, y) -> { return x - y; } // 按照从小到大的顺序
);

for (int i = 0; i <= 10; i ++) {
    st.add(i); // 插入元素
}

for (int k : st) { // 遍历 Set 的内容
    cout.print(k + "  ");
    // 0  1  2  3  4  5  6  7  8  9  10  
}
```

---

遍历

借助 `for each` 实现遍历

```java
Set<Integer> st = new TreeSet<>(
    (x, y) -> { return x - y; } // 按照从小到大的顺序
);

for (int i = 0; i <= 10; i ++) {
    st.add(i); // 插入元素
}

for (int k : st) { // 遍历 Set 的内容
    cout.print(k + "  ");
    // 0  1  2  3  4  5  6  7  8  9  10  
}
```

---

判断元素是否存在：

```java
Set<Integer> st = new TreeSet<>(
    (x, y) -> { return x - y; }
);

for (int i = 0; i <= 10; i ++) {
    st.add(i);
}

for (int i = 0; i <= 10; i ++) {
    cout.println(st.contains(i)); // true
}
```
