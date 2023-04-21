# [B. Elimination of a Ring](https://codeforc.es/problemset/problem/1761/B)

=== "构造思维题"

    给你一个环，刚刚开始时，任意两个相邻的整数都是不同的。

    你需要执行 $m$ 次操作，每执行一次操作，需要删除环中的一个元素；

    如果删除元素 $x$ 后，出现了相邻整数相同的情况，那么就会合并成一个整数；

    问若要删除环上的所有整数，$m$ 最大是多少？

    ---

    一个易犯的思维误区：每次都删除一个 $x$，只要删掉这个 $x$ 后左右元素不相同就行；

    这是错误的，例如：$[3 2 1 2 1]$ 若一开始就删除 $3$，那么剩余元素 $[2, 1, 2, 1]$ 就得删 $3$ 次；
    
    若一开始就删 $2$，那么剩余元素 $[3, 1, 2, 1]$ 可以删除 $4$ 次；

    所以最优思路：

    如果某个元素只出现了一次，那么只要不断地删除该元素的左边和右边，就可以使得删除次数最大，因为有这个特殊元素隔离；

    如果不存在元素只出现一次，我们是否可以将某元素删成只有一次呢？

    若一开始的环是：$0 1 0 1 0 1 \cdots 0 1$ 的，那么无论怎么删，最大次数都只能是 $n / 2 + 1$

    剩下的情况，我们可以选取其中一种元素，以他为中心，一直删除左边和右边，如果不能删了再换另外一个，那么最终是什么样的状态呢？

    不可能每种元素都有 $2$ 个吧？如果有 $2$ 个还是可以删除的，所以最终肯定会有某种元素只剩 $1$ 个，那么就以该元素为中心左右删就行，所以最大次数还是 $n$

    ??? warning "思维陷阱"

        ```c++
        #include <bits/stdc++.h>

        using namespace std;
        typedef long long LL;
        typedef __int128_t HH;

        const LL N = 1000;

        LL n;
        LL res;

        void solve() {
            
            scanf ("%lld", &n);
            vector<LL> ars;
            for (LL i = 1; i <= n; i ++) {
                LL t; scanf ("%lld", &t);
                ars.push_back(t);
            }

            res = 0;

            while (ars.size()) {
                LL tn = ars.size();
                for (LL i = 0; i < ars.size(); i ++) {
                    if (ars.size() > 2 && ars[(i - 1 + n) % n] == ars[(i + 1) % ars.size()])
                        continue;
                    res ++;
                    ars.erase(ars.begin() + i);
                }
                if (tn == ars.size()) {
                    ars.erase(ars.begin());
                    if (ars.size()) ars.erase(ars.begin());
                    res ++;
                }
            }

            printf ("%lld\n", res);

        }

        int main() {

            LL t; scanf ("%lld", &t);
            while (t --)
            solve();

            return 0;
        }
        ```

    ```c++

    ```