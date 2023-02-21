# K 倍区间个数

??? question "[问题描述](https://www.acwing.com/problem/content/1232/)"

    给定一个具有 $n$ 个整数的数组 $a[n]$，请你找出该数组中存在多少个连续子区间的和是 $k$ 的倍数.

    **数据范围**

    $1 \leq n, k, a[i] \leq 10 ^ 5$

## 前缀和 + 取模

如果存在一个连续子区间 $[l, r]$ 使得 $sum[l, r]$ 的和是 $k$ 的倍数，那么 $sum[l, r] \bmod k = 0$

利用前缀和数组 $sum[l, r] = sum[r] - sum[l - 1]$ 所以：

> $sum[l, r] \bmod k = sum[r] \bmod k - sum[l - r] \bmod k$
>
> 即 $sum[r] \bmod k = sum[l - 1] \bmod k$

对于每一个 $r$ 寻找 $1 \sim r - 1$ 中存在多少个 $l$ 使得 $sum[r] = sum[l] (\bmod k)$ 成立，累加这些结果就是答案.

??? success "参考代码"

    ```c++
    LL n, k, rs;
    LL a[N], b[N];
    LL mp[N];

    void solve(void)
    {
        n = gll(), k = gll();
        for (LL i = 1; i <= n; i ++)
        {
            a[i] = gll(); b[i] += b[i - 1] + a[i];
            b[i] %= k;
        }

        mp[0] = 1;
        for (LL i = 1; i <= n; i ++)
        {
            rs += mp[b[i]] ++;
        }

        pll(rs);
    }
    ```