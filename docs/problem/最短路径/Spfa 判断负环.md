# [Spfa 判断负环]()

=== "Spfa 判断负环"

    Spfa 判断负环，检索所有的连通分量，Spfa 是可以求出从某个点为起点到达当前点所在的连通分量内任意点的最短路径，借助这个性质可以获取当前点所在点的连通分量点集。

    遍历每一个连通分量，判断是否含有负环，如果有负环，那么环内的点的最短路径的更新会大于 $n$ 次。

    ```java
    import java.util.* ;
    import java.math.* ;
    import java.io.* ;

    public class Main {
        
        int N = 1000000;
        int inf = 1000000000;
        
        int n, m;
        
        int[] g = new int[N];
        int[] e = new int[N];
        int[] ne = new int[N];
        int[] d = new int[N];
        
        int[] on = new int[N];
        int[] ct = new int[N];
        int[] dd = new int[N];
        
        int[] cm = new int[N];
        
        int cur;
        
        java.util.Queue<Integer> qu;
        
        void add(int a, int b, int c) {
            e[cur] = b;
            d[cur] = c;
            ne[cur] = g[a];
            g[a] = cur; 
            cur ++;
        }
        
        public void solve() throws Exception {
            
            n = nextInt();
            m = nextInt();
            
            for (int i = 0; i < N; i ++) {
                g[i] = -1; e[i] = -1; ne[i] = -1;
                dd[i] = inf;
            }
            
            for (int i = 1; i <= m; i ++) {
                int a = nextInt();
                int b = nextInt();
                int c = nextInt();
                
                add(a, b, c);
            }
            
            
            for (int p = 1; p <= n; p ++) {
                
                if (cm[p] > 0) continue;
                cm[p] = 1;
                
                qu = new ArrayDeque<>();
                
                qu.offer(p);
                ct[p] ++;
                on[p] = 1;
                dd[p] = 0;
                
                while (qu.size() > 0) {
                    int aa = qu.poll();
                    on[aa] = 0;
                    cm[aa] = 1;
                    
                    for (int i = g[aa]; i > -1; i = ne[i]) {
                        if (dd[aa] + d[i] < dd[e[i]]) {
                            dd[e[i]] = dd[aa] + d[i];
                            
                            if (on[e[i]] == 0) {
                                on[e[i]] = 1;
                                ct[e[i]] ++;
                                if (ct[e[i]] > n) {
                                    cout.println("Yes");
                                    return;
                                }
                                qu.offer(e[i]);
                            }
                        }
                    }
                }
            }
            
    //		if (dd[n] == inf) cout.println("impossible");
    //		else cout.println(dd[n]);
            
            cout.println("No");
            
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
    ```