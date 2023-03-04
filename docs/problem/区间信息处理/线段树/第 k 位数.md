# 第 k 位数

??? question "[问题描述](https://www.luogu.com.cn/problem/P1168)"

    有 $n$ 次操作，每次操作有两种方案：

    - 如果是奇数项，就插入 $as[i]$ 并查询前面第 $k$ 大的数.
    - 如果是偶数项，直接插入 $as[i]$

    **数据范围**

    $1 \leq n \leq 10 ^ 5$

    $1 \leq as[i] \leq 10 ^ 9$

## 线段树 + 离散化 + 桶

先离散化所有插入的元素 $as[i]$ 找出他们的相对大小，每插入一个新元素 $as[i]$ 时，就要将该新元素装入对应的桶中，如果要查询前第 $k$ 大的数，有些桶是没有元素的，但有些桶装了很多元素，我们借助线段树，统共某区间所有桶所装的元素个数和，不断查询第 $k$ 个数所在的桶.

??? success "中位数 - 代码参考"

    ```java
    import java.io.* ;
    import java.math.* ;
    import java.util.* ;



    class Main {

        static BufferedReader cin = 
            new BufferedReader (
                new InputStreamReader (System.in)
            );

        static PrintWriter cout = new PrintWriter (
            new OutputStreamWriter (System.out)
        );
        
        int n;
        int ct;
        long[] as;
        long[] st;

        class Node {
            long val;
            Node l, r;
            public Node() {
                this(0);
            }
            public Node(long x) {
                this(x, null, null);
            }
            public Node(long x, Node left, Node right) {
                val = x;
                l = left;
                r = right;
            }
        }

        Node root = null;

        public void pushUp(Node p, int l, int r) {
            if (l >= r) return;

            p.val = p.l.val + p.r.val;
        }

        public Node build(int l, int r) {
            if (l == r) {
                return new Node();
            }

            int mid = (l + r) >> 1;
            return new Node(0, build(l, mid), build(mid + 1, r));
        }

        public void update(Node p, int l, int r, int pos, long x) {
            if (pos <= l && r <= pos) {
                p.val += x;
                return;
            }

            int mid = (l + r) >> 1;

            if (pos <= mid) {
                update(p.l, l, mid, pos, x);
            }

            if (pos > mid) {
                update(p.r, mid + 1, r, pos, x);
            }

            pushUp(p, l, r);
        }

        public long query(Node p, int l, int r, long k) {
            if (l == r) {
                return l;
            }

            int mid = (l + r) >> 1;

            if (p.l.val < k) {
                return query(p.r, mid + 1, r, k - p.l.val);
            }

            return query(p.l, l, mid, k);
        }

        public int unique() {
            int i = 1, j = 2;
            while (j <= n) {
                if (st[i] != st[j]) {
                    st[++ i] = st[j];
                }
                j ++;
            }
            return i;
        }

        public int lf(long x) {
            int l = 1, r = ct, mid;
            while (l < r) {
                mid = (l + r) >> 1;
                if (st[mid] < x) l = mid + 1;
                else r = mid;
            }

            if (st[r] == x) return r;
            else return -1;
        }
        
        public void solve() throws Exception {
            
            n = Integer.parseInt(cin.readLine());
            String[] ts = cin.readLine().split(" ");

            as = new long[n + 1];
            st = new long[n + 1];

            for (int i = 1; i <= n; i ++) {
                as[i] = Long.parseLong(ts[i - 1]);
                st[i] = as[i];
            }

            Arrays.sort(st, 1, n + 1);

            ct = unique();

            root = build(1, ct);

            for (int i = 1; i <= n; i ++) {
                update(root, 1, ct, lf(as[i]), 1);
                if ((i & 1) == 1) {
                    cout.println(st[(int)query(root, 1, ct, (i >> 1) + 1)]);
                }
            }

            cout.flush();
        }
        
        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            
        }
    }
    ```