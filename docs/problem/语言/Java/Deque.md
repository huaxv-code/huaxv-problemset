# Deque

## ArrayDeque

**首推**

其实使用 `LinkedList` 可能更快一些，少了扩容.

---

创建：

```java
Deque<Integer> dq = new ArrayDeque<>();
```

---

获取元素个数：

```java
Deque<Integer> dp = new ArrayDeque<>();

for (int i = 0; i <= 10; i ++) {
    dp.offerFirst(i);
}

int t = dp.size();

cout.println(t); // 11
```

---

判断是否为空：

```java
Deque<Integer> dp = new ArrayDeque<>();

for (int i = 0; i <= 10; i ++) {
    dp.offerFirst(i);
}

boolean t = dp.isEmpty();

cout.println(t); // false
```

---

头部插入：

```java
Deque<Integer> dp = new ArrayDeque<>();

for (int i = 0; i <= 10; i ++) {
    dp.offerFirst(i); // 头部插入
}

for (int i = 0; i <= 10; i ++) {
    cout.println(dp.pollFirst()); // 头部取出
    // 10 9 8 7 6 5 4 3 2 1 0
}
```

---

尾部插入：

```java
Deque<Integer> dp = new ArrayDeque<>();

for (int i = 0; i <= 10; i ++) {
    dp.offerLast(i); // 尾部插入
}

for (int i = 0; i <= 10; i ++) {
    cout.println(dp.pollLast()); // 尾部取出
    // 10 9 8 7 6 5 4 3 2 1 0 
}
```

---

获取头部元素：

```java
Deque<Integer> dp = new ArrayDeque<>();

for (int i = 0; i <= 10; i ++) {
    dp.offerLast(i); // 尾部插入
}

cout.println(dp.peekFirst()); // 0
cout.println(dp.pollLast()); // 0
```

---

获取尾部元素：

```java
Deque<Integer> dp = new ArrayDeque<>();

for (int i = 0; i <= 10; i ++) {
    dp.offerLast(i); // 尾部插入
}

cout.println(dp.peekLast()); // 10
cout.println(dp.pollLast()); // 10
```