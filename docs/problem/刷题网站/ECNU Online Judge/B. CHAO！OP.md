# [B. CHAO！OP](https://acm.ecnu.edu.cn/contest/655/problem/B/)

=== "动态规划"

    *以 `O` 结尾* 还是 *不是以 `O` 结尾*，有两种可以讨论的状态。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    typedef long long ll;
    typedef __int128_t hh;
    #define endl '\n'
    #define N 2000000
    #define mod 1000000007

    unordered_set<string> hs;
    string op[] = {
        "01", "1000", "1010", "100", "0",
        "0010", "110", "0000", "00", "0111", "101", 
        "0100", "11", "10", "1101", "010", "000", "1",
        "001", "0001", "011", "1001", "1011", "1100",
        "111", "0110"
    };

    string s;
    ll n;

    ll dp[2][N];
    // 111 -> 1

    void solve()
    {
        
        for (auto x : op) hs.insert(x);
        cin >> s;
        n = s.size();
        s = "?" + s;

        dp[0][0] = 1;

        for (ll i = 1; i <= n; i ++)
        {
            for (ll j = 1; j <= 4; j ++)
            {
                ll k = i - j + 1;
                if (k <= 0) break;

                string t(s.begin() + k, s.begin() + i + 1);

                if (hs.find(t) != hs.end()) 
                {
                    if (t == "111")
                    {
                        dp[1][i] = (
                            dp[1][i] + 
                            dp[0][k - 1] + 
                            dp[1][k - 1]
                        ) % mod;
                    }
                    else if (t == "0110")
                    {
                        dp[0][i] = (
                            dp[0][i] + 
                            dp[0][k - 1]
                        ) % mod;
                    }
                    else
                    {
                        dp[0][i] = (
                            dp[0][i] + 
                            dp[0][k - 1] + 
                            dp[1][k - 1]
                        ) % mod;
                    }
                }
            }
        }

        cout << (dp[0][n] + dp[1][n]) % mod << endl;
        
    }

    int main()
    {
        
        ios::sync_with_stdio(0);
        cin.tie(0); cout.tie(0);
        
        solve();
        
        return 0;
    }
    ```