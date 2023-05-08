# [Switch the Lamp On](https://www.luogu.com.cn/problem/P4667)

求出所有点到达起点的最短旋转次数，由于每个格子都有旋钮，所以任意两个对角相邻的点一定可以到达，如果可以直达，最短路长度就是 $0$ 否则就是 $1$。

可以抽象模型为边长为 $1$ 和 $0$ 的最短路问题。

=== "暴力广搜 + 优先队列"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    #define endl '\n'
    #define N 510
    #define inf 1000000000

    LL n, m;
    LL g[N][N], dp[N][N];

    // 1 -> '/'
    // 2 -> '\'

    LL d1[] = {-1, 1, 1, -1};
    LL d2[] = {1, 1, -1, -1};

    LL read()
    {
        char c; cin.get(c);
        while (!(c == '\\' || c == '/')) cin.get(c);
        if (c == '\\') return 2;
        return 1;
    }

    bool ok(LL x, LL y)
    {
        return (x >= 0 && x <= n && y >= 0 && y <= m);
    }

    LL get_point(LL x1, LL y1, LL x2, LL y2)
    {
        return g[max(x1, x2)][max(y1, y2)];
    }

    void solve()
    {
        
        cin >> n >> m;
        for (LL i = 0; i < N; i ++)
            for (LL j = 0; j < N; j ++) 
                dp[i][j] = inf;

        for (LL i = 1; i <= n; i ++)
        {
            for (LL j = 1; j <= m; j ++)
            {
                g[i][j] = read();
            }
        }
        auto cmd = [&](const vector<LL>& a, const vector<LL>& b)
        {
            return a[2] > b[2];
        };

        priority_queue<vector<LL>, vector<vector<LL>>, decltype(cmd)> qu(cmd);
        qu.push({0, 0, 0});

        while (qu.size())
        {
            auto nd = qu.top(); qu.pop();
            LL x = nd[0], y = nd[1], d = nd[2];
            if (d >= dp[x][y]) continue;
            dp[x][y] = d;
            for (LL i = 0; i < 4; i ++)
            {
                LL x1 = x + d1[i], y1 = y + d2[i];
                if (ok(x1, y1) == false) continue;
                LL t = get_point(x, y, x1, y1);
                if (!(i & 1))
                {
                    if (t == 1) qu.push({x1, y1, d});
                    else qu.push({x1, y1, d + 1});
                }
                else
                {
                    if (t == 2) qu.push({x1, y1, d});
                    else qu.push({x1, y1, d + 1});
                }
            }
        }

        if (dp[n][m] == inf) cout << "NO SOLUTION" << endl;
        else cout << dp[n][m] << endl;
        
    }

    int main()
    {
        
        ios::sync_with_stdio(0);
        cin.tie(0); cout.tie(0);
        
        solve();
        
        return 0;
    }
    ```

=== "暴力广搜 + 双端队列"

    如果在优先队列中拿出的数值假设为 $d$，如果新添加的路径长度为 $d + 0$，那么此时仍然是最短路；如果新添加的路径长度为 $d + 1$，不一定是最短路因为有可能存在 $d + 0$ 的状态，想象一下该优先队列最多有几种元素呢？因为一开始只有 $0$，添加新元素时，最多同时含有 $0$ 和 $1$，如果存在两种元素时，必须得把最小的元素消耗掉，才能轮到第二种元素，并且消耗掉最小的元素时，此时的队列最多只有剩下的一种元素。

    反正优先队列只有两种元素，并且这两种元素的差值为 $1$，所以可以借助双端队列模拟优先队列的功能，分类出小元素和大元素，小元素放左边，大元素放右边，拿的时候就不断拿左边。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    #define endl '\n'
    #define N 510
    #define inf 1000000000

    LL n, m;
    LL g[N][N], dp[N][N];

    // 1 -> '/'
    // 2 -> '\'

    LL d1[] = {-1, 1, 1, -1};
    LL d2[] = {1, 1, -1, -1};

    LL read()
    {
        char c; cin.get(c);
        while (!(c == '\\' || c == '/')) cin.get(c);
        if (c == '\\') return 2;
        return 1;
    }

    bool ok(LL x, LL y)
    {
        return (x >= 0 && x <= n && y >= 0 && y <= m);
    }

    LL get_point(LL x1, LL y1, LL x2, LL y2)
    {
        return g[max(x1, x2)][max(y1, y2)];
    }

    void solve()
    {
        
        cin >> n >> m;
        for (LL i = 0; i < N; i ++)
            for (LL j = 0; j < N; j ++) 
                dp[i][j] = inf;

        for (LL i = 1; i <= n; i ++)
        {
            for (LL j = 1; j <= m; j ++)
            {
                g[i][j] = read();
            }
        }
        auto cmd = [&](const vector<LL>& a, const vector<LL>& b)
        {
            return a[2] > b[2];
        };

        deque<vector<LL>> qu;
        qu.push_back({0, 0, 0});

        while (qu.size())
        {
            auto nd = qu.front(); qu.pop_front();
            LL x = nd[0], y = nd[1], d = nd[2];
            if (d >= dp[x][y]) continue;
            dp[x][y] = d;
            for (LL i = 0; i < 4; i ++)
            {
                LL x1 = x + d1[i], y1 = y + d2[i];
                if (ok(x1, y1) == false) continue;
                LL t = get_point(x, y, x1, y1);
                if (!(i & 1))
                {
                    if (t == 1) qu.push_front({x1, y1, d});
                    else qu.push_back({x1, y1, d + 1});
                }
                else
                {
                    if (t == 2) qu.push_front({x1, y1, d});
                    else qu.push_back({x1, y1, d + 1});
                }
            }
        }

        if (dp[n][m] == inf) cout << "NO SOLUTION" << endl;
        else cout << dp[n][m] << endl;
        
    }

    int main()
    {
        
        ios::sync_with_stdio(0);
        cin.tie(0); cout.tie(0);
        
        solve();
        
        return 0;
    }
    ```