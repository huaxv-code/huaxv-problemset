# [H. Binary Craziness](https://codeforces.com/gym/104337/problem/H)

=== "去重，合并相同项"

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

    void add(LL x, LL y)
    {
        a[x] ++; a[y] ++;
    }

    LL res = 0;
    LL st, ed;

    map<LL, LL> hs;
    LL x[N], y[N];
    LL ant;

    void solve()
    {
        
        cin >> n >> m;
        ed = n;

        for (LL i = 1; i <= m; i ++) 
        {
            LL x, y; cin >> x >> y; add(x, y);
        }

        sort(a + 1, a + 1 + n);

        for (LL i = 1; i <= n; i ++) if (a[i]) break; else st = i;

        for (LL i = st; i <= ed; i ++)
        {
            hs[a[i]] ++;
        }

        for (auto nd : hs)
        {
            ++ ant;
            x[ant] = nd.first;
            y[ant] = nd.second;
        }

        for (LL i = 1; i <= ant; i ++)
        {
            for (LL j = i; j <= ant; j ++)
            {
                res += ((((x[i] ^ x[j]) % mod * (x[i] | x[j]) % mod) % mod * (x[i] & x[j])) % mod * y[i]) % mod * y[j];
                res %= mod;
            }
        }

        cout << res << endl;
        
    }

    int main()
    {
        
        ios::sync_with_stdio(0);
        cin.tie(0); cout.tie(0);
        
        solve();
        
        return 0;
    }
    ```