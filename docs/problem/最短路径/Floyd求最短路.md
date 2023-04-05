# [Floyd求最短路](https://www.acwing.com/problem/content/856/)

=== "Floyd"

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {

        int inf = 1000000000;
        
        int n, m, k;
        int[][] dd = new int[500][500];
        
        void floyd(int[][] g) {
            for (int k = 1; k <= n; k ++) {
                for (int i = 1; i <= n; i ++) {
                    for (int j = 1; j <= n; j ++) {
                        if (g[i][k] == inf || g[k][j] == inf) continue;
                        if (g[i][j] > g[i][k] + g[k][j]) {
                            g[i][j] = g[i][k] + g[k][j];
                        }
                    }
                }
            }
        }
        
        public void solve() throws Exception {
            
            String[] ts = cin.readLine().split(space);

            n = gii(ts[0]); m = gii(ts[1]); k = gii(ts[2]);

            for (int i = 1; i <= n; i ++) {
                for (int j = 1; j <= n; j ++) {
                    if (i != j) dd[i][j] = inf;
                    else dd[i][j] = 0;
                }
            }

            for (int i = 1; i <= m; i ++) {
                ts = cin.readLine().split(space);
                int a, b, c;
                a = gii(ts[0]); b = gii(ts[1]); c = gii(ts[2]);
                dd[a][b] = Math.min(dd[a][b], c);
            }

            floyd(dd);

            for (int i = 1; i <= k; i ++) {
                ts = cin.readLine().split(space);
                int x = gii(ts[0]);
                int y = gii(ts[1]);

                if (dd[x][y] == inf) cout.println("impossible");
                else  cout.println(dd[x][y]);
            }
            
        }

        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            cout.flush();
            
        }

        public static String space = "\\s+"; 

        public static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
        public static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));

        public static int gii(String s) {
            return Integer.parseInt(s);
        }

        public static long gll(String s) {
            return Long.parseLong(s);
        }

        public static double gff(String s) {
            return Double.parseDouble(s);
        }
    }
    ```