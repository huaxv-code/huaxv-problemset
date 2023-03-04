# XOR的艺术

[问题链接](https://www.luogu.com.cn/problem/P2574)

??? warning "MLE"

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

        class Node {
            long val;
            long tag;
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
                tag = 0;
            }
            public Node(Node left, Node right) {
                l = left;
                r = right;
                val = l.val + r.val;
                tag = 0;
            }
        }
        
        int n, m;
        long[] as;
        Node root;

        public void pushUp(Node p, int l, int r) {
            if (l == r) return;

            p.val = p.l.val + p.r.val;
        }

        public Node build(int l, int r) {
            if (l == r) {
                return new Node(as[l]);
            }

            int mid = (l + r) >> 1;

            return new Node(build(l, mid), build(mid + 1, r));
        }

        public void set(Node p, int l, int r) {
            p.val = (long)(r - l + 1) - p.val;
        }

        public void pushDown(Node p, int l, int r) {
            if ((p.tag & 1) == 0 || l == r) {
                p.tag = 0; 
                return;
            }

            p.l.tag ++;
            p.r.tag ++;
            p.tag = 0;

            int mid = (l + r) >> 1;
            set(p.l, l, mid);
            set(p.r, mid + 1, r);

            pushUp(p, l, r);
        }

        public void update(Node p, int l, int r, int ll, int rr) {
            if (ll <= l && r <= rr) {
                p.tag ++;
                set(p, l, r);
                return;
            }

            int mid = (l + r) >> 1;

            pushDown(p, l, r);

            if (ll <= mid) {
                update(p.l, l, mid, ll, rr);
            }

            if (rr > mid) {
                update(p.r, mid + 1, r, ll, rr);
            }

            pushUp(p, l, r);
        }

        public long query(Node p, int l, int r, int ll, int rr) {
            if (ll <= l && r <= rr) {
                return p.val;
            }

            int mid = (l + r) >> 1;
            int res = 0;
            pushDown(p, l, r);

            if (ll <= mid) {
                res += query(p.l, l, mid, ll, rr);
            }
            if (rr > mid) {
                res += query(p.r, mid + 1, r, ll, rr);
            }

            return res;
        }
        
        public void solve() throws Exception {
            
            String[] ts = cin.readLine().split(" ");
            n = Integer.parseInt(ts[0]);
            m = Integer.parseInt(ts[1]);
            as = new long[n + 10];

            ts = cin.readLine().split(" ");
            for (int i = 1; i <= n; i ++) {
                as[i] = (long)(ts[0].charAt(i - 1) - '0');
            }

            root = build(1, n);

            while (m -- > 0) {
                ts = cin.readLine().split(" ");
                int ll = Integer.parseInt(ts[1]);
                int rr = Integer.parseInt(ts[2]);

                if (ts[0].equals("0")) {
                    update(root, 1, n, ll, rr);
                } else if (ts[0].equals("1")) {
                    cout.println(query(root, 1, n, ll, rr));
                    cout.flush();
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

??? success "空间稍微大点都不行"

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
        
        int n, m;
        String s;
        int[] tr;
        boolean[] tg;

        public int lc(int p) { return p << 1; }
        public int rc(int p) { return p << 1 | 1; }

        public void pushUp(int p, int l, int r) {
            if (l == r) return;

            tr[p] = tr[lc(p)] + tr[rc(p)];
        }

        public void set(int p, int l, int r) {
            tr[p] = (r - l + 1) - tr[p];
        }

        public void pushDown(int p, int l, int r) {
            if (l == r || !tg[p]) return;

            int mid = (l + r) >> 1;

            tg[lc(p)] = tg[lc(p)] ? false : true;
            tg[rc(p)] = tg[rc(p)] ? false : true;

            set(lc(p), l, mid);
            set(rc(p), mid + 1, r);

            tg[p] = false;
            pushUp(p, l, r);
        }

        public void build(int p, int l, int r) {
            if (l == r) {
                tr[p] = (int)(s.charAt(l - 1) - '0');
                return;
            }

            int mid = (l + r) >> 1;

            build(lc(p), l, mid);
            build(rc(p), mid + 1, r);

            pushUp(p, l, r);
        }

        public void update(int p, int l, int r, int ll, int rr) {
            if (ll <= l && r <= rr) {
                set(p, l, r);
                tg[p] = tg[p] ? false : true;
                return;
            }

            pushDown(p, l, r);

            int mid = (l + r) >> 1;

            if (ll <= mid) {
                update(lc(p), l, mid, ll, rr);
            }
            if (rr > mid) {
                update(rc(p), mid + 1, r, ll, rr);
            }

            pushUp(p, l, r);
        }

        public int query(int p, int l, int r, int ll, int rr) {
            if (ll <= l && r <= rr) {
                return tr[p];
            }

            pushDown(p, l, r);

            int mid = (l + r) >> 1;
            int res = 0;

            if (ll <= mid) {
                res += query(lc(p), l, mid, ll, rr);
            }
            if (rr > mid) {
                res += query(rc(p), mid + 1, r, ll, rr);
            }

            return res;
        }
        
        public void solve() throws Exception {
            
            String[] ts = cin.readLine().split(" ");
            n = Integer.parseInt(ts[0]);
            m = Integer.parseInt(ts[1]);
            tr = new int[(n + 1) << 2];
            tg = new boolean[(n + 1) << 2];

            s = cin.readLine();
            build(1, 1, n);

            while (m -- > 0) {
                ts = cin.readLine().split(" ");

                int ll = Integer.parseInt(ts[1]);
                int rr = Integer.parseInt(ts[2]);

                if (ts[0].equals("0")) {
                    update(1, 1, n, ll, rr);
                } else {
                    cout.println(query(1, 1, n, ll, rr));
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