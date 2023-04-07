# [IDA 星算法]()

=== "IDDFS"

    限制深度的 dfs 搜索，如果在最大深度 $max$ 内未能找到终点，那么最大深度 $max + 1$，然后继续从头开始遍历限制深度的 dfs。

    时间的开销最多只会比暴力 $bfs$ 多 $x$ 倍，$x$ 是树的分支数。

    用 IDDFS 解决 16 数码问题，先预测走到终点至少还需要多少步，并且还要放大哈曼顿距离的影响:

    ```c++
    #include <bits/stdc++.h>

    #define KEYS 10

    using namespace std;
    typedef long long LL;
    typedef long double FF;
    int gii(); LL gll(); FF gff();
    const int N = 1000000;

    string target = "abcdefghijklmnop";

    unordered_map<int, char> ic;
    unordered_map<char, int> ci;
    unordered_map<char, int> cps;

    vector<string> rts;
    vector<int> rtn;

    int n = 16;
    int m = 4;

    void rule() {
        vector<int> tp = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0};

        for (int i = 0; i < n; i ++) {
            ic[tp[i]] = char('a' + i);
            ci[char('a' + i)] = tp[i];
            cps[char('a' + i)] = i;
        }
    }

    // int h(const string& s) {
    // 	int res = 0;
    // 	for (int i = 0; i < n; i ++) {
    // 		int x_ = i / m, y_ = i % m;
    // 		int x = cps[s[i]] / m, y = cps[s[i]] % m;
    // 		res += sqrt((x - x_) * (x - x_) + (y - y_) * (y - y_));
    // 	}
    // 	return res;
    // }

    // int h(const string& s) {
    // 	int res = n;
    // 	for (int i = 0; i < n; i ++) {
    // 		if (s[i] == target[i]) res --;
    // 	}
    // 	return res;
    // }

    // int h(const string& s) {
    // 	int res = 0;
    // 	for (int i = 0; i < n; i ++) {
    // 		int x_ = i / m, y_ = i % m;
    // 		int x = cps[s[i]] / m, y = cps[s[i]] % m;
    // 		res += abs(x - x_) + abs(y - y_);
    // 	}
    // 	return res * KEYS;
    // }

    // h 函数，放大距离的影响
    int h(const string& s) {
        int res = 0;
        for (int i = 0; i < n; i ++) {
            int x_ = i / m, y_ = i % m;
            int x = cps[s[i]] / m, y = cps[s[i]] % m;
            res += (x - x_) * (x - x_) + (y - y_) * ((y - y_));
        }
        return res;
    }

    // int h(const string& s) {
    // 	int res = 0;
    // 	for (int i = 0; i < n; i ++) {
    // 		res += abs(ci[s[i]] - ci[target[i]]);
    // 	}
    // 	return res;
    // }

    int ok(const string& s) {
        return h(s) == 0;
    }

    void show(const string& s, int d) {
        printf("第 %d 步\n", d);
        for (int i = 0; i < n; i ++) {
            printf("%d ", ci[s[i]]);
            if (i % m == m - 1) {
                puts("");
            }
        }
        puts("");
    }

    struct Node {
        int g;
        string s;
        Node(int x, string y) {
            g = x; s = y;
        }

        // 定义的是不优先
        bool operator<(const Node& b) {
            return (g + h(s) - b.g - h(b.s)) > 0;
        }
    };

    vector<Node*> get_nexts(Node* a) {
        vector<Node*> res;
        int p = 0;
        while (a->s[p] != ic[0]) p ++;
        string t;
        if (p - m >= 0) {
            t = string(a->s);
            swap(t[p - m], t[p]);
            res.push_back(new Node(a->g + 1, t));
        }
        if (p + m < n) {
            t = string(a->s);
            swap(t[p + m], t[p]);
            res.push_back(new Node(a->g + 1, t));
        }
        if (p % m != 0) {
            t = string(a->s);
            swap(t[p - 1], t[p]);
            res.push_back(new Node(a->g + 1, t));
        }
        if (p % m != m - 1) {
            t = string(a->s);
            swap(t[p + 1], t[p]);
            res.push_back(new Node(a->g + 1, t));
        }
        return res;
    }

    int depth = 0;

    unordered_set<string> hs;

    Node* dfs(Node* a, int d) {
        // if (d > depth) return nullptr;
        if (d > depth || d + h(a->s) > depth) return nullptr;
        if (hs.find(a->s) != hs.end()) return nullptr;
        
        hs.insert(a->s);

        // show(a->s, d);

        if (ok(a->s)) {
            rts.push_back(a->s);
            rtn.push_back(d);
            return a;
        }
        auto nds = get_nexts(a);
        for (auto nd : nds) {
            if (hs.find(nd->s) != hs.end()) continue;
            auto tmp = dfs(nd, d + 1);
            if (tmp) {
                rts.push_back(a->s);
                rtn.push_back(d);
                return tmp;
            }
        }
        return nullptr;
    }

    void solve() {

        rule();
        
        string s = "";
        for (int i = 0; i < m; i ++) {
            for (int j = 0; j < m; j ++) {
                int t = gii();
                s += ic[t];
            }
        }
        Node* a = new Node(0, s);
        for (depth = 0; ; depth ++) {
            hs = unordered_set<string>();
            auto t = dfs(a, 0);
            if (t) {
                for (int i = 0; i < (int)rts.size(); i ++) {
                    show(rts[(int)rts.size() - i - 1], rtn[(int)rts.size() - i - 1]);
                }
                return;
            }
        }
    }

    int main() {

        solve();

        return 0;
    }

    int gii() {
        int n; scanf("%d", &n); return n;
    }

    LL gll() {
        LL n; scanf("%lld", &n); return n;
    }

    FF gff() {
        FF n; scanf("%Lf", &n); return n;
    }
    ```