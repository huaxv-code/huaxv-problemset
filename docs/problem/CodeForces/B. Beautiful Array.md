# [B. Beautiful Array](https://codeforc.es/problemset/problem/1715/B)

=== "思维 + 规律 + 构造"

    假设原数组可以由：$[x_1, x_2, \cdots, x_n] \times k + [y_1, y_2, \cdots, y_n]$ 组成，那么必有 $x_1 + x_2 + \cdots + x_n = b$ 成立，且 $k * b + (y_1 + y_2 + \cdots + y_n) = s$，并且还需要满足 $0 \leq sum[y_1, y_2, \cdots, y_n] \leq (k - 1) * n $.

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 200000;
    LL n, k, b, s;
    LL a[N];

    void solve() {
        
        scanf ("%lld%lld%lld%lld", &n, &k, &b, &s);

        if (s - b * k > (k - 1) * n || s - k * b < 0) {
            printf ("-1\n");
            return;
        }

        for (LL i = 1; i <= n; i ++) {
            a[i] = 0;
        }

        a[1] = k * b;
        LL t = s - k * b;

        for (LL i = 1; i <= n; i ++) {
            if (t >= k - 1) {
                a[i] += k - 1;
                t -= k - 1;
            }
            else {
                a[i] += t;
                t -= t;
            }
            printf ("%lld ", a[i]);
        }
        puts("");
        
    }

    int main() {

        LL t;
        scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```