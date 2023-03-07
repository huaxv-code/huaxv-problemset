# Java 数据结构

## String

1. `String.length()`：返回字符串长度
2. `String.charAt(int)`：返回字符串索引值
3. `String.compareTo(String)`：字符串比较
4. `String + String`：字符串拼接

## List

1. `List<Integer> as = new ArrayList<>(size)`：创建链表，指定底层数组长度，但链表长度仍为 $0$
2. `List.size()`：链表元素个数
3. `List.add(Integer)`：尾部添加数据
4. `List.add(pos, Integer)`：第 $pos$ 位置处插入元素
5. `List.set(pos, Integer)`：第 $pos$ 位置处修改值
6. `List.get(pos)`：获取第 $pos$ 位置的值

## Queue

1. `java.util.Queue<Integer> as = new ArrayDeque<>()`：创建队列
2. `Queue.size()`：获取元素个数
3. `Queue.isEmpty()`：判断队列是否为空
4. `Queue.offer(Integer)`：插入元素
5. `Queue.peek()`：获取元素
6. `Queue.poll()`：拿出元素

## 优先队列

将底层数据结构改成：`PriorityQueue<>()` 就行，其他操作一样

1. `java.util.Queue<Integer> pq = new PriorityQueue<>((x, y) -> { return x - y; })` 优先队列

## Deque

1. `Deque<Integer> as = new ArrayDeque<>()`：创建双端队列
2. `Deque.size()`：获取元素个数
3. `Deque.isEmpty()`：判断是否为空
4. `Deque.offerFirst(Integer)`：左边插入元素
5. `Deque.offerLast(Integer)`：右边插入元素
6. `Deque.pollFirst(Integer)`：左边拿出元素
7. `Deque.pollLast(Integer)`：右边拿出元素
8. `Deque.peekFirst(Integer)`：左边获取元素
9. `Deque.peekLast(Integer)`：右边获取元素

# Deque -> Queue

用双端队列实现普通队列：

1. `Deque.offer(Integer)`：插入元素
2. `Deque.peek()`：获取元素
3. `Deque.poll()`：拿出元素

# Deque -> Stack

用双端队列实现普通栈：

1. `Deque.push(Integer)`：插入元素
2. `Deque.peek(Integer)`：获取元素
3. `Deque.pop(Integer)`：拿出元素

## Set

1. `Set<Integer> st = new HashSet<>()`：哈希集合
2. `Set<Integer> st = new TreeSet<>((x, y) -> { return x - y })`：从小到大排序的集合
3. `Set.size()`：返回元素个数
4. `Set.add(Integer)`：插入元素
5. `Set.contains(Integer)`：判断元素是否存在
6. `for (Integer x : Set) {}`：遍历元素

## Map

1. `Map<Integer, Integer> st = new HashMap<>()`：哈希字典
2. `Map<Integer> st = new TreeMap<>((x, y) -> { return x - y; })`：从小到大排序的字典
3. `Map.size()`：元素个数
4. `Map.put(key, Integer)`：键值对插入
5. `Map.containsKey(key)`：判断键是否存在
6. `Map.get(key)`：获取键的值
7. `Map.forEach((key, value) -> { cout.println(key + " " + value); })`：按键值对来遍历