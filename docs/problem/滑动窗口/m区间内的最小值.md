# m 区间内的最小值

??? question "[问题描述](https://www.luogu.com.cn/problem/P1440)"

    # 求m区间内的最小值

    ## 题目描述

    一个含有 $n$ 项的数列，求出每一项前的 $m$ 个数到它这个区间内的最小值。若前面的数不足 $m$ 项则从第 $1$ 个数开始，若前面没有数则输出 $0$。

    ## 输入格式

    第一行两个整数，分别表示 $n$，$m$。

    第二行，$n$ 个正整数，为所给定的数列 $a_i$。

    ## 输出格式

    $n$ 行，每行一个整数，第 $i$ 个数为序列中 $a_i$ 之前 $m$ 个数的最小值。

    ## 样例 #1

    ### 样例输入 #1

    ```
    6 2
    7 8 1 4 3 2
    ```

    ### 样例输出 #1

    ```
    0
    7
    7
    1
    1
    3
    ```

    ## 提示

    对于 $100\%$ 的数据，保证 $1\le m\le n\le2\times10^6$，$1\le a_i\le3\times10^7$。

## 滑动窗口维护最小值

??? success "代码参考（cin、cout 卡超时）"

    ```c++
    LL n, m, a[N];
    LL v[N], p[N], l, r;

    void solve(void)
    {
        cin >> n >> m;
        for (LL i = 1; i <= n; i ++) scanf ("%lld", a + i);

        printf ("0\n");
        for (LL i = 1; i < n; i ++)
        {
            while (r - l && v[r - 1] >= a[i]) r --;
            while (r - l && p[l] < i - m + 1) l ++;
            v[r] = a[i]; p[r] = i; r ++;
            printf ("%lld\n", v[l]);
        }
    }
    ```