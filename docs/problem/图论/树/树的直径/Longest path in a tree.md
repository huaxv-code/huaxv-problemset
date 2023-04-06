# [Longest path in a tree](https://www.spoj.com/problems/PT07Z/)

=== "树的直径 dp"

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef long double FF;
    int gii(); LL gll(); FF gff();
    const int N = 1000000;

    int n;
    int g[N], e[N], ne[N], de[N];
    int on[N];
    int cur;

    int res;

    int dp[N];

    void dfs(int u, int fa) {
        int a = -1, b = -1;
        for (int i = g[u]; i; i = ne[i]) {
            if (e[i] == fa) continue;
            dfs(e[i], u);
            if (de[e[i]] > a) {
                b = a;
                a = de[e[i]];
            } 
            else if (de[e[i]] > b) {
                b = de[e[i]];
            }
        }
        a++; b++;
        de[u] = a;
        dp[u] = a + b;
    }

    void add(int a, int b) {
        cur++;
        e[cur] = b;
        ne[cur] = g[a];
        g[a] = cur;
    }

    void solve() {

        n = gii();

        for (int i = 1; i < n; i++) {
            int a, b;
            a = gii();
            b = gii();
            add(a, b);
            add(b, a);
        }

        dfs(1, 0);

        for (int i = 1; i <= n; i++) {
            res = max(res, dp[i]);
        }

        printf("%d\n", res);

    }

    int main() {

        solve();

        return 0;
    }

    int gii() {
        int n; scanf("%d", &n); return n;
    }

    LL gll() {
        LL n; scanf("%lld", &n); return n;
    }

    FF gff() {
        FF n; scanf("%Lf", &n); return n;
    }
    ```