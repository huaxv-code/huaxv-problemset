# [F - LCS](https://atcoder.jp/contests/dp/tasks/dp_f)

记录它爹，输出最长公共子序列

??? success "代码参考"

    ```java
    import java.io.* ;
    import java.math.* ;
    import java.util.* ;



    public class Main {
        final static int N = 3000000;
        
        String a, b;

        int[][] dp = new int[3010][3010];
        int[][][] ne = new int[3010][3010][2];
        char[][] e = new char[3010][3010];
        int n, m;
        
        public void solve() throws Exception {
            
            a = cin.readLine();
            b = cin.readLine();

            n = a.length();
            m = b.length();

            a = "?" + a;
            b = "?" + b;

            for (int i = 1; i <= n; i ++) {
                for (int j = 1; j <= m; j ++) {
                    if ((int)a.charAt(i) == (int)b.charAt(j)) {
                        dp[i][j] = dp[i - 1][j - 1] + 1;
                        ne[i][j][0] = i - 1;
                        ne[i][j][1] = j - 1;
                        e[i][j] = a.charAt(i);
                    } else {
                        if (dp[i - 1][j] > dp[i][j - 1]) {
                            dp[i][j] = dp[i - 1][j];
                            ne[i][j][0] = ne[i - 1][j][0];
                            ne[i][j][1] = ne[i - 1][j][1];
                            e[i][j] = e[i - 1][j];
                        } else {
                            dp[i][j] = dp[i][j - 1];
                            ne[i][j][0] = ne[i][j - 1][0];
                            ne[i][j][1] = ne[i][j - 1][1];
                            e[i][j] = e[i][j - 1];
                        }
                    }
                }
            }

            // cout.println(ne[n][m][0] + " " + ne[n][m][1]);

            // for (int i = 1; i <= n; i ++) {
            // 	for (int j = 1; j <= m; j ++) {
            // 		cout.print(e[i][j] + " ");
            // 	}
            // 	cout.println();
            // }

            int x = n, y = m;

            String res = new String();

            while (x > 0 && y > 0) {
                if ((int)e[x][y] > 0) res += e[x][y];
                // cout.print(x + " " + y + " [::] ");
                int i = x, j = y;
                x = ne[i][j][0];
                y = ne[i][j][1];
                // cout.println(x + " " + y);
            }

            if (res.length() > 0) {
                for (int i = res.length() - 1; i >= 0; i --) {
                    cout.print(res.charAt(i));
                }
            } 
            cout.println();
            
            cout.flush();
        }
        
        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            
        }

        static BufferedReader cin = 
        new BufferedReader (
            new InputStreamReader (System.in)
        );

        static PrintWriter cout = new PrintWriter (
            new OutputStreamWriter (System.out)
        );
        
        static StreamTokenizer input = new StreamTokenizer(
            new BufferedReader(
                new InputStreamReader(System.in)
            )
        );
        
        static Scanner next = new Scanner(System.in);

        int nextInt() throws Exception {
            int x = 0, f = 1;
            char c = (char)cin.read();
            while (c > '9' || c < '0') {
                if (c == '-') f = -1;
                c = (char)cin.read();
            }
            while (c <= '9' && c >= '0') {
                x = x * 10 + (int)c - (int)'0';
                c = (char)cin.read();
            }
            return x * f;
        }

        long nextLong() throws Exception {
            long x = 0, f = 1;
            char c = (char)cin.read();
            while (c > '9' || c < '0') {
                if (c == '-') f = -1L;
                c = (char)cin.read();
            }
            while (c <= '9' && c >= '0') {
                x = x * 10 + (long)c - (long)'0';
                c = (char)cin.read();
            }
            return x * f;
        }

        double nextDouble() throws Exception {
            double x = 0, f = 1;
            char c = (char)cin.read();
            while (c > '9' || c < '0') {
                if (c == '-') f = -1.0;
                c = (char)cin.read();
            }
            long h = 0;
            while (c <= '9' && c >= '0') {
                h = h * 10 + (long)c - (long)'0';
                c = (char)cin.read();
            }
            double p = 0.1, e = 0;
            if (c == '.') {
                c = (char)cin.read();
                while (c <= '9' && c >= '0') {
                    e += p * ((double)c - (double)'0');
                    p *= 0.1;
                    c = (char)cin.read();
                }
            }
            return ((double)h + e) * f;
        }

        static int sed = (int)System.currentTimeMillis();

        public static void seed(int x) { sed = x; }

        public static int _01_() {
            sed ^= sed << 13;
            sed ^= sed >> 17;
            sed ^= sed << 5;
            return (sed & 1) == 1 ? 1 : 0;
        }

        public static boolean nextBoolean() {
            return _01_() == 1;
        }

        public static int nextInt(int n) {
            if (n <= 1) return n;

            int x = n;
            if ((x & 1) == 1) x ++;

            int k = nextInt(x >> 1);

            int res = 2 * k - 1;
            if (_01_() == 1) res ++;

            if (res > n) return nextInt(n);
            return res;
        }

        public static long nextLong(long n) {
            if (n <= 1) return n;

            long x = n;
            if ((x & 1) == 1) x ++;

            long k = nextLong(x >> 1);

            long res = 2 * k - 1;
            if (_01_() == 1) res ++;

            if (res > n) return nextLong(n);
            return res;
        }

        // 获取 1 ~ n 中随机的 m 个
        public static int[] nextInts(int n, int m) {
            int[] as, rs;
            as = new int[n];
            rs = new int[m];

            for (int i = 0; i < n; i ++) {
                as[i] = i + 1;
            }

            for (int i = 0; i < m; i ++) {
                int t = nextInt(m - i);
                rs[i] = as[m - 1 - t + 1];
                int tp = as[m - 1 - t + 1];
                as[m - 1 - t + 1] = as[i];
                as[i] = tp;
            }

            return rs;
        }
    }
    ```