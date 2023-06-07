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

```