# [A. Beautiful Sequence](https://codeforc.es/problemset/problem/1810/A)

=== "模拟"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 1000;

    LL n;
    LL ars[N];

    void solve() {
        
        scanf ("%lld", &n);
        for (LL i = 1; i <= n; i ++) {
            scanf ("%lld", ars + i);
        }
        for (LL i = 1; i <= n; i ++) {
            LL len = i - 1;
            if (len + 1 >= ars[i]) {
                printf ("YES\n"); return;
            }
        }
        printf ("NO\n");

    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```