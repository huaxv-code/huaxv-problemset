# [B. Divan and a New Project](https://codeforc.es/problemset/problem/1614/B)

=== "贪小便宜 + 构造"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 300000;

    LL n;
    LL res;

    struct Node {
        LL a, b, c;
    };

    Node a[N];

    void solve() {
        
        scanf ("%lld", &n);
        
        for (LL i = 1; i <= n; i ++) scanf ("%lld", &a[i].a), a[i].b = i;
        
        auto cmp1 = [&](const Node& x, const Node& y) {
            if (x.a == y.a) return x.b < y.b;
            return x.a > y.a;
        };

        sort(a + 1, a + 1 + n, cmp1);

        res = 0;

        LL pos = 1;
        for (LL i = 1; i <= n; i ++) {
            a[i].c = pos;
            if ((i & 1) == 0) {
                a[i].c *= -1;
                pos ++;
            }
            res += abs(a[i].c) * a[i].a;
        }

        res *= 2;

        auto cmp2 = [&](const Node& x, const Node& y) {
            if (x.b == y.b) return x.c < y.c;
            return x.b < y.b;
        };

        sort(a + 1, a + 1 + n, cmp2);

        printf ("%lld\n0 ", res);

        for (LL i = 1; i <= n; i ++) {
            printf ("%lld ", a[i].c);
        }

        printf ("\n");
    }

    int main() {

        LL t; scanf ("%lld", &t);  
        while (t --)
        solve();

        return 0;
    }
    ```