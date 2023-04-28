# [FHQ Treap 分裂合并的堆平衡树](https://www.luogu.com.cn/problem/P3369)

=== "FHQ Treap 分裂合并的堆平衡树"

    仍然是大根堆。

    最核心的两个操作：分裂、合并。

    分裂并不是按照键值优先级来划分的，而是直接按照权值划分，将搜索树划分成左右两棵树，其中左边的数的所有元素都小于或者等于 $x$，右边的数都严格大于 $x$。

    这里有个疑问就是，左边的树和右边的树还会是大根堆吗？

    答案是肯定的，细看下面的代码，如果当前节点的值不超过 $x$，那么当前节点的左子树及当前节点都应该拿出来作为左边分割的子树的一部分，这部分仍维持原有的大根堆特性，然后这部分的当前根节点的右边还是未确定的状态，因为当前节点的右边可能仍然存在一些节点不超过 $x$ 的，所以还需要往右边找，这个过程往右边找，右边的键值也只能小于当前节点，所以并不会破坏大根堆的特性。

    ```c++ title="split"
    void split(LL r, LL x, LL& p, LL& q) 
    {
        if (r == 0) { p = 0; q = 0; return; }
        if (tr[r].val <= x)
        {
            p = r;
            split(rs(r), x, rs(r), q);
        }
        else 
        {
            q = r;
            split(ls(r), x, p, ls(r));
        }
        update(p);
        update(q);
    }
    ```

    合并操作呢？为了合并时并不破坏大根堆的特性，到底是选取左边的根作为根还是右边的根作为根呢？肯定要选取大的根作为根，剩下需要递归合并还未确定合并的部分，这仍然没有破坏大根堆的特性。

    ```c++ title="meld"
    // 合并两树
    void meld(LL& r, LL p, LL q) 
    {
        if (p == 0 || q == 0) { r = p + q; return; }
        if (tr[p].key >= tr[q].key)
        {
            r = p;
            meld(rs(r), rs(p), q);
        }
        else
        {
            r = q;
            meld(ls(r), p, ls(q));
        }
        update(r);
    }
    ```

    剩下所有的操作都围绕这两个分裂、合并操作展开实现。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 1000100;
    const LL inf = ~(1ll << 63);

    LL n;

    struct Node
    {
        LL val, key, ls, rs, size;
    };

    Node tr[N];
    LL space[N], ant;

    void new_node(LL& r, LL x) 
    {
        r = space[ant --];
        tr[r].val = x;
        tr[r].key = rand();
        tr[r].ls = 0;
        tr[r].rs = 0;
        tr[r].size = 1;
    }

    void del_node(LL& r)
    {
        space[++ ant] = r;
        tr[r].val = 0;
        tr[r].key = 0;
        tr[r].ls = 0;
        tr[r].rs = 0;
        tr[r].size = 0;
        r = 0;
    }

    inline LL& ls(LL r) { return tr[r].ls; }
    inline LL& rs(LL r) { return tr[r].rs; }

    void update(LL r) 
    {
        if (r == 0) { tr[r].size = 0; return; }
        tr[r].size = tr[ls(r)].size + tr[rs(r)].size + 1;
    }

    // 按照值 x 分裂成两棵子树
    // 左子树一定都小于等于 x
    // 右子树一定大于 x

    void split(LL r, LL x, LL& p, LL& q) 
    {
        if (r == 0) { p = 0; q = 0; return; }
        if (tr[r].val <= x)
        {
            p = r;
            split(rs(r), x, rs(r), q);
        }
        else 
        {
            q = r;
            split(ls(r), x, p, ls(r));
        }
        update(p);
        update(q);
    }

    // 合并两树
    void meld(LL& r, LL p, LL q) 
    {
        if (p == 0 || q == 0) { r = p + q; return; }
        if (tr[p].key >= tr[q].key)
        {
            r = p;
            meld(rs(r), rs(p), q);
        }
        else
        {
            r = q;
            meld(ls(r), p, ls(q));
        }
        update(r);
    }

    void insert(LL& r, LL x) 
    {
        LL p, q, t;
        split(r, x, p, q);
        new_node(t, x);
        meld(p, p, t);
        meld(r, p, q);
    }

    void erase(LL& r, LL val) 
    {
        LL p, q;
        // 分割成小于等于 val 的树，和大于 val 的树
        split(r, val, p, q);

        // 为了能删掉 val，上面分割出的 p 树的根并不一定就是 val
        // 那怎么办呢？
        LL x, y;
        split(p, val - 1, x, y); // 这样就能分割成小于 val 的树，和等于 val 的树了
        meld(x, x, ls(y));
        meld(x, x, rs(y));
        del_node(y);
        meld(r, x, q);
    }

    LL get_id(LL r, LL x) 
    {
        if (r == 0) return 0;
        if (tr[r].val < x) return tr[ls(r)].size + 1 + get_id(rs(r), x);
        else return get_id(ls(r), x);
    }

    LL get_kth(LL r, LL k) 
    {
        if (r == 0) return inf;
        if (k == tr[ls(r)].size + 1) return tr[r].val;
        else if (k > tr[ls(r)].size + 1) return get_kth(rs(r), k - tr[ls(r)].size - 1);
        else return get_kth(ls(r), k);
    }

    void dfs(LL r, LL last)
    {
        if (r == 0) return;
        if (tr[r].key > last) { printf("error\n"); return; }
        dfs(ls(r), tr[r].key);
        dfs(rs(r), tr[r].key);
    }

    LL root;

    void solve()
    {
        
        scanf ("%lld", &n);

        for (LL i = 1; i < N && ant < N - 1; i ++) space[++ ant] = i;

        while (n --)
        {
            LL mo, x;
            scanf ("%lld%lld", &mo, &x);
            switch(mo)
            {
                case 1: insert(root, x); break;
                case 2: erase(root, x); break;
                case 3: printf ("%lld\n", get_id(root, x) + 1); break;
                case 4: printf ("%lld\n", get_kth(root, x)); break;
                case 5: printf ("%lld\n", get_kth(root, get_id(root, x))); break;
                case 6: printf ("%lld\n", get_kth(root, get_id(root, x + 1) + 1)); break;
            }
        }

        dfs(root, inf);
        
    }

    int main()
    {
        
        solve();
        
        return 0;
    }
    ```