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