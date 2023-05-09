# [丑数 II](https://leetcode.cn/problems/ugly-number-ii/description/)

=== "优先队列模拟"

    ```c++
    class Solution {
    public:
        #define LL long long
        vector<LL> dp;

        int nthUglyNumber(int n) {

            auto cmp = [&](const LL& x, const LL& y)
            {
                return x > y;
            };

            priority_queue<LL, vector<LL>, decltype(cmp)> qu(cmp);
            qu.push(1);

            for (;dp.size() < n;)
            {
                LL t = qu.top(); qu.pop();
                auto it = lower_bound(dp.begin(), dp.end(), t);
                if (it == dp.end() || *it != t)
                {
                    dp.push_back(t);
                    qu.push(t * 2);
                    qu.push(t * 3);
                    qu.push(t * 5);
                }
            }

            for (auto x : dp) cout << x << " "; cout << endl;

            return (int)dp.back();


        }
    };
    ```