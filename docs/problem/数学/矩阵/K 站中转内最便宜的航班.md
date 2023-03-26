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