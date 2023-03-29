# [Jerry is a mouse](https://ac.nowcoder.com/acm/contest/17797/J)

=== "动态规划 + dijkstra 周围辐射思想"

    如果我走一步能走到点 $u$ 那么从点 $u$ 出发再走一步就可以确定那些还未确定最短路径的点。

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {

        int N = 200000;
        int M = 100000;
        long inf = ~(1L << 63);

        long t, n;
        long[] dp = new long[N];
        long[] on = new long[N];
        long[] pp = new long[N];
        int cur;

        java.util.Queue<Integer> qu = new ArrayDeque<>();

        public void solve() throws Exception {

            for (long i = 1L; i <= M / i; i ++) {
                pp[cur ++] = i * i;
            }

            for (int i = 0; i < N; i ++) {
                dp[i] = inf;
            }

            qu.offer(0);
            dp[0] = 0;

            while (qu.size() > 0) {
                int aa = qu.poll();

                for (int i = 0; i < cur; i ++) {
                    if (aa + pp[i] < N && dp[(int)(aa + pp[i])] > dp[aa] + 1) {
                        qu.offer((int)(aa + pp[i]));
                        dp[aa + (int)pp[i]] = dp[aa] + 1;
                    }
                    if (aa - pp[i] > 0 && dp[(int)(aa - pp[i])] > dp[aa] + 1) {
                        qu.offer((int)(aa - pp[i]));
                        dp[aa - (int)pp[i]] = dp[aa] + 1;
                    }
                }
            }

            t = gll();
            while (t -- > 0) {
                n = gll();
                cout.println(dp[(int)n]);
            }
        }

        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            cout.flush();

        }

        public static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
        public static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));
        public static StreamTokenizer next = new StreamTokenizer(cin);

        int gii() throws Exception {
            next.nextToken();
            return (int)next.nval;
        }

        long gll() throws Exception {
            next.nextToken();
            return (long)next.nval;
        }

        double gff() throws Exception {
            next.nextToken();
            return (double)next.nval;
        }
    }
    ```