# [A+B Problem again](https://ac.nowcoder.com/acm/contest/53094/I)

借助最大异或数实现思路来实现 10 位字典树.

??? success "代码参考"

    ```java
    import java.io.* ;
    import java.math.* ;
    import java.util.* ;



    public class Main {

        static BufferedReader cin = 
            new BufferedReader (
                new InputStreamReader (System.in)
            );

        static PrintWriter cout = new PrintWriter (
            new OutputStreamWriter (System.out)
        );
        
        final static int N = 3000000;

        static Scanner next = new Scanner(System.in);

        class Node {
            Node[] ds;
            int ct;
            Node() {
                ct = 0;
                ds = new Node[10];
                for (int i = 0; i < 10; i ++) {
                    ds[i] = null;
                }
            }
        }

        Node rt;

        int gcn(char c) {
            return (int)c - (int)'0';
        }

        void put(String s) {
            Node p = rt;
            for (int i = 0; i < s.length(); i ++) {
                int t = gcn(s.charAt(i));
                if (p.ds[t] == null) p.ds[t] = new Node();
                p = p.ds[t];
                p.ct ++;
            }
        }

        void del(String s) {
            Node p = rt;
            for (int i = 0; i < s.length(); i ++) {
                int t = gcn(s.charAt(i));
                if (p.ds[t] == null) break;
                p.ds[t].ct --;
                p = p.ds[t];
            }
        }

        String get(String s) {
            Node p = rt;
            int pos = 0;
            String rs = new String();

            for (int i = 0; i < s.length(); i ++) {
                int t = gcn(s.charAt(i));
                int k = 9 - t;
                Node ne = null;

                while (k >= 0) {
                    if (p.ds[k] != null && p.ds[k].ct > 0) {
                        ne = p.ds[k]; break;    
                    }
                    k --;
                }

                if (ne == null) {
                    k = 9;
                    while (k >= 0) {
                        if (p.ds[k] != null && p.ds[k].ct > 0) {
                            ne = p.ds[k]; break;
                        }
                        k --;
                    }
                }

                rs = rs + k;
                p = ne;
            }

            return rs;
        }

        String gns(int x) {
            String rs = new String();

            if (x == 0) return "0000000000";

            while (x > 0) {
                rs = rs + x % 10;
                x /= 10;
            }

            String res = new String();

            for (int i = 0; i < 10 - rs.length(); i ++) {
                res += 0;
            }

            for (int i = rs.length() - 1; i >= 0; i --) {
                res += rs.charAt(i);
            }

            return res;
        }

        void add(String a, String b) {
            String res = new String();
            for (int i = 0; i < 10; i ++) {
                res += (gcn(a.charAt(i)) + gcn(b.charAt(i))) % 10;
            }

            if (res.equals("0000000000")) {
                cout.print(0 + " ");
                return;
            }

            int on = 0;
            for (int i = 0; i < 10; i ++) {
                if (res.charAt(i) == '0' && on == 0) continue;
                on = 1;
                cout.print(res.charAt(i));
            }

            cout.print(" ");
        }

        int n;
        int[] as;
        
        public void solve() throws Exception {
            
            String[] ts = cin.readLine().split(" ");

            n = Integer.parseInt(ts[0]);
            as = new int[n + 1];
            rt = new Node();

            ts = cin.readLine().split(" ");

            for (int i = 1; i <= n; i ++) {
                as[i] = Integer.parseInt(ts[i - 1]);
                put(gns(as[i]));
            }

            for (int i = 1; i <= n; i ++) {
                del(gns(as[i]));
                add(gns(as[i]), get(gns(as[i])));
                put(gns(as[i]));
            }
            
            cout.flush();
        }
        
        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            
        }
    }
    ```