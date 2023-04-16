# [可持久化线段树-区间第 k 大](https://www.luogu.com.cn/problem/P3834)

=== "可持久化线段树：基于前缀和思想的众多线段树"

    对于区间 $[1, n]$，如果我能求出任意一个区间 $[1, i]$ 的线段树，那么对于任意的子区间 $[l, r]$ 是否都可以由上面的线段树推导而出呢？

    是的：$[l, r]$ 构成的线段树，完全可以由两个线段树 $[1, r] - [1, l - 1]$ 得来，并且，对于 $[1, i + 1]$ 够成的线段树来说，该线段树与 $[1, i]$ 构成的线段树，只会有一条从根节点到叶子节点的路径不同，因为只插入了一个点，只动了其中的一个枝条，那些没动的子树完全可以用指针指向之前未动的子树，我们只需要添加新的子树就行。【共用点】

    建立一颗线段树需要 $4n$ 个节点，总共需要建立 $n$ 个分支，并且每个分支的长度大概在 $log(4n)$ 内，所以总共需要消耗：$4n + nlog(4n)$ 个节点的深度，假设 $n = 2000000$，则 $log(4n)$ 趋近于 $24$ 个，所以取空间 $n << 5$ 是完全够用的，那么我们创建了多少空间呢？

    大概创建了 $500$ MB 的空间！

    为了空间不爆，我牺牲点时间换空间，没有用静态开点，取而代之是用动态开点，借助指针，`new` 一个对象出来。

    如果不优化空间，就暴力建立 $n$ 棵线段树，需要消耗多少空间呢？大概在 $4 * n ^ 2 = 116$ T，也就需要 $116$ 块 $1$ T 硬盘的内存而已！！！
 
    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    template <typename T> void read(T&);
    template <typename T> void print(T x);
    int gii(); LL gll(); double gff(); long double ghf();
    typedef __int128_t HH;
    const int N = 2000000;

    LL n, Q;
    LL qs[N]; // 真实数组
    LL so[N]; // 离散的
    LL cnt;
    LL first, last;

    LL find(LL x) {
        LL l = 1, r = cnt, mid;
        while (l < r) {
            mid = (l + r) >> 1;
            if (so[mid] < x) l = mid + 1;
            else r = mid;
        }
        if (so[r] == x) return r;
        return -1;
    }

    struct Node {
        LL val;
        LL cnt;
        Node* lc, *rc;
        Node(LL x = 0, LL y = 0, Node* left = nullptr, Node* right = nullptr) {
            val = x; cnt = y; lc = left; rc = right;
        }
        Node(LL x, Node* left, Node* right) {
            val = x; lc = left; rc = right;
        }
    };

    Node* trees[N];

    void push_up(Node* rt, LL l, LL r) {
        if (l == r) return;
        if (rt == nullptr) return;
        if (rt->lc) rt->cnt += rt->lc->cnt;
        if (rt->rc) rt->cnt += rt->rc->cnt;
    }

    // 初始化 0 个点的线段树
    Node* build(Node* rt, LL l, LL r) {
        if (rt == nullptr) rt = new Node();
        if (l == r) {
            rt->val = l;
            return rt;
        }
        LL mid = (l + r) >> 1;
        rt->lc = build(rt->lc, l, mid);
        rt->rc = build(rt->rc, mid + 1, r);

        push_up(rt, l, r);

        return rt;
    }

    // 每插入一个点，建立一颗前缀和线段树
    Node* create(Node* rt, Node* next, LL l, LL r, LL x) {
        if (rt == nullptr) {
            cout << x << endl;
            cout << "error here" << endl;
            exit(114514);
        }
        if (next == nullptr) next = new Node();
        if (x <= l && r <= x) {
            next->val = x;
            next->cnt = rt->cnt + 1; // 个数 + 1
            return next;
        }

        LL mid = (l + r) >> 1;

        if (x <= mid) {
            next->rc = rt->rc;
            next->lc = create(rt->lc, next->lc, l, mid, x);
        } 
        else {
            next->lc = rt->lc;
            next->rc = create(rt->rc, next->rc, mid + 1, r, x);
        }

        push_up(next, l, r);

        return next;
    }

    // 建立 n 棵前缀和线段树
    void init() {
        for (LL i = 0; i <= n; i ++) {
            trees[i] = nullptr;
        }
        trees[0] = build(trees[0], first, last);
        // return;
        for (LL i = 1; i <= n; i ++) {
            trees[i] = create(trees[i - 1], trees[i], first, last, find(qs[i]));
        }
    }

    // 查找区间 [l, r] 第 k 大
    LL query(Node* ltr, Node* rtr, LL l, LL r, LL k) {
        if (ltr == nullptr || rtr == nullptr) return -1;
        if (k > rtr->cnt - ltr->cnt) return -1;
        if (l == r) return ltr->val;
        LL mid = (l + r) >> 1;
        LL lval = rtr->lc->cnt - ltr->lc->cnt;
        LL rval = rtr->rc->cnt - ltr->rc->cnt;

        if (k > lval) {
            return query(ltr->rc, rtr->rc, mid + 1, r, k - lval);
        } else {
            return query(ltr->lc, rtr->lc, l, mid, k);
        }
    }

    void solve() {
        
        n = gll(); Q = gll();
        for (LL i = 1; i <= n; i ++) {
            qs[i] = gll();
            so[i] = qs[i];
        }

        sort(so + 1, so + 1 + n);

        cnt = unique(so + 1, so + 1 + n) - so - 1;
        
        first = 1, last = cnt;

        init();

        // cout << "Debug here" << endl;
        // return;

        while (Q --) {
            LL a = gll(), b = gll(), c = gll();
            printf ("%lld\n", so[query(trees[a - 1], trees[b], first, last, c)]);
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