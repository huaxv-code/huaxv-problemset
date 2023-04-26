# [Treap 堆平衡树](https://www.luogu.com.cn/problem/P3369)

=== "Treap 堆平衡树"

    给每一个新插入的值，随机分配一个优先值，先按照普通搜索树的方式，将新值插入到底部的空节点处，插入后就要按照优先值进行一个调整，如果当前节点的优先值比父亲节点的还大，就要往上调，调不是乱调的，要基于旋转，不破坏搜索树的特性的情况下去旋转，将下方的节点旋到上方去。

    删除呢？如果要删除当前节点，那么先获取优先度最高的子节点，将子节点调整到上方，然后删除当前节点，这样就可以不破坏平衡性的情况下，将当前节点不断地推往底部的空节点处，删除。

    查询插入的复杂度都是 $O(log(n))$，与概率随机有关。

    <!-- ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    const LL N = 1000000;

    LL n;

    struct Node {
        LL ls, rs;
        LL val, key;
        LL size; // 统计子树的大小
    } tr[N];

    LL space[N], ant;

    void new_node(LL& root, LL x) {
        LL t = space[ant --];
        tr[t].val = x; 
        tr[t].key = rand();
        tr[t].size = 1;
        root = t;
    }

    void del_node(LL& root) {
        tr[root].val = 0;
        tr[root].key = 0;
        tr[root].size = 0;
        tr[root].ls = 0;
        tr[root].rs = 0;
        space[++ ant] = root;
        root = 0;
    }

    void update_size(LL t) {
        if (!t) tr[0].size = 0;
        else tr[t].size = tr[tr[t].ls].size + tr[tr[t].rs].size + 1;
    }

    // 0 表示左->右旋，1 表示右->左旋
    void rotate(LL& root, LL mode) {
        LL t = 0;
        if (!mode) {
            t = tr[root].ls;
            tr[root].ls = tr[t].rs;
            tr[t].rs = root;
        }
        else {
            t = tr[root].rs;
            tr[root].rs = tr[t].ls;
            tr[t].ls = root;
        }
        swap(t, root);
        update_size(t);    // 更新子树大小
        update_size(root); // 更新子树大小
    }


    void insert(LL& root, LL x) {
        if (!root) {
            new_node(root, x);
            return;
        }

        if (tr[root].val > x) {
            insert(tr[root].ls, x);
            update_size(root);
            if (tr[root].key < tr[tr[root].ls].key) rotate(root, 0);
        }
        else {
            insert(tr[root].rs, x);
            update_size(root);
            if (tr[root].key < tr[tr[root].rs].key) rotate(root, 1);
        }
    }

    void erase(LL& root, LL x) {
        if (!root) return;
        LL ls = tr[root].ls;
        LL rs = tr[root].rs;
        if (tr[root].val == x) {
            if (!ls && !rs) {
                del_node(root);
                return;
            }
            else if (!ls || !rs) {
                del_node(root);
                root = ls + rs;
                return;
            }
            else {
                if (tr[ls].key > tr[rs].key) {
                    rotate(root, 0);
                    erase(tr[root].rs, x);
                }
                else {
                    rotate(root, 1);
                    erase(tr[root].ls, x);
                }
            }
        }
        else if (tr[root].val > x) erase(tr[root].ls, x);
        else erase(tr[root].rs, x);

        update_size(root);
    }

    LL number(LL root, LL x) {
        if (!root) return 0;
        LL ls = tr[root].ls;
        LL rs = tr[root].rs;
        if (tr[root].val < x) return tr[ls].size + 1 + number(rs, x);
        else return number(ls, x);
    }

    LL get_kth(LL root, LL k) {
        LL ls = tr[root].ls;
        LL rs = tr[root].rs;
        if (k == tr[ls].size + 1) return tr[root].val;
        else if (k > tr[ls].size + 1) return get_kth(rs, k - tr[ls].size - 1);
        else return get_kth(ls, k);
    }

    LL root;

    void solve() {
        
        scanf ("%lld", &n);

        srand(time(NULL));

        for (LL i = 1; i <= N - 1; i ++) space[++ ant] = i;

        while (n --) {
            LL mo, x;
            scanf ("%lld%lld", &mo, &x);
            switch (mo) {
                case 1: insert(root, x); break;
                case 2: erase(root, x); break;
                case 3: printf ("%lld\n", number(root, x) + 1); break;
                case 4: printf ("%lld\n", get_kth(root, x)); break;
                case 5: printf ("%lld\n", get_kth(root, number(root, x))); break;
                default: printf("%lld\n", get_kth(root, number(root, x + 1) + 1)); break;
            }
        }
    }

    int main() {

        solve();

        return 0;
    }
    ``` -->

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 1000000 + 100;

    LL n;

    struct Node {
        LL ls, rs, val, key, size;
    } tr[N];

    LL space[N], ant;

    void new_node(LL& root, LL x) {
        LL t = space[ant --];
        tr[t].val = x;
        tr[t].key = rand();
        tr[t].size = 1;
        root = t;
    }

    void del_node(LL& root) {
        tr[root].ls = 0;
        tr[root].rs = 0;
        tr[root].val = 0;
        tr[root].key = 0;
        tr[root].size = 0;
        space[++ ant] = root;
        root = 0;
    }

    LL& ls(LL root) { return tr[root].ls; }
    LL& rs(LL root) { return tr[root].rs; }

    void update_size(LL root) {
        if (root == 0) return;
        tr[root].size = tr[ls(root)].size + tr[rs(root)].size + 1;
    }

    void rotate(LL& root, LL mode) {
        if (root == 0) return;
        LL t;
        if (mode == 0) {
            t = tr[root].ls;
            tr[root].ls = tr[t].rs;
            tr[t].rs = root;
        }
        else {
            t = tr[root].rs;
            tr[root].rs = tr[t].ls;
            tr[t].ls = root;
        }

        swap(t, root);
        update_size(t);
        update_size(root);
    }

    void insert(LL& root, LL x) {
        if (root == 0) {
            new_node(root, x);
            return;
        }

        if (tr[root].val > x) insert(ls(root), x);
        else insert(rs(root), x);

        update_size(root);

        if (ls(root) && tr[root].key < tr[ls(root)].key) rotate(root, 0);
        if (rs(root) && tr[root].key < tr[rs(root)].key) rotate(root, 1);
    }

    void erase(LL& root, LL x) {
        if (root == 0) return;
        if (tr[root].val == x) {
            if (ls(root) == 0 && rs(root) == 0) { del_node(root); return; }
            else if (ls(root) == 0 || rs(root) == 0) { LL t = ls(root) + rs(root); del_node(root); root = t; return; }
            else {
                if (tr[ls(root)].key > tr[rs(root)].key) {
                    rotate(root, 0);
                    erase(rs(root), x);
                    update_size(root);
                    return;
                }
                else {
                    rotate(root, 1);
                    erase(ls(root), x);
                    update_size(root);
                    return;
                }
            }
        }
        else if (tr[root].val > x) {
            erase(ls(root), x);
            update_size(root);
            return;
        }
        else {
            erase(rs(root), x);
            update_size(root);
            return;
        }
    }

    LL get_kth(LL& root, LL k) {
        if (root == 0) { exit(114514); }
        if (tr[ls(root)].size + 1 == k) return tr[root].val;
        else if (k > tr[ls(root)].size + 1) return get_kth(rs(root), k - tr[ls(root)].size - 1);
        else return get_kth(ls(root), k);
    }

    LL get_id(LL& root, LL x) {
        if (root == 0) return 0;
        if (tr[root].val < x) return tr[ls(root)].size + 1 + get_id(rs(root), x);
        else return get_id(ls(root), x);
    }

    void dfs(LL root) {
        if (root == 0) return;
        dfs(ls(root));
        printf("%lld ", tr[root].val);
        dfs(rs(root));
    }

    LL root;

    void solve() {
        
        scanf ("%lld", &n);

        for (LL i = 1; i < N && ant < N - 1; i ++) space[++ ant] = i;

        while (n --) {
            LL mo, x;
            scanf ("%lld%lld", &mo, &x);
            switch (mo) {
                case 1: insert(root, x); break;
                case 2: erase(root, x); break;
                case 3: printf("%lld\n", get_id(root, x) + 1); break;
                case 4: printf("%lld\n", get_kth(root, x)); break;
                case 5: printf("%lld\n", get_kth(root, get_id(root, x))); break;
                default: printf("%lld\n", get_kth(root, get_id(root, x + 1) + 1)); break;
            }
        }
        
        
    }

    int main() {

        solve();

        return 0;
    }
    ```