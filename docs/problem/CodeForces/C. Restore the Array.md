# [C. Restore the Array](https://codeforc.es/problemset/problem/1811/C)

=== "规律模拟构造"

    给定一个长度为 $n$ 的数组 $a$，其中数组 $b$ 有 $n - 1$ 个数据，$b[i] = \max(a[i], a[i + 1])$.

    现在已知数组 $b$，叫你重构出数组 $a$。

    如果 $b[i] < b[i + 1]$ 说明元素 $a[i - 1], a[i], a[i + 1]$ 中的元素 $a[i]$ 一定不可能是 $b[i + 1]$，令 $a[i] = a[i - 1] = b[i]$ 是可以满足条件的；

    如果 $b[i] > b[i + 1]$ 说明元素 $a[i - 1], a[i], a[i + 1]$ 中的元素 $a[i]$ 一定不是 $b[i]$，$a[i - 1]$ 一定是 $b[i]$，$a[i]$ 和 $a[i + 1]$ 可以是 $b[i + 1]$.

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 300000;

    LL n;
    LL a[N];
    LL b[N];

    void solve() {
        
        scanf ("%lld", &n);

        for (LL i = 0; i <= n; i ++) {
            a[i] = 0; b[i] = 0;
        }

        for (LL i = 1; i < n; i ++) {
            scanf ("%lld", b + i);
        }

        for (LL i = 1; i < n; i ++) {
            if (b[i] < b[i - 1]) {
                a[i - 1] = b[i];
                a[i - 2] = b[i - 1];
                a[i] = b[i];
            }
            else {
                a[i] = b[i];
                a[i - 1] = b[i - 1];
            }
        }

        for (LL i = 0; i < n; i ++) {
            printf ("%lld ", a[i]);
        }
        printf ("\n");
        
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```
