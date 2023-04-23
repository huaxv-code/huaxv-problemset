# [B. Roof Construction](https://codeforc.es/problemset/problem/1632/B)

=== "规律 构造 模拟"

    我们无论怎么排，最终都能发现最高的 $1$ 是无法消去的，既然无法消去，那么我们能不能只保留最高位的一个 $1$ 呢？

    我们还观察到，拥有最高位 $1$ 的个数，一定不会超过不拥有最高位 $1$ 的个数的，所以上面的猜想确实可行！

    到后面还需要考虑相间分布的问题，相同 $1$ 的可以放一起，不含相同 $1$ 的可以靠在一起。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    LL n;

    LL lowbit(LL x) {
        return x & (-x);
    }

    LL first_one(LL x) {
        LL res = 0;
        while (x) {
            x >>= 1; res ++;
        }
        return res;
    }

    void solve() {
        
        scanf ("%lld", &n);

        n --;

        LL ln = first_one(n);
        LL p = 1 << (ln - 1);
        LL q = 0;
        LL ts = 0;
        if ((n - p + 1) & 1) ts = 1;
        while (p <= n) {
            LL a = p, b = q;
            if ((ts & 1) == 0) swap(a, b);
            ts ++;
            printf ("%lld %lld ", a, b);
            p ++; q ++;
        }
        p = 1 << (ln - 1);
        while (q < p) {
            printf ("%lld ", q); q ++;
        }
        puts("");
        
    }

    int main() {

        LL t; scanf ("%lld", &t);
        while (t --)
        solve();

        return 0;
    }
    ```