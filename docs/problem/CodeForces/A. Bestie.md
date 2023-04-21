# [A. Bestie](https://codeforc.es/problemset/problem/1732/A)

=== "暴力 + 减枝"

    不是正解！

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

=== "思维 + 规律"

    正解！

    先看一下数组是否已经满足 $gcd(a[n]) = 1$，如果是就输出 $0$；

    否则将最后一个数转成 $gcd(n, a[n])$，看一下 $gcd(a[n]) = 1$ 是否成立，如果成立就是 $1$；

    否则就将最后两个转成 $x = gcd(n - 1, a[n - 1])$、$y = gcd(n, a[n])$，此时必定有 $gcd(x, y) = 1$，因为 $gcd(n - 1, n) = 1$ 肯定成立，而 $gcd(gcd(n - 1, a[n - 1]), gcd(n, a[n]))$ 相当于：$gcd(n - 1, a[n - 1], n, a[n])$，必定等于 $1$，所以结果是 $2$.

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 1000;

    LL n;
    LL a[N];

    LL gcd(LL a, LL b) {
        if (!b) return a;
        return gcd(b, a % b);
    }

    bool ok() {
        LL t = a[1];
        for (LL i = 1; i <= n; i ++) {
            t = gcd(t, a[i]);
            if (t == 1) return true;
        }
        return false;
    }

    void solve() {
        
        scanf ("%lld", &n);
        for (LL i = 1; i <= n; i ++) {
            scanf ("%lld", a + i);
        }

        if (ok()) {
            printf ("0\n"); return;
        }
        LL t = a[n];
        a[n] = gcd(n, a[n]);
        if (ok()) {
            printf ("1\n"); return;
        }

        a[n] = t;

        a[n - 1] = gcd(n - 1, a[n - 1]);
        if (ok()) {
            printf ("2\n"); return;
        }

        printf("3\n");
        
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```