# [Polygon](https://www.luogu.com.cn/problem/P4342)

=== "区间 dp"

    如果都是正数，那么只需要不断地记录最大值就行，因为 $+$ 和 $*$ 会使得任意两个正数的操作值变大；

    但如果有正有负呢？负数乘上负数会变正，所以需要记录最大 $dp$ 数组和最小 $dp_$ 数组.

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    #define endl '\n'

    #define N 200
    #define inf (1 << 20)

    LL n;
    LL ans[N];
    string s[N];
    LL a[N];
    LL dp[N][N];
    LL dp_[N][N];

    inline LL cg(LL x) { return ((x - 1) % n + n) % n + 1; }

    inline LL calc(LL x, LL y, char c)
    {
        if (c == 't') return x + y;
        return x * y;
    }

    void solve()
    {
        
        cin >> n;
        for (LL i = 1; i <= n; i ++)
        {
            cin >> s[i] >> a[i];
            ans[i] = -inf;
        }

        for (LL i = 1; i <= n; i ++)
        {
            for (LL j = 1; j <= n; j ++)
            {
                for (LL k = 1; k <= n; k ++)
                {
                    dp[j][k] = -inf;
                    dp_[j][k] = inf;
                }
            }

            for (LL j = 1; j <= n; j ++) dp[j][j] = dp_[j][j] = a[j];

            for (LL j = 2; j <= n; j ++)
            {
                for (LL k = i; cg(k + j - 1) != i; k = cg(k + 1))
                {
                    for (LL l = k; cg(l) != cg(k + j - 1); l = cg(l + 1))
                    {
                        vector<LL> t = {
                            calc(dp[k][l], dp[cg(l + 1)][cg(j + k - 1)], s[cg(l + 1)][0]),
                            calc(dp[k][l], dp_[cg(l + 1)][cg(j + k - 1)], s[cg(l + 1)][0]),
                            calc(dp_[k][l], dp[cg(l + 1)][cg(j + k - 1)], s[cg(l + 1)][0]),
                            calc(dp_[k][l], dp_[cg(l + 1)][cg(j + k - 1)], s[cg(l + 1)][0]),
                        };
                        sort(t.begin(), t.end());
                        dp[k][cg(k + j - 1)] = max(dp[k][cg(k + j - 1)], t.back());
                        dp_[k][cg(k + j - 1)] = min(dp_[k][cg(k + j - 1)], t[0]);
                        if (j == n) ans[i] = max(ans[i], dp[k][cg(k + j - 1)]);
                    }
                }
            }
        }

        LL res = -inf;
        for (LL i = 1; i <= n; i ++) res = max(res, ans[i]);
        cout << res << endl;
        for (LL i = 1; i <= n; i ++) if (ans[i] == res) cout << i << ' ';
        cout << endl;
        
    }

    int main()
    {
        
        solve();
        
        return 0;
    }
    ```