# [Java 组代码模板]()

## 代码片段

```java
import java.util.*;
import java.io.*;
import java.math.*;

public class Main 
{
    
    final int N = 500000; // 1e6 已经快超时了


    

    
    public void solve() throws Exception 
    {
        
        
        
    }

    public static void main(String[] args) throws Exception 
    {
        
        Main cmd = new Main();
        cmd.solve();
        cout.flush();
        
    }

    public static String space = "\\s+"; 

    public static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
    public static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));

    public static String[] gss() throws Exception
    {
        return cin.readLine().split(space);
    }

    public static int gii(String s) 
    {
        return Integer.parseInt(s);
    }

    public static long gll(String s) 
    {
        return Long.parseLong(s);
    }

    public static double gff(String s) 
    {
        return Double.parseDouble(s);
    }
}
```

## 快速排序

时间复杂度：$O(nlog(n))$

```java
int n;
int[] a = new int[N];

void qsort(int l, int r)
{
    if (l >= r) return;
    int x = a[(l + r) >> 1];
    int i = l - 1, j = r + 1;
    while (i < j)
    {
        while (a[++ i] < x);
        while (a[-- j] > x);
        if (i < j)
        {
            int t = a[i];
            a[i] = a[j];
            a[j] = t;
        }
    }
    qsort(l, j);
    qsort(j + 1, r);
}

public void solve() throws Exception 
{
    
    String[] ts = gss();
    n = gii(ts[0]);
    ts = gss();
    for (int i = 1; i <= n; i ++)
    {
        a[i] = gii(ts[i - 1]);
    }

    qsort(1, n);
    for (int i = 1; i <= n; i ++)
        cout.print(a[i] + " ");
    cout.println();
}
```

## 快速排序找第 k 个数

时间复杂度：$O(n)$

```java
int n, k;
int[] a = new int[N];

int qsort(int l, int r, int k)
{
    if (l == r) return a[l];
    int x = a[(l + r) >> 1];
    int i = l - 1, j = r + 1;
    while (i < j)
    {
        while (a[++ i] < x);
        while (a[-- j] > x);
        if (i < j)
        {
            int t = a[i];
            a[i] = a[j];
            a[j] = t;
        }
    }
    if (k <= j) return qsort(l, j, k);
    else return qsort(j + 1, r, k);
}


void solve() throws Exception
{
    
    String[] ts = gss();
    n = gii(ts[0]);
    k = gii(ts[1]);
    ts = gss();
    
    for (int i = 1; i <= n; i ++)
    {
        a[i] = gii(ts[i - 1]);
    }
    
    cout.println(qsort(1, n, k));
    
}
```

## 归并排序

```java
int n;
int[] a = new int[N];
int[] b = new int[N];

void meld(int l, int r)
{
	if (l >= r) return;
	int mid = (l + r) >> 1;
	meld(l, mid);
	meld(mid + 1, r);
	int i = l, j = mid + 1;
	int k = 0;
	while (i <= mid && j <= r)
	{
		if (a[i] <= a[j]) b[k ++] = a[i ++];
		else b[k ++] = a[j ++];
	}
	while (i <= mid) b[k ++] = a[i ++];
	while (j <= r) b[k ++] = a[j ++];
	i = l;
	j = 0;
	while (i <= r) a[i ++] = b[j ++];
}


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gii(ts[i - 1]);
	}
	meld(1, n);
	for (int i = 1; i <= n; i ++)
	{
		cout.print(a[i] + " ");
	}
	cout.println();
	
}
```

## 归并排序逆序对

```java
int n;
int[] a = new int[N];
int[] b = new int[N];

long meld(int l, int r)
{
	if (l >= r) return 0;
	int mid = (l + r) >> 1;
	long res = 0;
	res += meld(l, mid);
	res += meld(mid + 1, r);
	int i = l, j = mid + 1, k = 0;
	while (i <= mid && j <= r)
	{
		if (a[i] <= a[j])
		{
			b[k ++] = a[i ++];
		}
		else
		{
			b[k ++] = a[j ++];
			res += mid - i + 1;
		}
	}
	while (i <= mid) b[k ++] = a[i ++];
	while (j <= r) b[k ++] = a[j ++];
	i = l;
	j = 0;
	while (i <= r) a[i ++] = b[j ++];
	return res;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gii(ts[i - 1]);
	}
	cout.println(meld(1, n));
}
```

## 二分查找

```java
int n, q;
int[] a = new int[N];

int lf(int x)
{
	int l = 1, r = n, mid;
	while (l < r)
	{
		mid = (l + r) >> 1;
		if (a[mid] < x) l = mid + 1;
		else r = mid;
	}
	if (a[r] == x) return r - 1;
	else return -1;
}

int rf(int x)
{
	int l = 1, r = n, mid;
	while (l < r)
	{
		mid = (l + r + 1) >> 1;
		if (a[mid] <= x) l = mid;
		else r = mid - 1;
	}
	if (a[l] == x) return l - 1;
	else return -1;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	q = gii(ts[1]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gii(ts[i - 1]);
	}
	
	Arrays.sort(a, 1, n + 1);
	
	while (q -- > 0)
	{
		ts = gss();
		int x = gii(ts[0]);
		cout.println(lf(x) + " " + rf(x));
	}
	
}
```

## 二分查找-数的三次方根

```java
double n;

double f(double n)
{
	double l = Math.min(n, -1);
	double r = Math.max(1, n);
	double mid;
	double ep = 1e-7;
	while (Math.abs(l - r) > ep)
	{
		mid = (l + r) / 2;
		if (Math.pow(mid, 3) < n) l = mid;
		else r = mid;
	}
	return l;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gff(ts[0]);
	
	cout.printf("%.6f\n", f(n));
}
```

## 高精度加法

```java
int[] a = new int[N];
int[] b = new int[N];
int[] c = new int[N];
int n, m;

int cg(int[] a, String s)
{
	if (s.equals("0")) 
	{
		a[0] = 0; return 1;
	}
	int n = s.length();
	for (int i = n - 1, j = 0; i >= 0; i --, j ++)
	{
		a[j] = (int)(s.charAt(i) - '0');
	}
	return n;
}


void solve() throws Exception
{
	
	n = cg(a, gss()[0]);
	m = cg(b, gss()[0]);
	
	int t = 0;
	int i = 0;
	
	for (; i < n || i < m || t > 0; i ++)
	{
		if (i < n) t += a[i];
		if (i < m) t += b[i];
		c[i] = t % 10;
		t /= 10;
	}
	
	for (int j = i - 1; j >= 0; j --)
	{
		cout.print(c[j]);
	}
	cout.println();
	
}
```

## 高精度减法

```java
int[] a = new int[N];
int[] b = new int[N];
int[] c = new int[N];
int n, m;
int tp = 1;

int cg(int[] a, String s)
{
	int n = s.length();
	if (s.equals("0")) return n;
	for (int i = n - 1, j = 0; i >= 0; i --, j ++)
	{
		a[j] = (int)(s.charAt(i) - '0');
	}
	return n;
}

void solve() throws Exception
{
	
	n = cg(a, gss()[0]);
	m = cg(b, gss()[0]);
	
	if (n < m) 
	{
		int[] t = a;
		a = b; b = t;
		tp = -1;
		int ti = n;
		n = m; m = ti;
	}
	if (n == m)
	{
		for (int i = n - 1; i >= 0; i --)
		{
			if (a[i] == b[i]) continue;
			if (a[i] < b[i])
			{
				int[] t = a;
				a = b; b = t;
				tp = -1;
				int ti = n;
				n = m; m = ti;
			}
			break;
		}
	}
	
	int t = 0;
	for (int i = 0; i < n || t != 0; i ++)
	{
		c[i] = a[i] - b[i] + t;
		t = 0;
		while (c[i] < 0)
		{
			t --;
			c[i] += 10;
		}
	}
	while (n > 1 && c[n - 1] == 0) n --;
	if (tp == -1) cout.print("-");
	for (int i = n - 1; i >= 0; i --) 
		cout.print(c[i]);
	cout.println();
	
}
```


## 前缀和

```java
int n, q;
long[] a = new long[N];
long[] sm = new long[N];


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	q = gii(ts[1]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gll(ts[i - 1]);
		sm[i] = sm[i - 1] + a[i];
	}
	while (q -- > 0)
	{
		int x, y;
		ts = gss();
		x = gii(ts[0]);
		y = gii(ts[1]);
		cout.println(sm[y] - sm[x - 1]);
	}
	
}
```

## 二维前缀和

```java
int n, m, q;
long[][] a;
long[][] sm;


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	m = gii(ts[1]);
	q = gii(ts[2]);
	
	a = new long[n + 100][m + 100];
	sm = new long[n + 100][m + 100];
	
	for (int i = 1; i <= n; i ++)
	{
		ts = gss();
		for (int j = 1; j <= m; j ++)
		{
			a[i][j] = gll(ts[j - 1]);
		}
	}
	
	for (int i = 1; i <= n; i ++)
	{
		for (int j = 1; j <= m; j ++)
		{
			sm[i][j] = sm[i][j - 1] + a[i][j];
		}
	}
	
	for (int i = 1; i <= n; i ++)
	{
		for (int j = 1; j <= m; j ++)
		{
			sm[i][j] += sm[i - 1][j];
		}
	}
	
	while (q -- > 0)
	{
		int x1, y1, x2, y2;
		ts = gss();
		x1 = gii(ts[0]);
		y1 = gii(ts[1]);
		x2 = gii(ts[2]);
		y2 = gii(ts[3]);
		
		long res = sm[x2][y2] + sm[x1 - 1][y1 - 1]
				- sm[x2][y1 - 1] - sm[x1 - 1][y2];
		cout.println(res);
	}
	
}
```

## 差分

```java
int n, q;
long[] a = new long[N]; 
long[] dv = new long[N];


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	q = gii(ts[1]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gll(ts[i - 1]);
		dv[i] = a[i] - a[i - 1];
	}
	
	while (q -- > 0)
	{
		int x, y, k;
		ts = gss();
		x = gii(ts[0]);
		y = gii(ts[1]);
		k = gii(ts[2]);
		dv[x] += k;
		dv[y + 1] -= k;
	}
	
	for (int i = 1; i <= n; i ++)
		dv[i] += dv[i - 1];
	
	for (int i = 1; i <= n; i ++)
	{
		cout.print(dv[i] + " ");
	}
}
```

## 二维差分

![](./img/二维差分.png)

假设我知道了蓝色框范围内的和、紫色框范围内的和、红色框范围内的和我要如何求得小方块的面积呢？

二维差分：`dv[i][j] = a[i][j] - a[i - 1][j] - a[i][j - 1] + a[i - 1][j - 1]`

**差分数组的前缀和就是原数组**

借助影响范围，实现区域递增.

```java
int n, m, q;
long[][] a;
long[][] dv;


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	m = gii(ts[1]);
	q = gii(ts[2]);
	
	a = new long[n + 100][m + 100];
	dv = new long[n + 100][m + 100];
	
	for (int i = 1; i <= n; i ++)
	{
		ts = gss();
		for (int j = 1; j <= m; j ++)
		{
			a[i][j] = gii(ts[j - 1]);
		}
	}
	
	// 求出二维差分数组
	for (int i = 1; i <= n; i ++)
	{
		for (int j = 1; j <= m; j ++)
		{
			dv[i][j] = a[i][j] - a[i - 1][j]
						- a[i][j - 1] + a[i - 1][j - 1];
		}
	}
	
	while (q -- > 0)
	{
		int x1, y1, x2, y2, k;
		ts = gss();
		x1 = gii(ts[0]);
		y1 = gii(ts[1]);
		x2 = gii(ts[2]);
		y2 = gii(ts[3]);
		k = gii(ts[4]);
		
		dv[x1][y1] += k;
		dv[x2 + 1][y1] -= k;
		dv[x1][y2 + 1] -= k;
		dv[x2 + 1][y2 + 1] += k;
	}
	
	for (int i = 1; i <= n; i ++)
	{
		for (int j = 1; j <= m; j ++)
		{
			dv[i][j] += dv[i][j - 1];
		}
	}
	
	for (int i = 1; i <= n; i ++)
	{
		for (int j = 1; j <= m; j ++)
		{
			dv[i][j] += dv[i - 1][j];
		}
	}
	
	for (int i = 1; i <= n; i ++)
	{
		for (int j = 1; j <= m; j ++)
		{
			cout.print(dv[i][j] + " ");
		}
		cout.println();
	}
}
```

## 双指针+哈希：最长不重复子数组

```java
int n;
int[] a = new int[N];
int[] hs = new int[N];


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gii(ts[i - 1]);
	}
	
	int i = 1, j = 1;
	int res = 0;
	
	while (j <= n)
	{
		if (hs[a[j]] == 0)
		{
			hs[a[j ++]] ++;
		}
		else
		{
			res = Math.max(res, j - i);
			while (a[i] != a[j]) hs[a[i ++]] --;
			i ++; j ++;
		}
	}
	
	res = Math.max(res, j - i);
	
	cout.println(res);
	
}
```

## 二分形式的双指针

```java
int n, m;
long x;
long[] a = new long[N];
long[] b = new long[N];


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	m = gii(ts[1]);
	x = gll(ts[2]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gll(ts[i - 1]);
	}
	ts = gss();
	for (int i = 1; i <= m; i ++)
	{
		b[i] = gll(ts[i - 1]);
	}
	
	int i = 1, j = m;
	while (i <= n && j > 0)
	{
		long t = a[i] + b[j];
		if (t == x)
		{
			cout.println((i - 1) + " " + (j - 1));
			return;
		}
		else if (t < x) i ++;
		else j --;
	}
	
}
```

## lowbit

```java
long lowbit(long x)
{
	return -x & x;
}
```

## KMP

```java
int n, m;
String a, b;

int[] kmp(String s)
{
	int n = s.length();
	int[] ne = new int[n + 100];
	ne[0] = -1;
	int i = -1, j = 0;
	while (j < n)
	{
		if (i == - 1 || s.charAt(i) == s.charAt(j))
		{
			ne[++ j] = ++ i;
		}
		else i = ne[i];
	}
	return ne;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	a = gss()[0];
	m = gii(gss()[0]);
	b = gss()[0];
	
	int[] ne = kmp(a);
	
	int i = 0, j = 0;
	while (j < m)
	{
		if (i == -1 || a.charAt(i) == b.charAt(j))
		{
			if (i == n - 1)
			{
				cout.print((j - i) + " ");
				i = ne[i];
				continue;
			}
			i ++; j ++;
		}
		else i = ne[i];
	}
	cout.println();
	
}
```

## 字典树

```java
class Node
{
	int cnt;
	boolean end;
	Node[] s = new Node[26];
}

Node r = new Node();

Node gt()
{
	return new Node();
}

void add(Node r, String s, int n, int cur)
{
	int p = (int)(s.charAt(cur) - 'a');
	if (r.s[p] == null) r.s[p] = gt();
	if (cur == n - 1)
	{
		r.s[p].end = true;
		r.s[p].cnt ++;
		return;
	}
	add(r.s[p], s, n, cur + 1);
}

void del(Node r, String s, int n, int cur)
{
	int p = (int)(s.charAt(cur) - 'a');
	if (r.s[p] == null) return;
	if (cur == n - 1)
	{
		if (r.s[p].end) r.s[p].cnt --;
		if (r.s[p].cnt == 0) r.s[p].end = false;
		return;
	}
	del(r.s[p], s, n, cur + 1);
}

int query(Node r, String s, int n, int cur)
{
	int p = (int)(s.charAt(cur) - 'a');
	if (r.s[p] == null) return 0;
	if (cur == n - 1)
	{
		if (r.s[p].end == true) return r.s[p].cnt;
		else return 0;
	}
	return query(r.s[p], s, n, cur + 1);
}

void solve() throws Exception
{
	
	int n = gii(gss()[0]);
	String[] ts;
	String t, s;
	while (n -- > 0)
	{
		ts = gss();
		t = ts[0];
		s = ts[1];
		if (t.equals("I")) add(r, s, s.length(), 0);
		else cout.println(query(r, s, s.length(), 0));
	}
	
}
```

## 并查集合并路径长度

如果我知道了当前节点到父节点的路径长度，那么路径压缩时，就能求出当前节点到根节点的路径长度。

有点类似：并查集上的差分

```java
int n, k, res;
int[] a = new int[N];
int[] b = new int[N];

int find(int x)
{
	if (x == a[x]) return x;
	int fa = a[x];
	a[x] = find(a[x]);
	b[x] += b[fa];
	b[x] = calc(b[x]);
	return a[x];
}

int calc(int x)
{
	return (x % 3 + 3) % 3;
}

int type(int x)
{
	find(x); return calc(b[x]);
}

void meld(int x, int y, int mo)
{
	int i = find(x);
	int j = find(y);
	
	if (i == j) return;
	
	int t = b[x] + mo - b[y];
	a[j] = i;
	b[j] = t;
}


void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	k = gii(ts[1]);
	
	for (int i = 1; i <= n; i ++) a[i] = i;
	
	int mo, x, y;
	while (k -- > 0)
	{
		ts = gss();
		mo = gii(ts[0]);
		x = gii(ts[1]);
		y = gii(ts[2]);
		if (x < 1 || x > n || y < 1 || y > n) res ++;
		else if (mo == 1)
		{
			if (find(x) == find(y) && type(x) != type(y)) res ++;
			else meld(x, y, 0);
		}
		else
		{
			if (find(x) == find(y) && calc(type(x) + 1) != type(y)) res ++;
			else meld(x, y, 1);
		}
	}
	cout.println(res);
	
}
```

## 堆

```java
int n, m;
int[] a = new int[N];

int ls(int p)
{
	return p << 1;
}

int rs(int p)
{
	return p << 1 | 1;
}

int fa(int p)
{
	return p >> 1;
}

void down(int p)
{
	if (ls(p) > n) return;
	int t = ls(p);
	if (rs(p) <= n && a[ls(p)] > a[rs(p)]) t = rs(p);
	if (a[t] < a[p])
	{
		int tmp = a[t];
		a[t] = a[p];
		a[p] = tmp;
		down(t);
	}
}

void up(int p)
{
	if (p <= 1) return;
	if (a[fa(p)] > a[p])
	{
		int t = a[fa(p)];
		a[fa(p)] = a[p];
		a[p] = t;
		up(fa(p));
	}
}

void push(int x)
{
	a[++ n] = x;
	up(n);
}

int pop()
{
	int t = a[1];
	a[1] = a[n];
	a[n] = t;
	n --;
	down(1);
	return t;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	int as = gii(ts[0]);
	m = gii(ts[1]);
	ts = gss();
	for (int i = 1; i <= as; i ++)
		push(gii(ts[i - 1]));
	while (m -- > 0)
	{
		cout.println(pop() + " ");
	}
	
}
```

## 字符串哈希

```java
int n, m;
String s;
final long mod = 1000000007;
final long r = 233;

long[] rp = new long[N];
long[] hs = new long[N];

long gs(int l, int r)
{
	long res = hs[r];
	res = ((res - hs[l - 1] * rp[(r - l + 1)] % mod) % mod + mod) % mod;
	return res;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	m = gii(ts[1]);
	ts = gss();
	s = "?" + ts[0];
	
	rp[0] = 1;
	
	for (int i = 1; i <= n + 10; i ++)
	{
		rp[i] = rp[i - 1] * r % mod;
	}
	
	for (int i = 1; i <= n; i ++)
	{
		hs[i] = (hs[i - 1] * r % mod + (int)(s.charAt(i))) % mod;
	}
	
	while (m -- > 0)
	{
		ts = gss();
		int l1, r1, l2, r2;
		l1 = gii(ts[0]);
		r1 = gii(ts[1]);
		l2 = gii(ts[2]);
		r2 = gii(ts[3]);
		if (gs(l1, r1) == gs(l2, r2)) cout.println("Yes");
		else cout.println("No");
	}
	
}
```

## 树的重心

对于每一个节点，它的子树的节点数最大数量，是所有节点的最小值时，该节点就算重心

最大节点数最小

```java
int n;
List<Integer>[] g;
int[] size = new int[N];
int pot, max = 1000000000;

void add(int x, int y)
{
	g[x].add(y);
}

void dfs(int v, int u)
{
	int sm = 0;
	int mx = 0;
	for (int x : g[v])
	{
		if (x == u) continue;
		dfs(x, v);
		sm += size[x];
		mx = Math.max(mx, size[x]);
	}
	size[v] = 1 + sm;
	mx = Math.max(mx, n - size[v]);
	if (mx < max)
	{
		max = mx; pot = v;
	}
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	g = new List[n + 10];
	
	for (int i = 1; i <= n; i ++)
		g[i] = new ArrayList<>();
	
	for (int i = 1; i < n; i ++)
	{
		ts = gss();
		int x, y;
		x = gii(ts[0]);
		y = gii(ts[1]);
		add(x, y);
		add(y, x);
	}
	
	dfs(1, 0);
	
	cout.println(max);
	
}
```

## 树状数组，单点修改，区间查询

初始化操作可以想象成单点修改

```java
// 单点修改
void update(int p, int x)
{
	while (p <= n)
	{
		tr[p] += x;
		p += lowbit(p);
	}
}

// 查询前缀和
int sum(int p)
{
	int res = 0;
	while (p > 0)
	{
		res += tr[p];
		p -= lowbit(p);
	}
	return res;
}
```

## 树状数组，区间修改，区间查询

定义差分数组：`D[i] = a[i] - a[i - 1]`

原数组：`a[i] = D[1] + D[2] + ··· + D[i]`

原数组前缀和：

```
sm[i] = a[1] + a[2] + ··· + a[i]

	  = D[1]
	  + D[1] + D[2]
	  + ···
	  + D[1] + D[2] + ··· D[i]

	  = i * D[1]
	  + (i - 1) * D[2]
	  + ···
	  + (i - (i - 1)) * D[i]	

	  = i * (D[1] + D[2] + ··· + D[i])
	  + 0 * D[1] + 1 * D[2] + ··· + (i - 1) * D[i]
```

所以原数组的前缀和：$sm[i] = i * \sum D[i] + \sum (i - 1)D[i]$

分别用两个树状数组维护 $D[i]$ 和 $(i - 1) * D[i]$

```java
int n, m;
long[] a = new long[N];
long[] d1 = new long[N];
long[] d2 = new long[N];

int lowbit(int p)
{
	return -p & p;
}

void update(long[] d, int p, long x)
{
	while (p <= n)
	{
		d[p] += x;
		p += lowbit(p);
	}
}

long query(long[] d, int p)
{
	long res = 0;
	while (p > 0)
	{
		res += d[p];
		p -= lowbit(p);
	}
	return res;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	m = gii(ts[1]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gll(ts[i - 1]);
		update(d1, i, a[i] - a[i - 1]);
		update(d2, i, (a[i] - a[i - 1]) * (i - 1));
	}
	
	while (m -- > 0)
	{
		ts = gss();
		int mo = gii(ts[0]);
		if (mo == 1)
		{
			int x, y;
			long k;
			x = gii(ts[1]);
			y = gii(ts[2]);
			k = gll(ts[3]);
			update(d1, x, k);
			update(d1, y + 1, -k);
			
			update(d2, x, k * (x - 1));
			update(d2, y + 1, -k * y);
		}
		else
		{
			int x, y;
			x = gii(ts[1]);
			y = gii(ts[2]);
			long t = y * query(d1, y) - (x - 1) * query(d1, x - 1);
			t -= query(d2, y) - query(d2, x - 1);
			cout.println(t);
		}
	}
	
}
```

## 树状数组，逆序对问题

从后面往前面插入，区间查找比当前元素小的个数，就是由该点引发的逆序对数量

```java
int n;
int[] a = new int[N];
int[] sr = new int[N];
int ant;
long res;

int f(int x)
{
	int l = 1, r = ant, mid;
	while (l < r)
	{
		mid = (l + r) >> 1;
		if (sr[mid] < x) l = mid + 1;
		else r = mid;
	}
	
	return r;
}

int unique()
{
	int i = 1, j = 2;
	while (j <= n)
	{
		if (sr[i] != sr[j])
		{
			sr[++ i] = sr[j];
		}
		j ++;
	}
	return i;
}

int[] tr = new int[N];

int lowbit(int p)
{
	return -p & p;
}

void update(int p, int x)
{
	while (p <= ant)
	{
		tr[p] += x;
		p += lowbit(p);
	}
}

int sum(int p)
{
	int res = 0;
	while (p > 0)
	{
		res += tr[p];
		p -= lowbit(p);
	}
	return res;
}

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	ts = gss();
	for (int i = 1; i <= n; i ++)
	{
		a[i] = gii(ts[i - 1]);
		sr[i] = a[i];
	}
	
	Arrays.sort(sr, 1, n + 1);
	
	ant = unique();
	
	for (int i = n; i > 0; i --)
	{
		int t = f(a[i]);
		res += sum(t - 1);
		update(t, 1);
	}
	
	cout.println(res);
	
	
}
```

## FHQ Treap 树

要时刻回想起是怎么分裂的？是怎么合并的？

这里的分裂基于权值分裂

整体上是一棵搜索树，也是一棵大顶堆，基于随机值的大顶堆

```java
class Node
{
	int key;
	int val;
	int size;
	Node ls, rs;
}

// 获取节点个数
int get_size(Node r)
{
	if (r == null) return 0;
	else return r.size;
} 

// 更新节点
void update_size(Node r)
{
	if (r == null) return;
	r.size = 1 + get_size(r.ls) + get_size(r.rs);
}

// 分裂
void split(Node r, int x, Node[] lr)
{
	if (r == null) 
	{
		lr[0] = null;
		lr[1] = null;
		return;
	}
	
	if (r.val <= x)
	{
		lr[0] = r;
		Node[] t = new Node[2];
		split(r.rs, x, t);
		lr[0].rs = t[0];
		lr[1] = t[1];
	}
	else
	{
		lr[1] = r;
		Node[] t = new Node[2];
		split(r.ls, x, t);
		lr[1].ls = t[1];
		lr[0] = t[0];
	}
	update_size(lr[0]);
	update_size(lr[1]);
}

// 合并
Node meld(Node l, Node r)
{
	if (l == null) return r;
	if (r == null) return l;
	if (l.key >= r.key)
	{
		l.rs = meld(l.rs, r);
		update_size(l);
		return l;
	}
	else
	{
		r.ls = meld(l, r.ls);
		update_size(r);
		return r;
	}
}

Random rr = new Random();

// 基于分裂、合并的插入
Node insert(Node r, int x)
{
	Node[] t = new Node[2];
	
	Node nd = new Node();
	nd.size = 1;
	nd.key = rr.nextInt();
	nd.val = x;
	
	split(r, x, t);
	r = meld(t[0], nd);
	r = meld(r, t[1]);
	return r;
}

// 基于分裂、合并的删除
Node erase(Node r, int x)
{
	Node[] t1 = new Node[2];
	Node[] t2 = new Node[2];
	split(r, x, t1);
	split(t1[0], x - 1, t2);
	if (t2[1] == null) r = null;
	else r = meld(t2[1].ls, t2[1].rs);
	r = meld(t2[0], r);
	r = meld(r, t1[1]);
	return r;
}

// 基于分裂、合并
Node smaller(Node r, int x, int[] ans)
{
	Node[] t = new Node[2];
	split(r, x - 1, t);
	ans[0] = get_size(t[0]);
	return meld(t[0], t[1]);
}

// 查找第 k 个数
int get_kth(Node r, int k)
{
	int t = get_size(r.ls);
	if (t + 1 == k) return r.val;
	else if (t + 1 < k) return get_kth(r.rs, k - t - 1);
	else return get_kth(r.ls, k);
}

// 基于分裂、合并的查找前驱
Node get_pre(Node r, int x, int[] ans)
{
	Node[] t = new Node[2];
	split(r, x - 1, t);
	ans[0] = get_kth(t[0], get_size(t[0]));
	return meld(t[0], t[1]);
}

// 基于分裂、合并的查找后继
Node get_post(Node r, int x, int[] ans)
{
	Node[] t = new Node[2];
	split(r, x, t);
	ans[0] = get_kth(t[1], 1);
	return meld(t[0], t[1]);
}

Node r;
int n;

void solve() throws Exception
{
	
	String[] ts = gss();
	n = gii(ts[0]);
	
	int[] ans;
	
	while (n -- > 0)
	{
		ts = gss();
		int mo, x;
		mo = gii(ts[0]);
		x = gii(ts[1]);
		
		switch(mo)
		{
		case 1:
			r = insert(r, x);
			break;
		case 2:
			r = erase(r, x);
			break;
		case 3:
			ans = new int[1];
			r = smaller(r, x, ans);
			cout.println(ans[0] + 1);
			break;
		case 4:
			cout.println(get_kth(r, x));
			break;
		case 5:
			ans = new int[1];
			r = get_pre(r, x, ans);
			cout.println(ans[0]);
			break;
		case 6:
			ans = new int[1];
			r = get_post(r, x, ans);
			cout.println(ans[0]);
			break;
		}
	}
	
}
```