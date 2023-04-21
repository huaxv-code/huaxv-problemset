# [L. String Freshman](https://codeforces.com/gym/103055/problem/L)

=== "KMP"

    如果在匹配串中存在前缀子串，使得该子串排除掉最后一个元素后有最大相同前后缀，且该前缀的后一个字符与该子串的最后一个字符不同时，就说明可以构造出一个字符串使得程序错误的。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    const LL N = 200000;

    LL n;
    char s[N];
    LL ne[N];

    void solve() {
        
        scanf ("%lld", &n);
        scanf ("%s", s);

        LL i = -1, j = 0;
        ne[0] = -1;
        while (j < n) {
            if (i == -1 || s[i] == s[j]) {
                i ++; j ++;
                ne[j] = i;
            }
            else {
                i = ne[i];
            }
        }

        // for (LL i = 0; i <= n; i ++) {
        //     printf ("%lld ", ne[i]);
        // }
        // puts("");

        if (ne[n]) {
            printf ("Wrong Answer\n");
            return;
        }

        for (LL i = n; i > 1; i --) {
            if (ne[i - 1] && s[ne[i - 1]] != s[i - 1]) {
                // cout << i << endl;
                // cout << s[ne[i - 1]] << " " << s[i - 1] << endl;
                printf ("Wrong Answer\n");
                return;
            }
        }

        printf ("Correct\n");
        
    }

    int main() {

        solve();

        return 0;
    }
    ```