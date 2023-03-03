# Map

创建：

```java
Map<Integer, Integer> mp = new HashMap<>();
// 随机插入，顺序快

Map<Integer, Integer> mp = new LinkedHashMap<>();
// 按照插入的顺序

Map<Integer, Integer> mp = new TreeMap<>(
    (x, y) -> { return x - y; };
);
// 按照从小到大的顺序

Map<Integer, Integer> mp = new TreeMap<>(
    (x, y) -> { return y - x; }
);
// 按照从大到小的顺序
```

---

获取元素个数：

```java
Map<Integer, Integer> mp = new TreeMap<>(
    (x, y) -> { return x - y; }
);

for (int i = 0; i <= 10; i ++) {
    mp.put(i, 0); // 按照 <key, val> 插入
}

int t = mp.size();

cout.println(t); // 11
```

---

按照键值插入：

```java
Map<Integer, Integer> mp = new TreeMap<>(
    (x, y) -> { return x - y; }
);

for (int i = 0; i <= 10; i ++) {
    mp.put(i, 0); // 插入：<i, 0>
}
```

---

判断键是否存在：

```java
Map<Integer, Integer> mp = new TreeMap<>(
    (x, y) -> { return x - y; }
);

for (int i = 0; i <= 10; i ++) {
    mp.put(i, 0);
}

for (int i = 0; i <= 10; i ++) {
    cout.println(mp.containsKey(i)); // true
}
```

---

获取 `key` 对应的 `value` 值：

```java
Map<Integer, Integer> mp = new TreeMap<>(
    (x, y) -> { return x - y; }
);

for (int i = 0; i <= 10; i ++) {
    mp.put(i, i * i);
}

for (int i = 0; i <= 10; i ++) {
    if (mp.containsKey(i)) {
        cout.print(mp.get(i) + " ");
        // 0 1 4 9 16 25 36 49 64 81 100 
    }
}
```