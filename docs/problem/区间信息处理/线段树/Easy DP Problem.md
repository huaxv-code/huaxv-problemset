# [Easy DP Problem](https://codeforces.com/gym/102770/problem/E)

=== "可持久化线段树寻找前 k 大和"

    ```c++
    #pragma G++ optimize(2) // 开 o2 加速
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;
    const LL N = 100100;
    LL M;

    inline LL read()
    {
        LL x = 0, f = 1;
        char c = getchar();
        while (!(c >= '0' && c <= '9')) 
        {if (c == '-') f = -1; c = getchar();}
        while ((c >= '0' && c <= '9'))
        {x = x * 10 + c - '0'; c = getchar();}
        return x * f;
    }

    struct Node
    {
        LL sum, cnt;
        LL ls, rs;
    } tr[N << 5];
    LL ant;

    LL a[N], n, m;
    LL pw[N];
    LL srt[N], cnt;

    inline LL& ls(LL p) { return tr[p].ls; }
    inline LL& rs(LL p) { return tr[p].rs; }

    LL head[N];

    inline void build(LL& p, LL l, LL r)
    {
        p = ++ ant;
        tr[p] = Node{0, 0, 0, 0};
        if (l == r) return;
        LL mid = (l + r) >> 1;
        build(ls(p), l, mid);
        build(rs(p), mid + 1, r);
    }

    inline void push_up(LL p, LL l, LL r)
    {
        if (l == r) return;
        tr[p].sum = tr[ls(p)].sum + tr[rs(p)].sum;
        tr[p].cnt = tr[ls(p)].cnt + tr[rs(p)].cnt;
    }

    inline void insert(LL pl, LL& pr, LL l, LL r, LL pos)
    {
        if (pr == 0 || pr == pl) 
        {
            pr = ++ ant;
            tr[pr] = Node{0, 0, 0, 0};
            tr[pr].sum = tr[pl].sum;
            tr[pr].cnt = tr[pl].cnt;
            ls(pr) = ls(pl);
            rs(pr) = rs(pl);
        }
        if (l == r) { tr[pr].sum += srt[pos]; tr[pr].cnt ++; return; }
        LL mid = (l + r) >> 1;
        if (pos <= mid) insert(ls(pl), ls(pr), l, mid, pos);
        else insert(rs(pl), rs(pr), mid + 1, r, pos);
        push_up(pr, l, r);
    }

    inline LL query(LL pl, LL pr, LL l, LL r, LL k)
    {
        if (k == 0) return 0;
        if (l == r) { return srt[l] * k; }
        LL mid = (l + r) >> 1;
        LL res = 0;
        if (k > tr[rs(pr)].cnt - tr[rs(pl)].cnt) 
        {
            res += tr[rs(pr)].sum - tr[rs(pl)].sum;
            res += query(ls(pl), ls(pr), l, mid, k - (tr[rs(pr)].cnt - tr[rs(pl)].cnt));
        }
        else res += query(rs(pl), rs(pr), mid + 1, r, k);
        return res;
    }

    inline void solve()
    {
        ant = 0;
        cnt = 0;
        n = read();
        for (LL i = 1; i <= n; i ++) a[i] = read();
        for (LL i = 1; i <= n; i ++) srt[i] = a[i];
        sort(srt + 1, srt + 1 + n); 
        cnt = unique(srt + 1, srt + 1 + n) - srt - 1;
        M = cnt;
        for (LL i = 1; i <= n; i ++) pw[i] = pw[i - 1] + i * i;
        head[0] = 0;
        build(head[0], 1, M);
        for (LL i = 1; i <= n; i ++)
        {
            head[i] = 0;
            insert(head[i - 1], head[i], 1, M, lower_bound(srt + 1, srt + 1 + cnt, a[i]) - srt);
        }
        m = read();
        while (m --)
        {
            LL l = read(), r = read(), k = read();
            LL i = r - l + 1, j = k;
            LL res = pw[i];
            if (j >= i) res += query(head[l - 1], head[r], 1, M, i);
            else res += query(head[l - 1], head[r], 1, M, j);
            printf ("%lld\n", res);
        }
    }

    int main()
    {
        LL t = read();
        while (t --)
        solve();
        
        return 0;
    }
    ```