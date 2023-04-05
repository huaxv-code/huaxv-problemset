# [Kruskal算法求最小生成树](https://www.acwing.com/problem/content/861/)

=== "kruskal"

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {

        int N = 200000;
        
        int n, m;
        int cur;

        int[] ds = new int[N];
        int[] hg = new int[N];

        int find(int x) {
            if (x == ds[x]) return x;
            ds[x] = find(ds[x]);
            return ds[x];
        }

        void meld(int x, int y) {
            int a = find(x);
            int b = find(y);
            if (a == b) return;
            if (hg[a] <= hg[b]) {
                if (hg[a] == hg[b]) hg[b] ++;
                ds[a] = b;
            } else ds[b] = a;
        }

        boolean query(int x, int y) {
            return find(x) == find(y);
        }
        
        long res;

        java.util.Queue<int[]> qu = new PriorityQueue<>((x, y) -> x[2] - y[2]);
        
        public void solve() throws Exception {
            
            String[] ts = cin.readLine().split(space);

            n = gii(ts[0]); m = gii(ts[1]);

            for (int i = 1; i <= n; i ++) {
                ds[i] = i;
            }

            for (int i = 1; i <= m; i ++) {
                ts = cin.readLine().split(space);
                qu.offer(new int[]{gii(ts[0]), gii(ts[1]), gii(ts[2])});
            }
            
            while (qu.size() > 0) {
                int[] a = qu.poll();
                if (query(a[0], a[1])) continue;
                res += a[2]; meld(a[0], a[1]);
            }

            int a = find(1);
            for (int i = 1; i <= n; i ++) {
                if (find(i) != a) {
                    cout.println("impossible");     return;
                }
            }

            cout.println(res);
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