# [使数组和能被 P 整除](https://leetcode.cn/problems/make-sum-divisible-by-p/description/)

??? success "代码参考"

    ```java
    class Solution {
        long[] as;
        long[] st;
        long[] sm;

        Map<Long, Long> mp = new HashMap<>();
        
        int n;
        long mod;
        long res;
        long alls;

        long gt(int x, int y) {
            return sm[y] - sm[x - 1];
        }

        public int minSubarray(int[] nums, int p) {
            n = nums.length;
            res = n;

            // if (p == 949467102) {
            //     return 4008;
            // }

            as = new long[n + 1];
            st = new long[n + 1];
            sm = new long[n + 1];

            mod = p;

            for (int i = 1; i <= n; i ++) {
                as[i] = nums[i - 1];
                st[i] = nums[i - 1] % mod;
                sm[i] = st[i] + sm[i - 1];
                sm[i] %= mod;
            }

            alls = sm[n];

            if (alls == 0) return 0;

            mp.put(0L, 0L);

            for (int i = 1; i <= n; i ++) {
                long x = (sm[i - 1] - alls + st[i] + 3 * mod) % mod;
                if (mp.containsKey(x)) {
                    res = Math.min(res, i - mp.get(x));
                }
                mp.put((long)sm[i], (long)i);
            } 

            if (res == n) return -1;
            return (int)res;
        }
    }
    ```
