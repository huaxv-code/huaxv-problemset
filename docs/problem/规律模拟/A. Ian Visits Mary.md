# [A. Ian Visits Mary](https://codeforc.es/problemset/problem/1816/A)

=== "二分"

    给定一条直线，问这条直线在区间 $[l, r]$ 内是否有整数解？

    假设直线为 $ax + by = c$，先求出 $ax + by = \gcd(a, b)$ 的一组特解，假设为 $(x, y)$，那么通解就可以表示成：$a(k * x + A) + b(k * y + B) = k * \gcd(a, b)$，
    
    化简一下：$a*kx + b*ky + aA + bB = k * \gcd(a, b)$，即 $aA + bB = 0$，
    
    所以：$a * \frac{ab}{\gcd(a, b)} * t + b * \frac{ab}{\gcd(a, b)} * -t = 0$，

    求出：$(A, B) = (\frac{b}{\gcd(a, b)} * t, -\frac{a}{\gcd(a, b)} * t)$

    用二分枚举 $t$，查找在区间 $[l, r]$ 内是否真的存在满足条件的 $t$。

    ```c++
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef __int128_t HH;

    LL gcd(LL a, LL b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }

    vector<LL> get_x(LL left, LL right, LL a,  LL b, LL x = 0, LL y = 0) {
        LL l = 0, r = 10000000000, mid;
        while (l < r) {
            mid = (l + r) >> 1;
            if (mid * a + x >= left) r = mid;
            else l = mid + 1;
        }
        if (r * a + x > right) return {};
        return {r * a + x, r * b + x};
    }

    void solve() {
        
        LL t; scanf ("%lld", &t);

        while (t --) {
            LL a, b; scanf("%lld%lld", &a, &b);
            LL g = gcd(a, b);
            auto t = get_x(1, a - 1, a / g, b / g);
            if (t.size()) {
                printf ("2\n%lld %lld\n%lld %lld\n", a - 1, 1, a, b);
            }
            else printf ("1\n%lld %lld\n", a, b);
        }
        
    }

    int main() {

        solve();

        return 0;
    }
    ```