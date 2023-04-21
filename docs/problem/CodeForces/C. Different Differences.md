# [C. Different Differences](https://codeforc.es/problemset/problem/1772/C)

=== "思维构造"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 100000;

    LL k, n;
    LL ars[N];
    LL cnt;

    void create(LL a, LL b, LL& k) {
        for (LL i = a; i <= b && k; i ++) {
            ars[cnt ++] = i;
            k --;
        }
    }

    void solve() {
        
        scanf ("%lld%lld", &k, &n);
        
        ars[0] = 1;
        cnt = 0;

        for (LL i = 1; ; i ++) {
            cnt = i;
            ars[i] = ars[i - 1] + i;
            if (ars[i] > n) break;
        }

        // cout << k << " : " << cnt << endl;

        if (k <= cnt) {
            for (LL i = 0; i < k; i ++) {
                printf ("%lld ", ars[i]);
            }
            puts(""); return;
        }

        k -= cnt;
        create(ars[cnt - 1] + 1, n, k);
        LL i = cnt - 1;
        while (k) {
            create(ars[i - 1] + 1, ars[i] - 1, k);
            i --;
        }
        
        sort(ars + 1, ars + cnt);

        for (LL i = 0; i < cnt; i ++) {
            printf ("%lld ", ars[i]);
        }

        puts(""); return;


    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```