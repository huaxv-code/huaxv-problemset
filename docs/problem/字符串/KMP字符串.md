# [KMP字符串](https://www.acwing.com/problem/content/833/)

=== "KMP"

    为了要输出所有可能的匹配项，如果次数匹配字符串已经抵达末尾，那么就得继续跳跃到上一个前缀处。

    若当前已经是开始的节点了，如果还需要继续回溯，这是逻辑上不被允许的，能回溯的前提是前缀和后缀存在！

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {

        int N = 2000000;
        
        String s, c;
        int n, m;

        int[] kmp = new int[N];
        
        public void solve() throws Exception {
            
            m = gii(cin.readLine().split(space)[0]);
            c = "?" + cin.readLine().split(space)[0];
            n = gii(cin.readLine().split(space)[0]);
            s = "?" + cin.readLine().split(space)[0];

            for (int i = 1, j = 2; j <= m;) {
                if (c.charAt(i) == c.charAt(j)) {
                    kmp[j] = i; i ++; j ++;
                } else {
                    if (i == 1) {
                        kmp[j] = 0; j ++; continue;
                    }
                    i = kmp[i - 1] + 1;
                }
            }

            for (int i = 1, j = 1; i <= n;) {
                if (s.charAt(i) == c.charAt(j)) {
                    if (j == m) {
                        cout.print((i - j) + " ");
                        if (j == 1) {
                            i ++; continue;
                        }
                        j = kmp[j - 1] + 1; continue;
                    }
                    i ++; j ++;
                } else {
                    if (j == 1) {
                        i ++; continue;
                    }
                    j = kmp[j - 1] + 1;
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
        public static StreamTokenizer next = new StreamTokenizer(cin);
        public static Scanner sin = new Scanner(System.in);
        
        public static int gii() throws Exception {
            next.nextToken();
            return (int)next.nval;
        }

        public static long gll() throws Exception {
            next.nextToken();
            return (long)next.nval;
        }

        public static double gff() throws Exception {
            next.nextToken();
            return (double)next.nval;
        }

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