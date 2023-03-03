# List

## ArrayList

**首推**，虽然空间开销会变大，但是时间复杂度很快，类似静态数组空间翻倍.

```java
List<Integer> as = ArrayList<>(); // 创建一个空数组（默认长度是 10）

int t = as.size(); // 0
```

---

```java
List<Integer> as = ArrayList(30);

int t = as.size(); // 0
```

---

尾部添加数据：

```java
List<Integer> as = new ArrayList<>(20);

for (int i = 1; i <= 10; i ++) {
    as.add(i);
}

for (int i = 0; i < 10; i ++) {
    Integer t = as.get(i); // 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
}
```

---

第 $i$ 个位置插入元素，剩下元素右移：

```java
List<Integer> as = new ArrayList<>();

for (int i = 0; i <= 10; i ++) {
    as.add(i);
}

as.add(0, 1);

for (int i = 0; i <= 11; i ++) {
    int t = as.get(i); // 1 0 1 2 3 4 5 6 7 8 9 10
}
```

---

修改第 $i$ 位置元素的值：

```java
List<Integer> as = new ArrayList<>();

for (int i = 0; i <= 10; i ++) {
    as.add(i);
}

// 翻转数值
for (int i = 0; i <= 5; i ++) {
    Integer t = as.get(i);
    as.set(i, as.get(10 - i));
    as.set(10 - i, t);
}
```

---

使用 `Collections.sort` 对链表排序：

```java
Collections.sort(as, new Comparator<Integer>() {
    public int compare(Integer a, Integer b) {
        int t = a.compareTo(b);
        return t;
    }
});
```

## LinkedList

初始化：

```java
List<Integer> as = new LinkedList<>();
```

---

尾部添加：

```java
List<Integer> as = new LinkedList<>();

for (int i = 0; i <= 10; i ++) {
    as.add(i);
}

for (int i = 0; i <= 10; i ++) {
    cout.println(as.get(i)); // 时间复杂度：O(n) 慢
}
```

---

在第 $i$ 个位置插入，剩下元素右移：

```java
List<Integer> as = new LinkedList<>();

for (int i = 0; i <= 10; i ++) {
    as.add(i);
}

as.add(0, 114514);

for (int i = 0; i <= 11; i ++) {
    cout.println(as.get(i)); // 114514 0 1 2 3 4 5 6 7 8 9 10 
}
```

---

修改第 $i$ 位置的值：

```java
List<Integer> as = new LinkedList<>();

for (int i = 0; i <= 10; i ++) {
    as.add(i);
}

as.set(0, 114514);

for (int i = 0; i <= 10; i ++) {
    cout.println(as.get(i)); // 114514 1 2 3 4 5 6 7 8 9 10 
}
```

---

获取元素数量：

```java
List<Integer> as = new LinkedList<>();

for (int i = 0; i <= 10; i ++) {
    as.add(i);
}

int t = as.size(); // 11

cout.println(t);
```