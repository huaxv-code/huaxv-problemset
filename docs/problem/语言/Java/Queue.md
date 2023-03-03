# Queue

## ArrayDeque

**首推**，牺牲空间换取时间.

其实使用 `LinkedList` 可能更快一些，少了扩容.

---

创建：

```java
java.util.Queue<Integer> qu = new ArrayDeque<>();
java.util.Queue<Integer> qu = new LinkedList<>();
```

---

获取元素个数：

```java
java.util.Queue<Integer> qu = new ArrayDeque<>();
java.util.Queue<Integer> qu = new LinkedList<>();

for (int i = 0; i <= 10; i ++) {
    qu.offer(i);
}

int t = qu.size(); // 11

cout.println(t);
```

---

判断队列是否为空：

```java
java.util.Queue<Integer> qu = new ArrayDeque<>();
java.util.Queue<Integer> qu = new LinkedList<>();

cout.println(qu.isEmpty()); // true
```

---

尾部插入：

```java
java.util.Queue<Integer> qu = new ArrayDeque<>();
java.util.Queue<Integer> qu = new LinkedList<>();

for (int i = 0; i <= 10; i ++) {
    qu.offer(i);
}

for (int i = 0; i <= 10; i ++) {
    cout.println(qu.poll()); // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
}
```

---

头部取出：

```java
java.util.Queue<Integer> qu = new ArrayDeque<>();
java.util.Queue<Integer> qu = new LinkedList<>();

for (int i = 0; i <= 10; i ++) {
    qu.offer(i);
}

for (int i = 0; i <= 10; i ++) {
    cout.println(qu.peek()); // 输出头部元素.
    // 0 0 0 0 0 0 0 0 0 0 0 
}

for (int i = 0; i <= 10; i ++) {
    cout.println(qu.poll()); // 拿出头部元素.
    // 0 1 2 3 4 5 6 7 8 9 10
}
```