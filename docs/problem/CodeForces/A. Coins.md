# [A. Coins](https://codeforc.es/problemset/problem/1814/A)

=== "扩展欧几里得"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    LL gcd(LL a, LL b) {
        if (!b) return a;
        return gcd(b, a % b);
    }

    vector<LL> exgcd(LL a, LL b, LL c) {
        if (!b) {
            if (c % a == 0) return {1, 0, a};
            else return {};
        }
        auto t = exgcd(b, a % b, c);
        if (t.size() == 0) return t;
        return {t[1], t[0] - a / b * t[1], t[2]};
    }

    void solve() {
        
        LL a = 2, b, c;
        scanf ("%lld%lld", &c, &b);
        auto t = exgcd(a, b, c);
        if (t.size()) printf ("YES\n");
        else printf ("NO\n");
        
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```