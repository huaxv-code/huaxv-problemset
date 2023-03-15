# [N 次操作后的最大分数和](https://leetcode.cn/problems/maximize-score-after-n-operations/description/)

??? success "代码参考"

    ```java
    class Solution {
        int[] dp;
        int[][] gij;
        int n, m;

        public int maxScore(int[] nums) {
            m = nums.length;
            n = m / 2;

            dp = new int[1 << m];
            gij = new int[m][m];

            for (int i = 0; i < m; i ++) {
                for (int j = 0; j < m; j ++) {
                    if (i == j) continue;
                    gij[i][j] = gcd(nums[i], nums[j]);
                }
            }

            for (int x = 0; x < (1 << m); x ++){
                for (int i = 0; i < m; i ++) {
                    for (int j = 0; j < m; j ++) {
                        
                        int ct = bitCount(x);
                        if ((ct & 1) > 0) continue;
                        int k = ct / 2; // 看一下已经有了多少对
                        if ((x & (1 << i)) == 0 && (x & (1 << j)) == 0) {
                            dp[x ^ (1 << i) ^ (1 << j)] = Math.max(
                                dp[x ^ (1 << i) ^ (1 << j)], 
                                dp[x] + gij[i][j] * (k + 1)
                            );
                        }
                    }
                }
            }

            return dp[(1 << m) - 1];
        }

        int gcd(int a, int b) {
            if (b == 0) return a;
            return gcd(b, a % b);
        }

        int bitCount(int x) {
            int e1 = 0b01010101010101010101010101010101;
            int e2 = 0b00110011001100110011001100110011;
            int e4 = 0b00001111000011110000111100001111;
            int e8 = 0b00000000111111110000000011111111;
            int e16 = 0b00000000000000001111111111111111;

            x = ((x & (e1 << 1)) >> 1) + (x & e1);
            x = ((x & (e2 << 2)) >> 2) + (x & e2);
            x = ((x & (e4 << 4)) >> 4) + (x & e4);
            x = ((x & (e8 << 8)) >> 8) + (x & e8);
            x = ((x & (e16 << 16)) >> 16) + (x & e16);

            return x;
        }
    }
    ```