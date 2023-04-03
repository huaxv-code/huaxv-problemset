# [n-皇后问题](https://www.acwing.com/problem/content/845/)

=== "暴力 dfs"

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {
        
        int n;

        int[] a = new int[1000];
        int[] b = new int[1000];
        int[] c = new int[1000];

        int[] g = new int[1000];

        int gta(int x, int y) {
            return (x + y);
        }

        int gtb(int x, int y) {
            return (x + n - y + 1);
        }

        boolean ok(int x, int y) {
            if (a[gta(x, y)] == 0 && b[gtb(x, y)] == 0 && c[y] == 0) return true;
            return false;
        }

        void dfs(int pos) {
            if (pos > n) {
                for (int i = 1; i <= n; i ++) {
                    for (int j = 1; j <= n; j ++) {
                        if (j == g[i]) {
                            cout.print("Q");
                        } else cout.print(".");
                    }
                    cout.println();
                }
                cout.println();
                return;
            }

            for (int i = 1; i <= n; i ++) {
                if (ok(pos, i)) {
                    g[pos] = i;
                    c[i] = 1;
                    a[gta(pos, i)] = 1;
                    b[gtb(pos, i)] = 1;
                    dfs(pos + 1);
                    a[gta(pos, i)] = 0;
                    b[gtb(pos, i)] = 0;
                    c[i] = 0;
                }
            }
        }
        
        public void solve() throws Exception {
            
            n = gii(cin.readLine().split(space)[0]);

            dfs(1);
            
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