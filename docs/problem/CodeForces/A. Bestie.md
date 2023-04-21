# [A. Bestie](https://codeforc.es/problemset/problem/1732/A)

=== "暴力 + 减枝"

    不断枚举选择 $i$ 个元素求 $gcd$ 的情况，记录最小的得分 $score$，并以此现在 $dfs$ 的走向。

    时间复杂度不会算。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 1000;

    LL n;
    LL a[N];
    LL g[N];

    LL gcd(LL a, LL b) {
        if (!b) return a;
        return gcd(b, a % b);
    }

    LL on[N];

    LL res;

    bool ok() {
        LL t = a[1];
        for (LL i = 1; i <= n; i ++) {
            t = gcd(t, a[i]);
            if (t == 1) return true;
        }
        return false;
    }

    void dfs(LL score, LL times, LL begin) {
        if (score >= res) return;
        if (ok()) {
            res = score; return;
        }
        if (times <= 0) return;
        if (begin <= 0) return;
        for (LL i = begin; i; i --) {
            LL t = a[i];
            a[i] = g[i];
            dfs(score + n - i + 1, times - 1, begin - 1);
            a[i] = t;
        }
    }

    void solve() {
        
        scanf ("%lld", &n);
        for (LL i = 1; i <= n; i ++) {
            scanf ("%lld", a + i);
            g[i] = gcd(i, a[i]);
        }

        res = n;

        for (LL i = 1; i <= n; i ++) {
            dfs(0, i, n);
        }

        printf ("%lld\n", res);
        
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```