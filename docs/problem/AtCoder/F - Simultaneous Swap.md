# [F - Simultaneous Swap](https://atcoder.jp/contests/abc296/tasks/abc296_f)

=== "思维 构造 逆序对 贪心"

    对于下面的样例：

    ```
    1 2 3
    3 2 1
    ```

    为什么构造不出来呢？

    因为下面交换首和尾时就可以变成：

    ```
    1 2 3
    ```

    但是上面却只能交换 `1` 和 `2` 或者 `2` 和 `3` 是无法构造出来的；

    若对于下面的样例：

    ```
    1 2 2 3
    2 1 3 2
    ```

    为什么又能构造出来呢？

    对于下面，如果需要恢复成从小到大的顺序，需要交换 $2$ 次：

    ```
    1 2 2 3
    ```

    那么上面呢？交换 $2$ 次确实是可以交换一次后再交换回来，只要你能找到下一次交换的下标，我们是否可以假设：如果下面的逆序对有偶数个，就一定可以给上面交换过去又交换回来恢复原状呢？

    已经很解决答案了！！

    如果下面有重复元素呢？为了让上面尽可能的出现偶数交换次数，我们其实也可以交换下方相同元素的，所以，如果下面有相同元素，那么我们是不是就一定可以使得交换次数出现偶数次呢？

    思考一下，这是肯定可以实现的。

    但是有一个怀疑点在这里：

    ```
    1 2 2 3 5
    5 2 2 3 1
    ```

    上面确实有重复元素，并且逆序对如果不加上重复元素的交换的，只有 $7$ 个，交换 $5$ 和 $1$ 就可以使得下面呈现从小到大的顺序，但是上面因为交换了一次，肯定会打乱原有顺序，但如果我对下面再交换一次 $2$ 和 $2$ 呢？交换次数又多了一次，就有机会交换回来了，所以这个怀疑点还是可以行得通的。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 300000;

    LL n;
    LL a[N], b[N];

    struct Node {
        LL a, b, o;
        bool operator<(const Node& nd) const {
            if (a == nd.a) return b < nd.b;
            return a < nd.a;
        }
    };

    Node c[N];

    LL d[N];
    LL e[N];

    LL meld(LL l, LL r) {
        if (l >= r) return 0;

        LL res = 0;
        LL mid = (l + r) >> 1;

        res += meld(l, mid);
        res += meld(mid + 1, r);

        LL i = l, j = mid + 1, k = 0;
        while (i <= mid && j <= r) {
            if (d[i] < d[j]) {
                e[++ k] = d[i ++];
            }
            else {
                res += mid - i + 1;
                e[++ k] = d[j ++];
            }
        }

        while (i <= mid) e[++ k] = d[i ++];
        while (j <= r) e[++ k] = d[j ++];

        for (i = l, k = 1; i <= r; i ++, k ++) {
            d[i] = e[k];
        }

        return res;
    }

    void solve() {
        
        scanf ("%lld", &n);

        for (LL i = 1; i <= n; i ++) scanf ("%lld", a + i);
        for (LL i = 1; i <= n; i ++) scanf ("%lld", b + i);

        LL equals = 0;

        for (LL i = 1; i <= n; i ++) {
            c[i].a = a[i]; c[i].b = b[i];
            c[i].o = 0;
            if (a[i] != b[i]) equals = 1;
        }

        if (equals == 0) {
            printf ("Yes\n"); return;
        }

        sort(a + 1, a + 1 + n); sort(b + 1, b + 1 + n);

        for (LL i = 1; i <= n; i ++) 
            if (a[i] != b[i]) {printf ("No\n"); return;}

        sort(c + 1, c + 1 + n);

        for (LL i = 1; i <= n; i ++) {
            d[i] = c[i].b;
            // cout << c[i].a << " " << c[i].b << endl;
            // if (i <= n && c[i].a == c[i + 1].a && c[i].b != c[i + 1].b) {
            if (i <= n && c[i].a == c[i + 1].a) {
                printf ("Yes\n"); return;
            }
        }

        LL sm = meld(1, n);

        // printf ("%lld\n", sm);

        if (sm & 1) printf ("No\n");
        else printf ("Yes\n");
        
    }

    int main() {

        solve();

        return 0;
    }
    ```