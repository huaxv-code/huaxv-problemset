# [C.Cube](https://codeforces.com/gym/103055/problem/C)

=== "规律模拟"

    给定 $8$ 个点，问你这 $8$ 个点能否构成一个正方体。

    求出所有点对之间的直线长度，如果最小的边有 $12$ 条，第二小的边有 $12$ 条，最大的边只有 $4$ 条，那么就可以构成一个正方体。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    LL q;

    LL e[10][3];

    vector<LL> get_line(LL a, LL b) {
        vector<LL> res;
        for (LL i = 0; i < 3; i ++) {
            res.push_back(e[a][i] - e[b][i]);
        }
        return res;
    }

    LL get_dis(LL a, LL b) {
        auto tmp = get_line(a, b);
        LL res = 0;
        for (auto x : tmp) res += x * x;
        return res;
    }

    map<LL, LL> mp;

    bool ok() {
        for (LL i = 1; i <= 8; i ++) {
            for (LL j = i + 1; j <= 8; j ++) {
                mp[get_dis(i, j)] ++;
            }
        }
        vector<LL> res;
        for (auto x : mp) {
            res.push_back(x.first);
        }

        if (res.size() != 3) return false;
        if (mp[res[0]] != 12) return false;
        if (mp[res[1]] != 12) return false;
        if (mp[res[2]] != 4) return false;
        if (res[0] * 2 != res[1] && res[0] * 3 != res[2]) return false;

        return true;
    }

    void solve() {
        
        cin >> q;
        while (q --) {
            mp.clear();

            for (LL i = 1; i <= 8; i ++) {
                cin >> e[i][0] >> e[i][1] >> e[i][2];
            }

            if (ok()) cout << "YES" << endl;
            else cout << "NO" << endl;
        }
        
    }

    int main() {

        solve();

        return 0;
    }
    ```