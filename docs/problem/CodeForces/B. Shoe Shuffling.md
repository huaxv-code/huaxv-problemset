# [B. Shoe Shuffling](https://codeforc.es/problemset/problem/1691/B)

=== "找规律模拟"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 200000;

    LL n;
    map<LL, vector<LL>> mp;
    LL res[N];

    void solve() {
        
        scanf ("%lld", &n);

        mp.clear();

        for (LL i = 1; i <= n; i ++) {
            LL t; scanf ("%lld", &t);
            mp[t].push_back(i);
        }

        for (auto nd : mp) {
            auto vs = nd.second;
            if (vs.size() == 1) {
                printf ("-1\n"); return;
            }
            LL ln = vs.size();
            for (LL i = 0; i < ln; i ++) {
                res[vs[i]] = vs[(i + 1) % ln];
            }
        }

        for (LL i = 1; i <= n; i ++) {
            printf ("%lld ", res[i]);
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