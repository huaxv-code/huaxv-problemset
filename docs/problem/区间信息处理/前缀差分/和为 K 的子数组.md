# [和为 K 的子数组](https://leetcode.cn/problems/subarray-sum-equals-k/description/)

??? success "代码参考"

    ```java
    class Solution {
        Map<Long, Long> mp = new HashMap<>();
        long[] as;
        long[] sm;
        int n;
        long res;

        public int subarraySum(int[] nums, int k) {
            n = nums.length;
            as = new long[n + 1];
            sm = new long[n + 1];
            res = 0;

            for (int i = 1; i <= n; i ++) {
                as[i] = (long)nums[i - 1];
                sm[i] = sm[i - 1] + as[i];
            }

            mp.put(0L, 0L);

            for (int i = 1; i <= n; i ++) {
                long x = sm[i] - k;
                long rs = 0;
                if (mp.containsKey(x)) {
                    rs += mp.get(x);
                }
                if (x == 0) rs ++;
                if (mp.containsKey(sm[i])) {
                    long t = mp.get(sm[i]) + 1;
                    mp.put(sm[i], t);
                } else mp.put(sm[i], 1L);

                res += rs;
            }

            return (int) res;
        }
    }
    ```