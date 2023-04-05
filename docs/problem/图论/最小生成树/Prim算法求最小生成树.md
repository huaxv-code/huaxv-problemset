# [Prim算法求最小生成树](https://www.acwing.com/problem/content/860/)

=== "prim"

    ```java
    import java.util.* ;
    import java.math.* ;
    import java.io.* ;

    public class Main {

        int N = 1000000;

        int n, m;
        int[] ps = new int[N];

        java.util.Queue<int[]> qu = new PriorityQueue<>((x, y) -> {
            return x[2] - y[2];
        });

        int[] g = new int[N];
        int[] e = new int[N];
        int[] ne = new int[N];
        int[] d = new int[N];
        int cur;

        int res;

        void add(int a, int b, int c) {
            e[cur] = b; d[cur] = c; ne[cur] = g[a]; g[a] = cur;
            cur ++;
        }


        public void solve() throws Exception {

            n = nextInt();
            m = nextInt();

            for (int i = 0; i < N; i ++) {
                g[i] = -1; e[i] = -1; ne[i] = -1;
            }

            for (int i = 1; i <= m; i ++) {
                int a = nextInt();
                int b = nextInt();
                int c = nextInt();

                add(a, b, c); add(b, a, c);
            }

            ps[1] = 1;

            for (int i = g[1]; i > -1; i = ne[i]) {
                qu.offer(new int[] {1, e[i], d[i]});
            }

            while (qu.size() > 0) {
                int[] aa = qu.poll();

                if (ps[aa[1]] > 0) continue;

                ps[aa[1]] = 1;
                res += aa[2];

                for (int i = g[aa[1]]; i > -1; i = ne[i]) {
                    qu.offer(new int[] {aa[1], e[i], d[i]});
                }
            }

            for (int i = 1; i <= n; i ++) {
                if (ps[i] == 0) {
                    cout.println("impossible");
                    return;
                }
            }

            cout.println(res);

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

    作者：这个仇我记下了
    链接：https://www.acwing.com/activity/content/code/content/6189461/
    来源：AcWing
    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
    ```