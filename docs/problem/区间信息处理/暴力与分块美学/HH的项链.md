# [HH的项链](https://www.luogu.com.cn/problem/P1972)

=== "暴力与分块美学"

    时间复杂度：$O(n\sqrt{n}\log(n))$，在数据量 $10 ^ 6$ 次方下严重超时。

    !!! warning "暴力分块超时"

        ```c++
        #include <bits/stdc++.h>

        using namespace std;
        typedef long long LL;
        typedef __int128_t HH;

        const LL N = 2000000;
        const LL M = 2000;

        LL n;
        LL a[N];

        LL len, cnt;
        LL st[N], ed[N], pos[N];
        LL distinct[N];
        LL dp[M][M]; // 分块 i 到分块 j 的不同元素的个数。

        unordered_map<LL, vector<LL>> positions;

        LL query(LL left, LL right)
        {
            LL p = pos[left];
            LL q = pos[right];
            
            LL res = 0;

            unordered_set<LL> dt;

            if (p == q)
            {
                for (LL i = left; i <= right; i ++)
                {
                    dt.insert(a[i]);
                }
                res = dt.size();
            }
            else
            {
                res = dp[p + 1][q - 1];
                for (LL i = left; i <= ed[p]; i ++)
                {
                    dt.insert(a[i]);
                }
                for (LL i = st[q]; i <= right; i ++)
                {
                    dt.insert(a[i]);
                }
                for (auto x : dt)
                {
                    auto nd = positions[x];
                    auto t = lower_bound(nd.begin(), nd.end(), st[p + 1]);
                    if (t == nd.end() || *t > ed[q - 1]) res ++;
                }
            }

            return res;
        }

        void solve()
        {
            
            scanf ("%lld", &n);
            for (LL i = 1; i <= n; i ++)
            {
                scanf ("%lld", a + i);
                positions[a[i]].push_back(i);
            }
            
            unordered_set<LL> dt;

            len = sqrt(n); cnt = n / len;
            if (len * cnt < n) cnt ++;

            for (LL i = 1; i <= cnt; i ++)
            {
                st[i] = (i - 1) * len + 1;
                ed[i] = i * len;
            }

            ed[cnt] = n;

            for (LL i = 1; i <= n; i ++)
            {
                pos[i] = (i - 1) / len + 1;
            }

            for (LL i = 1; i <= cnt; i ++)
            {
                dt.clear();
                for (LL j = i; j <= cnt; j ++)
                {
                    for (LL k = st[j]; k <= ed[j]; k ++)
                    {
                        dt.insert(a[k]);
                    }
                    dp[i][j] = dt.size();
                }
            }

            LL q; scanf ("%lld", &q);

            while (q --)
            {
                LL left, right; scanf ("%lld%lld", &left, &right);

                printf ("%lld\n", query(left, right));
            }
            
        }

        int main()
        {
            
            solve();
            
            return 0;
        }
        ```
    
=== "莫队，将折线段压缩在同一块内的分块暴力莫队"

    暴力跃迁的状态转移路径图：

    ![暴力跃迁](./img/暴力跃迁.png)

    莫队不采用奇偶分块逆序的路径图：

    ![](./img/莫队不采取奇偶块逆序.png)

    莫队采用奇偶分块逆序的路径图：

    ![](./img/莫队震荡幅度曲线图.png)

    上面 $3$ 图我们可以直观的感受到分块莫队采用奇偶分块逆序的状态跃迁路径的短。

    能用在什么地方？如果前面那种状态的答案中存在部分可用于后面的状态，那么可以考虑莫队。

    时间复杂度：$O(n\sqrt{n})$

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    void read(LL& x)
    {
        LL f = 1;
        x = 0;
        char c = getchar();
        while (!(c >= '0' && c <= '9'))
        {if (c == '-') f = -1;c = getchar();}
        while (c >= '0' && c <= '9') 
        {x = x * 10 + c - '0'; c = getchar();}
        x *= f;
    }

    const LL N = 2000000;
    const LL M = 2000;

    LL n;
    LL a[N];

    LL len, cnt;
    LL pos[N];

    struct Node
    {
        LL left, right, id;
        bool operator<(const Node& a) const 
        {
            LL p = pos[left], q = pos[a.left];
            if (p != q) return p < q;

            // 目的是为了避免相邻块跃迁时的落差不能过大，
            // 所以奇数块从大到小，紧接着偶数块从小到大。
            if (p & 1) return right > a.right; 

            return right < a.right;

        }
    };

    LL m;
    Node questions[N];

    LL ans[N];

    LL elems_cnt[N];
    LL distinct;

    void solve()
    {
        
        read(n);
        for (LL i = 1; i <= n; i ++)
        {
            read(a[i]);
        }

        len = sqrt(n); cnt = n / len;
        if (len * cnt < n) cnt ++;

        for (LL i = 1; i <= n; i ++) pos[i] = (i - 1) / len + 1;

        read(m);
        for (LL i = 1; i <= m; i ++)
        {
            LL left, right; 
            read(left); read(right);
            questions[i].left = left;
            questions[i].right = right;
            questions[i].id = i;
        }

        sort(questions + 1, questions + 1 + m);
        
        LL l = 0, r = 0;
        for (LL i = 1; i <= m; i ++)
        {
            while (l < questions[i].left) 
            {
                elems_cnt[a[l]] --;
                if (elems_cnt[a[l]] == 0) distinct --;
                l ++;
            }
            while (l > questions[i].left)
            {
                elems_cnt[a[-- l]] ++;
                if (elems_cnt[a[l]] == 1) distinct ++;
            }
            while (r > questions[i].right)
            {
                elems_cnt[a[r]] --;
                if (elems_cnt[a[r]] == 0) distinct --;
                r --;
            }
            while (r < questions[i].right)
            {
                elems_cnt[a[++ r]] ++;
                if (elems_cnt[a[r]] == 1) distinct ++;
            }
            ans[questions[i].id] = distinct;
        }

        for (LL i = 1; i <= m; i ++)
        {
            printf ("%lld\n", ans[i]);
        }
    }

    int main()
    {
        
        solve();
        
        return 0;
    }
    ```