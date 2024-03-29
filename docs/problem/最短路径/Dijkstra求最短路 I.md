# [Dijkstra求最短路 I](https://www.acwing.com/problem/content/851/)

=== "bellman-ford"

    时间复杂度：$O(nm)$

    ```java
    import java.util.* ;
    import java.math.* ;
    import java.io.* ;

    public class Main {
        
        int N = 1000000;
        long inf = 10000000000L;
        
        long[] g, e, ne, d;
        long[] dp;
        int cur;
        
        int n, m;
        
        void add(long a, long b, long c) {
            e[cur] = b;
            d[cur] = c;
            ne[cur] = g[(int)a];
            g[(int)a] = cur;
            cur ++;
        }
        
        public void solve() throws Exception {
            
            n = nextInt();
            m = nextInt();
            
            g = new long[N];
            e = new long[N];
            ne = new long[N];
            d = new long[N];
            dp = new long[N];
            
            for (int i = 0; i < N; i ++) {
                g[i] = -1; e[i] = -1; ne[i] = -1; dp[i] = inf;
            }
            
            for (int i = 0; i < m; i ++) {
                long a = nextLong();
                long b = nextLong();
                long c = nextLong();
                
                add(a, b, c);
            }
            
            for (int i = (int)g[1]; i > -1; i = (int)ne[i]) {
                dp[(int)e[i]] = Math.min(dp[(int)e[i]], d[i]);
            }
            
            for (int i = 2; i <= n; i ++) {
                for (int j = 1; j <= n; j ++) {
                    for (int k = (int)g[j]; k > -1; k = (int)ne[k]) {
                        dp[(int)e[k]] = Math.min(dp[(int)e[k]], dp[j] + d[k]);
                        // 为什么可以用一维数组代替二维数组？
                        // 这样做对执行顺序有什么要求吗？
                        // 		使用滚动数组代替二维数组，因为我们只需要使用前面的第 k - 1 项来推导后面的第 k 项
                        //
                        //		对执行顺序没有要求，因为我们必须要执行 n 遍，如果 dp[j] 因为之前的操作而变得更小了，
                        //		这样会更有利于寻找最小值的.
                    }
                }
            }
            
            if (dp[n] != inf) cout.println(dp[n]);
            else cout.println(-1);
            
        }
        
        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            cout.flush();
            
        }
        
        static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
        static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));
        static StreamTokenizer next = new StreamTokenizer(cin);
        
        int nextInt() throws Exception {
            next.nextToken();
            return (int)next.nval;
        }
        
        long nextLong() throws Exception {
            next.nextToken();
            return (long)next.nval;
        }
        
        double nextDouble() throws Exception {
            next.nextToken();
            return (double)next.nval;
        }
    }
    ```

=== "Spfa"

    在 bellman-ford 中优化掉最短路径没有更新的点

    ```java
    import java.util.* ;
    import java.math.* ;
    import java.io.* ;

    public class Main {
        
        int N = 1000000;
        long inf = 10000000000L;
        
        long[] g, e, ne, d;
        long[] ct;
        long[] dd;
        long[] on;
        int cur;
        
        java.util.Queue<Integer> qu;
        
        int n, m;
        
        void add(long a, long b, long c) {
            e[cur] = b;
            d[cur] = c;
            ne[cur] = g[(int)a];
            g[(int)a] = cur;
            cur ++;
        }
        
        public void solve() throws Exception {
            
            n = nextInt();
            m = nextInt();
            
            g = new long[N];
            e = new long[N];
            ne = new long[N];
            d = new long[N];
            dd = new long[N];
            ct = new long[N];
            on = new long[N];
            
            for (int i = 0; i < N; i ++) {
                g[i] = -1; e[i] = -1; ne[i] = -1; dd[i] = inf;
            }
            
            for (int i = 0; i < m; i ++) {
                long a = nextLong();
                long b = nextLong();
                long c = nextLong();
                
                add(a, b, c);
            }
            
            qu = new ArrayDeque<>();
            // qu = new PriorityQueue<>();
            
            qu.offer(1);
            dd[1] = 0;
            on[1] = 1;
            ct[1] ++;
            
            while (qu.size() > 0) {
                int aa = qu.poll();
                on[aa] = 0;
                for (int i = (int)g[aa]; i > -1; i = (int)ne[i]) {
                    if (dd[aa] + d[i] < dd[(int)e[i]]) {
                        dd[(int)e[i]] = dd[aa] + d[i];
                        if (on[(int)e[i]] == 0) {
                            on[(int)e[i]] = 1;
                            ct[(int)e[i]] ++;
                            if (ct[(int)e[i]] > n) return;
                            qu.offer((int)e[i]);
                        }
                    }
                }
            }
            
            if (dd[n] != inf) cout.println(dd[n]);
            else cout.println(-1);
            
        }
        
        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            cout.flush();
            
        }
        
        static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
        static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));
        static StreamTokenizer next = new StreamTokenizer(cin);
        
        int nextInt() throws Exception {
            next.nextToken();
            return (int)next.nval;
        }
        
        long nextLong() throws Exception {
            next.nextToken();
            return (long)next.nval;
        }
        
        double nextDouble() throws Exception {
            next.nextToken();
            return (double)next.nval;
        }
    }
    ```

=== "Dijkstra"

    ```java
    import java.util.* ;
    import java.math.* ;
    import java.io.* ;

    public class Main {
        
        int N = 1000000;
        long inf = 10000000000L;
        
        long[] g, e, ne, d, dd;
        int cur;
        long[] on;
        
        class Node {
            int a; long b;
            Node(int x, long y) {
                a = x; b = y;
            }
        }
        
        java.util.Queue<Node> qu;
        
        int n, m;
        
        void add(long a, long b, long c) {
            e[cur] = b;
            d[cur] = c;
            ne[cur] = g[(int)a];
            g[(int)a] = cur;
            cur ++;
        }
        
        public void solve() throws Exception {
            
            n = nextInt();
            m = nextInt();
            
            g = new long[N];
            e = new long[N];
            ne = new long[N];
            d = new long[N];
            dd = new long[N];
            on = new long[N];
            
            for (int i = 0; i < N; i ++) {
                g[i] = -1; e[i] = -1; ne[i] = -1; dd[i] = inf;
            }
            
            for (int i = 0; i < m; i ++) {
                long a = nextLong();
                long b = nextLong();
                long c = nextLong();
                
                add(a, b, c);
            }
            
            qu = new PriorityQueue<>((x, y) -> {
                if (x.b < y.b) return -1;
                if (x.b > y.b) return 1;
                return 0;
            });
            
            qu.offer(new Node(1, 0));
            
            while (qu.size() > 0) {
                Node aa = qu.poll();
                
                if (on[aa.a] > 0) continue;
                on[aa.a] = 1;
                dd[aa.a] = aa.b;
                
                for (int i = (int)g[aa.a]; i > -1; i = (int)ne[i]) {
                    qu.offer(new Node((int)e[i], aa.b + d[i]));
                }
            }
            
            if (dd[n] == inf) cout.println(-1);
            else cout.println(dd[n]);
            
        }
        
        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            cout.flush();
            
        }
        
        static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
        static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));
        static StreamTokenizer next = new StreamTokenizer(cin);
        
        int nextInt() throws Exception {
            next.nextToken();
            return (int)next.nval;
        }
        
        long nextLong() throws Exception {
            next.nextToken();
            return (long)next.nval;
        }
        
        double nextDouble() throws Exception {
            next.nextToken();
            return (double)next.nval;
        }
    }
    ```