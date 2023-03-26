# [K 站中转内最便宜的航班](https://leetcode.cn/problems/cheapest-flights-within-k-stops/description/)

=== "矩阵乘法"

    时间复杂度：$O(n ^ 4)$

    ```java
    class Solution {
        long[][] g, aa;
        int n;

        long inf = 1L << 31;

        long[][] mmul(long[][] a, long[][] b, int n) {
            long[][] res = new long[n][n]; 

            for (int i = 0; i < n; i ++) {
                for (int j = 0; j < n; j ++) {
                    res[i][j] = inf;
                }
            }

            for (int i = 0; i < n; i ++) {
                for (int j = 0; j < n; j ++) {
                    for (int k = 0; k < n; k ++) {
                        res[i][j] = Math.min(res[i][j], a[i][k] + b[k][j]);
                    }
                }
            }

            return res;
        }

        public int findCheapestPrice(int ns, int[][] flights, int src, int dst, int k) {
            n = ns;

            g = new long[n][n];
            aa = new long[n][n];

            for (int i = 0; i < n; i ++) {
                for (int j = 0; j < n; j ++) {
                    g[i][j] = aa[i][j] = inf;
                }
            }

            for (int i = 0; i < flights.length; i ++) {
                g[flights[i][0]][flights[i][1]] = flights[i][2];
                aa[flights[i][0]][flights[i][1]] = g[flights[i][0]][flights[i][1]];
            }

            long res = inf;

            res = Math.min(res, aa[src][dst]);

            for (int i = 1; i <= k; i ++) {
                aa = mmul(aa, g, n);
                res = Math.min(res, aa[src][dst]);
            }

            if (res != inf) return (int)res;
            else return -1;
        }
    }
    ```

=== "动态规划"

    先求出从起点 src 开始，走了 $k$ 步后到达点 pos 的最短路径，那么如果要走第 $k + 1$ 步，就可以从点走了 $k$ 步的最短路径出发再走一步到达下一些点，并不断保留最小值.

    时间复杂度：$O(n ^ 2)$

    ```java
    class Solution {

        int[][] dp;
        int n;
        int inf = 1000000000;

        public int findCheapestPrice(int ns, int[][] flights, int src, int dst, int k) {
            n = ns;

            dp = new int[n + 1][n + 1];

            for (int i = 0; i <= n; i ++) {
                for (int j = 0; j <= n; j ++) {
                    dp[i][j] = inf;
                }
            }

            for (int i = 0; i < flights.length; i ++) {
                int st = flights[i][0];
                int ed = flights[i][1];
                int dd = flights[i][2];

                if (st == src) {
                    dp[1][ed] = dd;
                }
            }

            for (int i = 2; i <= k + 1; i ++) {
                for (int j = 0; j < flights.length; j ++) {
                    int st = flights[j][0];
                    int ed = flights[j][1];
                    int dd = flights[j][2];

                    dp[i][ed] = Math.min(dp[i][ed], dp[i - 1][st] + dd);
                }
            }

            int res = inf;

            for (int i = 1; i <= k + 1; i ++) {
                res = Math.min(res, dp[i][dst]);
            }

            if (res >= inf) res = -1;
            return res;
        }
    }
    ```