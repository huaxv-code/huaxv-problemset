# [B. Candies](https://codeforc.es/problemset/problem/1810/B)

=== "思维 + 规律 + 构造"

    如果 $n$ 是偶数，是一定无法构造出来的。

    如果 $n$ 是末尾有两个 $1$，那么肯定可以由 $n >> 1$ 执行 $\times 2 + 1$ 构造而来；

    如果 $n$ 末尾是 $01$，那么肯定可以由 $n + 1 >> 1$ 执行 $\times 2 - 1$ 构造而来；

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 1000;

    LL n;

    void solve() {
        
        scanf ("%lld", &n);

        if ((n & 1) == 0) {
            printf ("-1\n"); return;
        }

        LL res = 0;
        stack<LL> st;
        
        while (n > 1) {
            LL a = n & 1;
            LL b = (n >> 1) & 1;
            n >>= 1;
            res ++;
            if (b == 1) {
                st.push(2);
                continue;
            }
            n += 1;
            st.push(1);
        }

        printf ("%lld\n", res);
        while (st.size()) {
            printf ("%lld ", st.top()); st.pop();
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