# [C. Darkness I](https://codeforces.com/gym/104337/problem/C)

=== "思维 规律 构造"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    #define endl '\n'
    #define N 1000000
    #define mod 998244353ll

    LL n, m;
    
    void solve()
    {
        cin >> n >> m;
        if(n > m)   swap(n, m);
        if(n == 1)
            cout << m - (m - 1) / 2 << endl;
        else
            cout << n + (m - n + 1) / 2 << endl;
        
    }

    int main()
    {
        
        ios::sync_with_stdio(0);
        cin.tie(0); cout.tie(0);
        
        solve();
        
        return 0;
    }
    ```