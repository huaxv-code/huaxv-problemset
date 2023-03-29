# fair competing

=== "暴力随机化模拟"

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {

        Random nr = new Random();
        int[] st = new int[4];
        long ct, sm;

        boolean ok() {
            for (int aa : st) {
                if (aa == 2) return true;
            }
            return false;
        }

        void dfs(int p, int id) {
            if (ok()) {
                ct ++; sm += p;
                return;
            }
            if (id == 0) {
                int a = nr.nextInt(3) + 1;
                dfs(p, a);
                return;
            }
            int a = nr.nextInt(2) + 1;
            int on = 0;
            for (int i = 1; i <= 3; i ++) {
                if (id == i) continue;
                on ++;
                if (a == on) {
                    st[i] ++; 
                    dfs(p + 1, i);
                    st[i] --;
                    return;
                }
            }
        }

        public void solve() throws Exception {
            for (int i = 0; i < 100000; i ++) {
                dfs(0, 0);
            }
            cout.printf("%.1f", 1.0 * sm / ct);
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