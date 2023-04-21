# [J. Grammy and Jewelry](https://codeforces.com/gym/103055/problem/J)

=== "贪心思想 + 线性 dp"

    先求出从 $1$ 号点到其他点的最短路径，那么这个最短路径就代表从点 $1$ 抵达点 $i$ 的消耗。

    一开始 $i = 0$ 或者 $i = 1$ 时，$dp[i] = 0$，因为无法去到另外的点然后背东西回来。

    假设可走路程 $i$ 的最大价值已经求出了，是 $dp[i]$；

    那么对于当前可走 $i$ 路程，到底是去哪个点可以获得最大的价值呢？假设是去点 $j$，那么:
    
    > $dp[i] = max(dp[i], dp[i % (a[j] * 2)] + dp[a[j] * 2] + i / (a[j] * 2))$

    时间复杂度：$O(n ^ 2)$.

    你问我怎么推出来的？我也不知道，就是有一种感觉，牵引我往这方面思考，可能是做多了感觉就上来了？？？

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const int N = 10000;

    LL n, m, t;

    LL g[N], e[N], ne[N], ant;
    LL a[N], b[N];

    LL on[N];

    LL dp[N];

    LL weight[N];

    void add(LL u, LL v) {
        ant ++;
        e[ant] = v;
        ne[ant] = g[u];
        g[u] = ant;
    }

    void solve() {
        
        scanf ("%lld%lld%lld", &n, &m, &t);

        for (LL i = 2; i <= n; i ++) {
            scanf ("%lld", a + i);
        }

        for (LL i = 1; i <= m; i ++) {
            LL u, v; scanf ("%lld%lld", &u, &v);
            add(u, v); add(v, u);
        }

        queue<vector<LL>> qu;

        qu.push({1, 0});

        while (qu.size()) {
            auto t = qu.front(); qu.pop();

            if (on[t[0]]) continue;
            on[t[0]] = 1;
            b[t[0]] = t[1];
            for (LL i = g[t[0]]; i; i = ne[i]) {
                qu.push({e[i], t[1] + 1});
            }
        }

        for (LL i = 1; i <= n; i ++) {
            weight[b[i]] = max(weight[b[i]], a[i]);
            dp[b[i] * 2] = max(dp[b[i] * 2], weight[b[i]]);
            dp[b[i] * 2 + 1] = max(dp[b[i] * 2 + 1], weight[b[i]]);
        }

        for (LL i = 2; i <= t; i ++) {
            LL j = i / 2;
            for (LL k = 1; k <= j; k ++) {
                dp[i] = max(dp[i], dp[i % (k * 2)] + dp[k * 2] * (i / (k * 2)));
            }
        }

        for (LL i = 1; i <= t; i ++) {
            printf ("%lld ", dp[i]);
        }
        puts("");
        
    }

    int main() {

        solve();

        return 0;
    }
    ```