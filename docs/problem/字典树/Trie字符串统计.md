# [Trie字符串统计](https://www.acwing.com/problem/content/837/)

=== "字典树"

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {
        
        int n;

        class Node {
            int cnt;
            int end;
            Node[] sons;
            Node() {
                end = 0; cnt = 0; sons = new Node[26];
            }
        }

        Node rt = new Node();

        void push(Node rt, String s, int pos) {
            if (pos >= s.length()) return;
            int p = (int)s.charAt(pos) - 'a';
            if (rt.sons[p] == null) rt.sons[p] = new Node();
            if (pos == s.length() - 1) rt.sons[p].end ++;
            rt.sons[p].cnt ++;
            push(rt.sons[p], s, pos + 1);
        }

        int get(Node rt, String s, int pos) {
            if (rt == null) return 0;
            int p = (int)s.charAt(pos) - 'a';
            if (rt.sons[p] == null) return 0;
            if (pos == s.length() - 1) {
                return rt.sons[p].end;
            }
            return get(rt.sons[p], s, pos + 1);
        }
        
        public void solve() throws Exception {
            
            String[] ts;

            ts = cin.readLine().split(space);
            n = gii(ts[0]);

            for (int i = 1; i <= n; i ++) {
                ts = cin.readLine().split(space);
                if (ts[0].equals("I")) {
                    push(rt, ts[1], 0);
                } else {
                    cout.println(get(rt, ts[1], 0));
                }
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