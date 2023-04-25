# [Tarjan 算法求最近公共祖先](https://www.luogu.com.cn/problem/P3379)

=== "dfs + 并查集"

    时间复杂度：$O(n + m)$，我不知道怎么推导的，个人感觉不太像啊！

    $dfs$ 遍历的是一条条的路径，假设我想要求 $x$ 和 $y$ 的最近公共祖先，我们能不能利用 $dfs$ 的性质，从 $x$ 遍历到 $y$ 呢？那么最近公共祖先一定在这条路径上。

    先遍历子树，并将子树的所有节点都指向当前父亲节点（借用并查集实现），再来查询有关当前父亲节点的所有询问，判断是否已经有节点已经遍历过，如果有节点是已经被遍历过的，说明这个节点到当前节点的祖先是已经记录下来了的。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 600000;

    LL n, m, s;

    struct Node { LL e, ne, id; } 
        edge[N << 2];

    LL ant;

    LL head_point[N], head_query[N];

    void add_edge(LL a, LL b) {
        ant ++;
        edge[ant].e = b;
        edge[ant].ne = head_point[a];
        head_point[a] = ant;
    }

    void add_query(LL a, LL b, LL id) {
        ant ++;
        edge[ant].e = b;
        edge[ant].ne = head_query[a];
        edge[ant].id = id;
        head_query[a] = ant;
    }

    LL fa[N]; // 并查集

    LL ans[N];
    LL vis[N];

    LL find_set(LL x) {
        return x == fa[x] ? x : fa[x] = find_set(fa[x]);
    }

    void dfs(LL x) {
        vis[x] = 1;
        
        for (LL i = head_point[x]; i; i = edge[i].ne) {
            LL y = edge[i].e;
            if (vis[y]) continue;
            dfs(y);
            fa[y] = x;
        }

        for (LL i = head_query[x]; i; i = edge[i].ne) {
            LL y = edge[i].e;
            LL id = edge[i].id;
            if (vis[y]) {
                ans[id] = find_set(y);
            }
        }
    }

    void solve() {
        
        scanf ("%lld%lld%lld", &n, &m, &s);

        for (LL i = 1; i <= n; i ++) {
            fa[i] = i;
        }

        for (LL i = 1; i < n; i ++) {
            LL x, y; scanf ("%lld%lld", &x, &y);
            add_edge(x, y); add_edge(y, x);
        }

        for (LL i = 1; i <= m; i ++) {
            LL x, y; scanf ("%lld%lld", &x, &y);
            add_query(x, y, i); add_query(y, x, i);
        }

        dfs(s);

        for (LL i = 1; i <= m; i ++) {
            printf ("%lld\n", ans[i]);
        }
        
    }

    int main() {

        solve();

        return 0;
    }
    ```