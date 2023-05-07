# [K. Dice Game](https://codeforces.com/gym/104337/problem/K)

=== "简单概率题"

    $\frac{(m - i) ^ n}{(m - 1) ^ n}$

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    #define endl '\n'
    #define N 2000000
    #define mod 998244353ll

    LL n, m;
    LL a[N];

    LL qpow(LL a, LL b, LL m)
    {
        if (b == 0) return 1;
        if (b == 1) return a % m;

        LL t = qpow(a, b >> 1, m);
        t = t * t % m;
        if (b & 1) t = t * a % m;
        return t; 
    }

    void solve()
    {
        
        cin >> n >> m;

        for (LL i = 1; i <= m; i ++)
        {
            LL p, q, t;
            q = qpow(m - 1, n, mod);
            p = qpow(m - i, n, mod);
            t = p * qpow(q, mod - 2, mod) % mod;
            cout << t << " ";
        }
        cout << endl;
        
    }

    int main()
    {
        
        ios::sync_with_stdio(0);
        cin.tie(0); cout.tie(0);
        
        solve();
        
        return 0;
    }
    ```