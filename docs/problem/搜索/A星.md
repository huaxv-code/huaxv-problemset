# [A星算法]()

=== "A星算法"

    ```c++
    #include <bits/stdc++.h>

    #define KEYS 7

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

    int h(const string& s) {
        int res = 0;
        for (int i = 0; i < n; i ++) {
            int x_ = i / m, y_ = i % m;
            int x = cps[s[i]] / m, y = cps[s[i]] % m;
            res += abs(x - x_) + abs(y - y_);
        }
        return res * KEYS;
    }

    // // h 函数，放大距离的影响
    // int h(const string& s) {
    // 	int res = 0;
    // 	for (int i = 0; i < n; i ++) {
    // 		int x_ = i / m, y_ = i % m;
    // 		int x = cps[s[i]] / m, y = cps[s[i]] % m;
    // 		res += (x - x_) * (x - x_) + (y - y_) * ((y - y_));
    // 	}
    // 	return res;
    // }

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
        bool operator<(const Node& b) const {
            return (g + h(s) - b.g - h(b.s)) > 0;
        }

        bool operator>(const Node& b) const {
            return (g + h(s) - b.g - h(b.s)) < 0;
        }
    };

    vector<Node> get_nexts(Node* a) {
        vector<Node> res;
        int p = 0;
        while (a->s[p] != ic[0]) p ++;
        string t;
        if (p - m >= 0) {
            t = string(a->s);
            swap(t[p - m], t[p]);
            res.push_back(Node(a->g + 1, t));
        }
        if (p + m < n) {
            t = string(a->s);
            swap(t[p + m], t[p]);
            res.push_back(Node(a->g + 1, t));
        }
        if (p % m != 0) {
            t = string(a->s);
            swap(t[p - 1], t[p]);
            res.push_back(Node(a->g + 1, t));
        }
        if (p % m != m - 1) {
            t = string(a->s);
            swap(t[p + 1], t[p]);
            res.push_back(Node(a->g + 1, t));
        }
        return res;
    }

    unordered_set<string> hs;
    priority_queue<Node> qu;

    void solve() {

        rule();
        
        string s = "";
        for (int i = 0; i < m; i ++) {
            for (int j = 0; j < m; j ++) {
                int t = gii();
                s += ic[t];
            }
        }

        // cout << (Node(0, s) < Node(0, s)) << endl;

        Node a(0, s);
        qu.push(a);

        while (qu.size()) {
            Node a = qu.top();
            qu.pop();
            
            if (hs.find(a.s) != hs.end()) continue;

            hs.insert(a.s);

            if (ok(a.s)) {
                show(a.s, a.g); return;
            }

            auto nds = get_nexts(&a);

            for (auto nd : nds) {
                if (hs.find(nd.s) != hs.end()) continue;
                qu.push(nd);
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