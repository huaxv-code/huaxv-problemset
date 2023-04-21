# [B. Grid Reconstruction](https://codeforc.es/problemset/problem/1816/B)

=== "规律 + 模拟 + 构造"

    给定一个 $2 * n$ 的网格，其中 $n$ 是偶数，若从一个点开始，只能向右和向下移动，你需要将 $1 \sim 2 * n$ 这些数填充入这个网格中；
    
    问从起点 $(1, 1)$ 抵达终点 $(2, n)$ 的所有可能路径中最小的最大是多少，每走一个格，那个格的数要 $\times -1$.

    要让路径和最小，那么相邻的两个点的差值越大越好

    因为所有路径都经过起点 $(1, 1)$ 和终点 $(2, n)$，所以这两个点当然是越大越好，就取前两大。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 200000;
    LL n;
    LL ars[3][N];
    LL lt, rt;

    void solve() {
        
        scanf ("%lld", &n);
        lt = n, rt = 2 * n;

        for (LL i = 1; i <= 2; i ++) {
            for (LL j = 1; j <= n; j ++)
                ars[i][j] = 0;
        }
        
        for (LL i = 1; i <= n; i += 2) {
            ars[1][i] = 2 * n - i / 2 * 2;
            ars[2][i] = i;
        }
        for (LL i = 2; i <= n; i += 2) {
            ars[1][i] = i;
            ars[2][i] = n + 1 + (i / 2 - 1) * 2;
        }

        for (LL i = 1; i <= 2; i ++) {
            for (LL j = 1; j <= n; j ++) {
                printf ("%lld ", ars[i][j]);
            }
            puts("");
        }
        
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```