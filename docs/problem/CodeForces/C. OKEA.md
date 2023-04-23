# [C. OKEA](https://codeforc.es/problemset/problem/1634/C)

=== "规律构造模拟"

    任意连续的 $i$ 个偶数或者连续奇数的和，都会是 $i$ 的倍数。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    LL n, k;

    void solve() {
        
        scanf ("%lld%lld", &n, &k);

        LL odd = (n * k + 1) / 2;
        LL even = n * k / 2;
        if ((n + 1) / 2 * k != odd) {
            printf ("NO\n"); return;
        }

        printf ("YES\n");

        for (LL i = 1, j = 1; j <= n * k; i ++, j += 2) {
            printf ("%lld ", j);
            if (i % k == 0) puts("");
        }

        for (LL i = 1, j = 2; j <= n * k; i ++, j += 2) {
            printf ("%lld ", j);
            if (i % k == 0) puts("");
        }
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```