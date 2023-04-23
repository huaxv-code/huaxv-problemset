# [A. Red Versus Blue](https://codeforc.es/problemset/problem/1659/A)

=== "规律推导"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    LL n, r, b;

    vector<LL> get_unit(LL x, LL y) {
        LL a = x / (y + 1);
        LL b = x - a * (y + 1);
        return {a, b};
    }

    void solve() {
        
        scanf ("%lld%lld%lld", &n, &r, &b);

        auto nd = get_unit(r, b);

        for (LL i = 1; i <= b + 1; i ++) {
            for (LL j = 1; j <= nd[0]; j ++) putchar('R');
            if (nd[1]) {
                putchar('R'); nd[1] --;
            }
            if (i <= b) putchar('B');
        }
        puts("");
        
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```