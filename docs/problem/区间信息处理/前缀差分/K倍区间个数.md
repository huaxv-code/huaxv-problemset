# K 倍区间个数

??? question "[问题描述](https://www.acwing.com/problem/content/1232/)"

    给定一个具有 $n$ 个整数的数组 $a[n]$，请你找出该数组中存在多少个连续子区间的和是 $k$ 的倍数.

    **数据范围**

    $1 \leq n, k, a[i] \leq 10 ^ 5$

## 前缀和 + 取模

如果存在一个连续子区间 $[l, r]$ 使得 $sum[l, r]$ 的和是 $k$ 的倍数，那么 $sum[l, r] \bmod k = 0$

利用前缀和数组 $sum[l, r] = sum[r] - sum[l - 1]$ 所以：

> $sum[l, r] \bmod k = sum[r] \bmod k - sum[l - 1] \bmod k$
>
> 即 $sum[r] \bmod k = sum[l - 1] \bmod k$

对于每一个 $r$ 寻找 $1 \sim r - 1$ 中存在多少个 $l$ 使得 $sum[r] = sum[l] (\bmod k)$ 成立，累加这些结果就是答案.

??? success "参考代码"

    === "C++"

        ```c++
        LL n, k, rs;
        LL a[N], b[N];
        LL mp[N];

        void solve(void)
        {
            n = gll(), k = gll();
            for (LL i = 1; i <= n; i ++)
            {
                a[i] = gll(); b[i] += b[i - 1] + a[i];
                b[i] %= k;
            }

            mp[0] = 1;
            for (LL i = 1; i <= n; i ++)
            {
                rs += mp[b[i]] ++;
            }

            pll(rs);
        }
        ```

    === "java"

        ```java
        import java.io.* ;
        import java.math.* ;
        import java.util.* ;



        public class Main {
            final static int N = 3000000;
            
            long n, m;
            long[] as = new long[N], sm = new long[N];

            Map<Long, Long> mp = new HashMap<>();

            long res;
            
            public void solve() throws Exception {
                
                n = nextLong();
                m = nextLong();

                for (int i = 1; i <= (int)n; i ++) {
                    as[i] = nextLong();
                    sm[i] = sm[i - 1] + as[i];
                    sm[i] %= m;

                    Long tn = mp.get(sm[i]);

                    if (tn == null) tn = 0L;

                    res += tn;
                    mp.put(sm[i], tn + 1);

                    if (sm[i] == 0) res ++;
                }

                cout.println(res);
                
                cout.flush();
            }

        
        /*

        · · · · · · · · · ·   .--,       .--,   · · · · · · · · · ·
        · · · · · · · · · ·  ( (  \.---./  ) )  · · · · · · · · · ·
        · · · · · · · · · ·   '.__/o   o\__.'   · · · · · · · · · ·
        · · · · · · · · · ·      {=  ^  =}      · · · · · · · · · ·
        · · · · · · · · · ·       >  -  <       · · · · · · · · · ·
        · · · · · · · · · ·      /       \      · · · · · · · · · ·
        · · · · · · · · · ·     //       \\     · · · · · · · · · ·
        · · · · · · · · · ·    //|   .   |\\    · · · · · · · · · ·
        · · · · · · · · · ·    "'\       /'"_.-~^`'-.   · · · · · ·
        · · · · · · · · · ·       \  _  /--'         `  · · · · · ·
        · · · · · · · · · ·     ___)( )(___     · · · · · · · · · ·
        · · · · · · · · · ·    (((__) (__)))    · · · · · · · · · ·  

        · · · · · · · 高山仰止,景行行止.虽不能至,心向往之。· · · · · ·  

        */


            public static void main(String[] args) throws Exception {
                
                Main cmd = new Main();
                cmd.solve();
                
                cout.flush();
                
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
                input.nextToken();
                return (int)input.nval;
            }

            long nextLong() throws Exception {
                input.nextToken();
                return (long)input.nval;
            }

            double nextDouble() throws Exception {
                input.nextToken();
                return (double)input.nval;
            }

            double nextFloat() throws Exception {
                input.nextToken();
                return (float)input.nval;
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

            public static long qpow(long a, long b, long mod) {
                if (b == 1) return a % mod;
                if (a == 1) return a;

                long res = qpow(a, b >> 1, mod);

                res = res * res % mod;

                if ((b & 1) > 0) res = res * a % mod;

                return res;
            }

            public static long gcd(long a, long b) {
                if (b == 0) return a;
                return gcd(b, a % b);
            }

            public static long qmul(long a, long b, long mod) {
                long p = 1;
                long res = 0;

                while (b > 0) {
                    if ((b & 1) > 0) {
                        res += a * p % mod;
                        res %= mod;
                    }
                    p <<= 1;
                    b >>= 1;
                }

                return res;
            }

            public static long qdiv(long a, long b, long mod) {
                return qmul(a, qpow(b, mod - 2, mod), mod);
            }
        }
        ```