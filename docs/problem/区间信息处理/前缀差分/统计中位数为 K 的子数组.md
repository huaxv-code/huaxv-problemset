# [统计中位数为 K 的子数组](https://leetcode.cn/problems/count-subarrays-with-median-k/description/)

关键点：该数组不含重复元素.

对于第 $i$ 个位置，我们要记录前缀和数组 $smi[i]$ 表示 $1 \sim i$ 区间内小于 $k$ 的数据个数.

对于前缀和数组 $smx[i]$ 表示 $1 \sim i$ 区间内大于 $k$ 的数据个数.

如果对于当前位置 $p$ 来说，$1 \sim p$ 中包含了 $k$，那么我们查找一下 $1 \sim p$ 中，比 $k$ 小的数据个数记为 $a$，比 $k$ 大的数据个数记为 $b$，

令 $k$ 的下标为 $x$，那么 $x \leq p$ 一定成立，

寻找区间 $0 < x$ 内 $smx[i] - smi[i] = b - a$ 的前缀和有多少个，如果有 $tp$ 个，那么能让 $k$ 成为中位数的奇数长度子数组就有 $tp$ 个，

如果区间 $0 < x$ 内，能让 $smx[i] - smi[i] = b - 1 - a$ 满足的前缀和区间有 $tp$ 个，那么能人 $k$ 成为中位数的偶数长度子数组就有 $tp$ 个.

??? success "代码参考"

    ```java
    class Solution {
        final static int N = 100010;
        int[] smi = new int[N], smx = new int[N];
        Map<Integer, Integer> mp = new HashMap<>();
        int n, res = 0;
        int pk = 0;

        public int countSubarrays(int[] nums, int k) {
            n = nums.length;

            for (int i = 1; i <= n; i ++) {
                smi[i] = smi[i - 1];
                smx[i] = smx[i - 1];
                if (nums[i - 1] > k) smx[i] ++;
                else if (nums[i - 1] < k) smi[i] ++;
                if (nums[i - 1] == k) pk = i;
            }

            // mp.put(0, 1); 可选

            for (int i = 1; i <= n; i ++) {
                int a = smi[i];
                int b = smx[i];

                if (a + b == i) {
                    Integer tp = mp.get(b - a);
                    if (tp == null) tp = 1;
                    else tp += 1;
                    mp.put(b - a, tp);
                    continue;
                }

                int dd = b - a;
                Integer tp = mp.get(dd);
                if (tp == null) tp = 1;
                else {
                    res += tp ++;
                }
                if (i < pk) mp.put(dd, tp);
                Integer td = mp.get(dd - 1);
                if (td != null) res += td;

                if (dd == 0) res ++; // 可选
                if (dd == 1) res ++; // 可选
                // 两种写法
            }

            return res;
        }
    }
    ```