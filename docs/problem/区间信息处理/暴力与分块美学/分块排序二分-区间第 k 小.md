# [分块排序二分-区间第 k 小](https://www.luogu.com.cn/problem/P3834)

=== "暴力与分块美学"

    将原数组，切割成一块一块的，对每一块进行排序。

    如果我要查找区间 `[left, right]` 的第 `k` 小，那么比该数小的一定只有 `k - 1` 个.

    先用二分枚举一个数 `x` 查找该数 `x` 在区间 `[left, right]` 内有多少个比该数小的，如果大于 `k - 1` 说明该数太大了；如果小于等于 `k - 1` 个说明该数还是小了。

    时间复杂度：查找 $m$ 次，数据有 $n$ 个时，需要 $O(m \times \sqrt{n} \times log(\sqrt{n}) \times log(n))$.

    假设 $m = 10 ^ 5$，$n = 10 ^ 5$，大概需要 $9 * 10 ^ 9$ 次方的计算原子，会超时。

    **优点：** 可支持区间修改。

    如果数据量 $m = 10 ^ 4$，$n = 10 ^ 4$ ，大概需要 $10 ^ 8$ 次方的计算原子，很接近 $1$ s.

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    template <typename T> void read(T&);
    template <typename T> void print(T x);
    int gii(); LL gll(); double gff(); long double ghf();
    typedef __int128_t HH;
    const int N = 2000000;

    LL n, m;

    LL ars[N], srt[N];

    LL len, cnt;
    LL st[N], ed[N], pos[N];

    LL min_val = (1ll<<32), max_val = ~(1ll<<32);


    // 查第 k 大用
    LL get_big_cnt(LL left, LL right, LL val) {

        LL p = pos[left];
        LL q = pos[right];

        LL res = 0;

        if (p == q) {
            for (LL i = left; i <= right; i ++) {
                if (ars[i] > val) res ++;
            }
        }
        else {
            for (LL i = p + 1; i <= q - 1; i ++) {
                LL l = st[i], r = ed[i], mid;
                while (l < r) {
                    mid = (l + r) >> 1;
                    if (srt[mid] <= val) l = mid + 1;
                    else r = mid;
                }
                if (srt[r] > val) res += ed[i] - srt[r] + 1;
            }
            for (LL i = left; i <= ed[p]; i ++) {
                if (ars[i] > val) res ++;
            }
            for (LL i = st[q]; i <= right; i ++) {
                if (ars[i] > val) res ++;
            }
        }

        return res;

    }

    // 查第 k 小用
    LL get_small_cnt(LL left, LL right, LL val) {

        LL p = pos[left];
        LL q = pos[right];

        LL res = 0;

        if (p == q) {
            for (LL i = left; i <= right; i ++) {
                if (ars[i] < val) res ++;
            }
        }
        else {
            for (LL i = p + 1; i <= q - 1; i ++) {
                LL l = st[i], r = ed[i], mid;
                while (l < r) {
                    mid = (l + r + 1) >> 1;
                    if (srt[mid] < val) l = mid;
                    else r = mid - 1;
                }
                if (srt[l] < val) res += l - st[i] + 1;
            }
            for (LL i = left; i <= ed[p]; i ++) {
                if (ars[i] < val) res ++;
            }
            for (LL i = st[q]; i <= right; i ++) {
                if (ars[i] < val) res ++;
            }
        }

        return res;

    }

    void solve() {
        
    read(n); read(m);

        for (LL i = 1; i <= n; i ++) {
            read(ars[i]);
            srt[i] = ars[i];
            min_val = min(min_val, ars[i]);
            max_val = max(max_val, ars[i]);
        }

        len = sqrt(n);
        cnt = n / len;
        if (cnt * len < n) cnt ++;

        for (LL i = 1; i <= cnt; i ++) {
            st[i] = (i - 1) * len + 1;
            ed[i] = i * len;
        }

        ed[cnt] = n;

        for (LL i = 1; i <= n; i ++) {
            pos[i] = (i - 1) / len + 1;
        }

        for (LL i = 1; i <= cnt; i ++) {
            sort(srt + st[i], srt + ed[i] + 1);
        }

        while (m --) {
            LL left, right, k;
            read(left);
            read(right);
            read(k);

            // 第 k 小，那么有 k - 1 个更小的
            // 稍微大一点的第 k + 1 小，有 k 个甚至更多个小的
            // 满足 k - 1 个更小的，未必是答案，需要找右区间

            LL l = min_val, r = max_val, mid;
            while (l < r) {
                mid = (l + r + 1) >> 1;
                if (get_small_cnt(left, right, mid) <= k - 1) l = mid;
                else r = mid - 1;
            }

            printf ("%lld\n", l);
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