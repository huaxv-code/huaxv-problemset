# [A. 宝石划分](https://acm.ecnu.edu.cn/contest/655/problem/A/)

=== "最大约数"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    typedef long long ll;
    typedef __int128_t hh;
    #define endl '\n'
    #define N 3000000

    ll a[N];
    ll p;
    ll n, m;

    void solve()
    {
        
        cin >> n >> m;

        for (ll i = 1; i <= n / i; i ++)
        {
            if (n % i == 0) 
            {
                a[++ p] = i;
                if (n / i != i) a[++ p] = n / i;
            }
        }

        sort(a + 1, a + 1 + p);

        for (ll i = p; i; i --) 
            if (a[i] <= m) 
            {
                cout << n / a[i] << endl; return;
            }
        
    }

    int main()
    {
        
        ios::sync_with_stdio(0);
        cin.tie(0); cout.tie(0);
        
        solve();
        
        return 0;
    }
    ```