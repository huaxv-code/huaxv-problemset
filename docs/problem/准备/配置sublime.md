# 配置sublime

## 编译选项

??? info "g++.sublime-build"

    *sublime\Data\Packages\User\g++.sublime-build*

    ```json
    {
        "cmd": ["cmd", "/c", "g++", "-Wall", "${file}","-std=c++17", "-fexec-charset=gbk", "-o", "${file_path}/${file_base_name}", "&&", "cmd", "/c", "${file_path}/${file_base_name}"],
        "file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$",
        "working_dir": "${file_path}",
        "selector": "source.c, source.c++",

        "variants":
        [
            {
                "name": "run in sublime",
                "cmd": ["cmd", "/c", "g++", "-Wall", "${file}","-std=c++17", "-fexec-charset=gbk", "-o", "${file_path}/${file_base_name}", "&&", "cmd", "/c", "${file_path}/${file_base_name}"]
            },
            {
                "name": "run in cmd",
                "cmd": ["cmd", "/c", "g++", "-Wall", "${file}","-std=c++17", "-fexec-charset=gbk", "-o", "${file_path}/${file_base_name}", "&&", "start", "cmd", "/c", "${file_path}/${file_base_name} & pause"]
            }
        ]
    }
    ```

## 代码片段

??? info "file.sublime-snippet"

    *sublime\Data\Packages\User\snippet\file.sublime-snippet*

    ``` html
    <snippet>
        <content><![CDATA[
    #include <bits/stdc++.h>

    using namespace std;
    typedef long long LL;
    typedef long double DD;
    typedef __int128_t HH;
    inline HH ghh();
    inline bool phh(HH x, const char *s = "\n");
    inline bool pll(LL x, const char *s = "\n");
    inline LL gll();
    inline HH qpow(HH x, HH y, HH m);
    template <typename T> T min(vector<T> tmp);
    template <typename T> T max(vector<T> tmp);
    const LL lnf = 0x3f3f3f3f3f3f3f3f;
    const int inf = 0x3f3f3f3f;
    const char cnf = 0x3f;
    const LL N = (LL)(5e6 + 10);

    /*────────────────────────────────────────────────────────────────────*/

    ${0}

    void solve(void)
    {
        
    }

    /*────────────────────────────────────────────────────────────────────*/

    int main(void)
    {
        ifstream fi; ofstream fo;
        fi.open("./lrq.in"); fo.open("./lrq.out");
        if (fi.is_open() && fo.is_open())
        {
            fo.close(); fi.close();
            FILE *fin = freopen("./lrq.in", "r", stdin);
            FILE *fout = freopen("./lrq.out", "w", stdout);
            solve(); fclose(fin); fclose(fout);
        }
        else solve();

        return 0;
    }

    inline HH ghh() 
    {   
        char s[200];
        scanf ("%s", s);
        HH x = 0, f = 1;
        for (LL i = 0; s[i]; i ++) 
        {
            if (s[i] == '-') f = -1;
            else if (s[i] >= '0' && s[i] <= '9') x = x * 10 + s[i] - '0';
        }
        return x * f;
    }

    inline bool phh(HH x, const char *s)
    {
        if (x == 0) { putchar('0'); printf (s); return true; }
        if (x < 0) { putchar('-'); x *= -1; }
        char tmp[200];
        LL cr = 0;
        while (x)
        {
            tmp[++ cr] = char ((x % 10) + '0'); x /= 10;
        }
        for (LL i = cr; i; i --) putchar(tmp[i]);
        printf (s);
        return true;
    }

    inline LL gll()
    {
        char s[200];
        scanf ("%s", s);
        LL x = 0, f = 1;
        for (LL i = 0; s[i]; i ++)
        {
            if (s[i] == '-') f = -1;
            else if (s[i] >= '0' && s[i] <= '9') x = x * 10 + s[i] - '0';
        }
        return x * f;
    }

    inline bool pll(LL x, const char *s)
    {
        if (x == 0) { putchar('0'); printf (s); return true; }
        if (x < 0) { putchar('-'); x *= -1; }
        char tmp[200];
        LL cr = 0;
        while (x)
        {
            tmp[++ cr] = char ((x % 10) + '0'); x /= 10;
        }
        for (LL i = cr; i; i --) putchar(tmp[i]);
        printf ("%s", s);
        return true;
    }

    inline HH qpow(HH x, HH y, HH m)
    {
        if (y == 0) return 1;
        HH res = qpow(x, y / 2, m);
        res *= res; res %= m;
        if (y & 1) { res *= x; res %= m; }
        return res;
    }

    template <typename T>
    T min(vector<T> tmp)
    {
        if (!tmp.size()) exit(1);
        sort(tmp.begin(), tmp.end());
        return tmp[0];
    }

    template <typename T>
    T max(vector<T> tmp)
    {
        if (!tmp.size()) exit(1);
        sort(tmp.begin(), tmp.end());
        return tmp.back();
    }
    ]]></content>
        <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
        <!-- <tabTrigger>hello</tabTrigger> -->
        <!-- Optional: Set a scope to limit where the snippet will trigger -->
        <!-- <scope>source.python</scope> -->
        <tabTrigger>file</tabTrigger>
    </snippet>
    ```

## 快捷键

??? info "Default (Windows).sublime-keymap"

    *sublime\Data\Packages\User\Default (Windows).sublime-keymap*

    ``` json
    [
        { "keys": ["ctrl+k", "ctrl+g"], "command": "new_pane", "args": {"move": false} },
        { "keys": ["ctrl+k", "ctrl+shift+g"], "command": "close_pane" },
        { "keys": ["ctrl+shift+b"], "command": "cancel_build" },
        { "keys": ["ctrl+alt+b"], "command": "build", "args": {"select": true} },
    ]
    ```

## 设置

??? info "Preferences.sublime-settings"

    *sublime\Data\Packages\User\Preferences.sublime-settings*

    ``` json
    {
        "ignored_packages":
        [
            "Vintage",
        ],
        "font_size": 15,
        "font_face": "Consolas-with-Yahei",
        "save_on_focus_lost": true,
        "update_check":false,
        "auto_complete": false,
        "theme": "Material-Theme-Darker.sublime-theme",
        "color_scheme": "Packages/Material Theme/schemes/Material-Theme-Darker.tmTheme",
        // "font_options": ["gdi"],
        // "dpi_scale": 1.0
    }
    ```