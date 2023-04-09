# [Hankson的趣味题](https://www.acwing.com/problem/content/202/)

=== "dfs 枚举所有约数，一个一个判断是否满足条件"

    先预处理出质数表，一个一个地筛某个数的质因子，一个数 $x$ 最多只有一个质因子大于 $\sqrt{x}$

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    template <typename T> void read(T&);
    template <typename T> void print(T x);
    int gii(); LL gll(); double gff(); long double ghf();
    typedef __int128_t HH;
    const int N = 2000000;

    LL gcd(LL a, LL b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }

    const LL inf = (1ll << 31) - 1;
    LL on[N];
    LL pr[N];
    LL cnt;

    LL n, x, a, h, b, j;

    // 求 x 的质因数，即质因数的次方
    vector<vector<LL>> gts(LL x) {
        vector<vector<LL>> res;
        for (LL i = 1; i <= cnt && pr[i] <= x / pr[i]; i ++) {
            if (x % pr[i] == 0) {
                LL a = pr[i], b = 0;
                while (x % pr[i] == 0) {
                    x /= pr[i];
                    b ++;
                }
                res.push_back({a, b});
            }
        }
        if (x > 1) res.push_back({x, 1});
        return res;
    }

    // dfs 枚举所有的约数，约数个数：
    LL dfs(const vector<vector<LL>>& as, LL sm = 1, LL idx = 0) {
        if (idx >= (LL)as.size()) {
            if (gcd(sm, a) == h && sm * b / gcd(sm, b) == j) {
                return 1;
            }
            else return 0;
        }

        LL res = dfs(as, sm, idx + 1);
        for (LL i = 1; i <= as[idx][1]; i ++) {
            sm *= as[idx][0];
            res += dfs(as, sm, idx + 1);
        }
        return res;
    }

    void solve() {
        
        n = gll();
        
        for (LL i = 2; i <= inf / i; i ++) {
            if (on[i] == 0) {
                pr[++ cnt] = i;
            }
            for (LL j = 1; j <= cnt; j ++) {
                if (pr[j] * i > inf / i) break;
                on[pr[j] * i] = 1;
                if (i % pr[j] == 0) break;
            }
        }

        while (n --) {
            a = gll(); h = gll();
            b = gll(); j = gll();

            printf ("%lld\n", dfs(gts(j)));
        }
        
    }

    int main() {

        solve();

        return 0;
    }

    int gii() {
        int x; scanf ("%d", &x); return x;
    }

    LL gll() {
        LL x; scanf ("%lld", &x); return x;
    }

    double gff() {
        double x; scanf ("%lf", &x); return x;
    }

    long double ghf() {
        long double x; scanf ("%Lf", &x); return x;
    }

    template <typename T> 
    void read(T& x) {
        x = 0;
        T f = 1;
        char c = getchar();
        while (!(c >= '0' && c <= '9')) {
            if (c == '-') f = -1;
            c = getchar();
        }
        while (c >= '0' && c <= '9') {
            x = x * 10 + c - '0';
            c = getchar();
        }
        x *= f;
    }

    template <typename T>
    void print(T x) {
        if (x == 0) {
            putchar('0'); return;
        }
        if (x < 0) {
            putchar('-'); x *= -1;
        }
        if (x / 10 != 0) print(x / 10);
        putchar('0' + (x % 10));
    }
    ```