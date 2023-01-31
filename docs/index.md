# 简介

我的名字叫 **北白川玉子**，我不仅喜欢 *糕饼类小吃*，还喜欢在空余时间 *刷题*，建立这个仓库就是方便存放我刷的题目进去。

或许我刷的题目过于简单，但是{==请不要笑话我==}，相反，你应该{==教教我==}，看在我那么 **可爱** 的份上。

<img src="./img/北白川玉子.jpg" alt="北白川玉子" style="display:block;margin:0 auto;">

---

## **vscode** 刷题时的默认代码片段：

??? note "代码片段"

    ```c++ title="c++ 代码片段"
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
    const LL N = (LL)(2e7 + 10);

    /*────────────────────────────────────────────────────────────────────*/



    void solve(void)
    {
        
    }

    /*────────────────────────────────────────────────────────────────────*/

    int main(void)
    {
        solve(); return 0;
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
        if (x < 0) putchar('-');
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
        if (x < 0) putchar('-');
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
    ```

---

## **vscode** 配置文件内容：

??? note "settings.json"

    ```json title="settings.json"
    {
        "workbench.colorTheme": "Sublime Material Theme - Dark",
        "workbench.startupEditor": "none",
        "editor.fontSize": 20, // 自动保存
        "explorer.compactFolders": false, 
        "security.workspace.trust.untrustedFiles": "open",
        "workbench.iconTheme": "material-icon-theme",
        "explorer.confirmDelete": false,
        "git.autofetch": true,
        "files.exclude": {
            "*.exe": true// 隐藏 .exe 文件
        },
        "explorer.confirmDragAndDrop": false,
        "code-runner.executorMap": {
            "javascript": "node",
            "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
            "c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && start cmd /k $dir$fileNameWithoutExt",
            "cpp": "cd $dir && g++ $fileName -o $fileNameWithoutExt && start cmd /k $dir$fileNameWithoutExt",
            "objective-c": "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            "php": "php",
            "python": "python -u",
            "perl": "perl",
            "perl6": "perl6",
            "ruby": "ruby",
            "go": "go run",
            "lua": "lua",
            "groovy": "groovy",
            "powershell": "powershell -ExecutionPolicy ByPass -File",
            "bat": "cmd /c",
            "shellscript": "bash",
            "fsharp": "fsi",
            "csharp": "scriptcs",
            "vbscript": "cscript //Nologo",
            "typescript": "ts-node",
            "coffeescript": "coffee",
            "scala": "scala",
            "swift": "swift",
            "julia": "julia",
            "crystal": "crystal",
            "ocaml": "ocaml",
            "r": "Rscript",
            "applescript": "osascript",
            "clojure": "lein exec",
            "haxe": "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt",
            "rust": "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
            "racket": "racket",
            "scheme": "csi -script",
            "ahk": "autohotkey",
            "autoit": "autoit3",
            "dart": "dart",
            "pascal": "cd $dir && fpc $fileName && $dir$fileNameWithoutExt",
            "d": "cd $dir && dmd $fileName && $dir$fileNameWithoutExt",
            "haskell": "runhaskell",
            "nim": "nim compile --verbosity:0 --hints:off --run",
            "lisp": "sbcl --script",
            "kit": "kitc --run",
            "v": "v run",
            "sass": "sass --style expanded",
            "scss": "scss --style expanded",
            "less": "cd $dir && lessc $fileName $fileNameWithoutExt.css",
            "FortranFreeForm": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            "fortran-modern": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            "fortran_fixed-form": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            "fortran": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            "sml": "cd $dir && sml $fileName"
        },
        "C_Cpp.default.intelliSenseMode": "gcc-x64",
        "C_Cpp.default.compilerPath": "C:/huaxv-home/Tools/Sublime/mingw64/bin/gcc",
        "C_Cpp.default.cppStandard": "c++20",
        "C_Cpp.default.cStandard": "c17",
        "editor.unicodeHighlight.allowedLocales": {
            "ja": true,
            "zh-hant": true
        },
        "files.autoSave": "onFocusChange",
        "editor.stickyScroll.enabled": true
    }
    ```

## **vscode** 配置用户代码片段

??? note "cpp.json"

    ```json title="cpp.json"
    {
        "file": {
            "prefix": "file",
            "body": [
                "#include <bits/stdc++.h>",
                "",
                "using namespace std;",
                "typedef long long LL;",
                "typedef long double DD;",
                "typedef __int128_t HH;",
                "inline HH ghh();",
                "inline void phh(HH x, const char *s = \"\\n\");",
                "inline void pll(LL x, const char *s = \"\\n\");",
                "inline LL gll();",
                "const LL N = (LL)(1e6 + 10);",
                "",
                "/*────────────────────────────────────────────────────────────────────*/",
                "",
                "",
                "",
                "void solve(void)",
                "{",
                "    ",
                "}",
                "",
                "/*────────────────────────────────────────────────────────────────────*/",
                "",
                "int main(void)",
                "{",
                "    ifstream fi; ofstream fo;",
                "    fi.open(\"./lrq.in\"); fo.open(\"./lrq.out\");",
                "    if (fi.is_open() && fo.is_open())",
                "    {",
                "        fo.close(); fi.close();",
                "        FILE *fin = freopen(\"./lrq.in\", \"r\", stdin);",
                "        FILE *fout = freopen(\"./lrq.out\", \"w\", stdout);",
                "        solve(); fclose(fin); fclose(fout);",
                "    }",
                "    else solve();",
                "",
                "    return 0;",
                "}",
                "",
                "inline HH ghh() ",
                "{   ",
                "    char s[200];",
                "    scanf (\"%s\", s);",
                "    HH x = 0, f = 1;",
                "    for (LL i = 0; s[i]; i ++) ",
                "    {",
                "        if (s[i] == '-') f = -1;",
                "        else if (s[i] >= '0' && s[i] <= '9') x = x * 10 + s[i] - '0';",
                "    }",
                "    return x * f;",
                "}",
                "",
                "inline void phh(HH x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (s); return; }",
                "    if (x < 0) putchar('-');",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (s);",
                "}",
                "",
                "inline LL gll()",
                "{",
                "    char s[200];",
                "    scanf (\"%s\", s);",
                "    LL x = 0, f = 1;",
                "    for (LL i = 0; s[i]; i ++)",
                "    {",
                "        if (s[i] == '-') f = -1;",
                "        else if (s[i] >= '0' && s[i] <= '9') x = x * 10 + s[i] - '0';",
                "    }",
                "    return x * f;",
                "}",
                "",
                "inline void pll(LL x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (s); return; }",
                "    if (x < 0) putchar('-');",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (s);",
                "}",
            ],
            "description": "init file"
        },
        "code": {
            "prefix": "code",
            "description": "init file",
            "body": [
                "#include <bits/stdc++.h>",
                "",
                "using namespace std;",
                "typedef long long LL;",
                "typedef long double DD;",
                "typedef __int128_t HH;",
                "inline HH ghh();",
                "inline void phh(HH x, const char *s = \"\\n\");",
                "inline void pll(LL x, const char *s = \"\\n\");",
                "inline LL gll();",
                "const LL N = (LL)(1e6 + 10);",
                "",
                "/*────────────────────────────────────────────────────────────────────*/",
                "",
                "",
                "",
                "void solve(void)",
                "{",
                "    ",
                "}",
                "",
                "/*────────────────────────────────────────────────────────────────────*/",
                "",
                "int main(void)",
                "{",
                "    solve(); return 0;",
                "}",
                "",
                "inline HH ghh() ",
                "{   ",
                "    char s[200];",
                "    scanf (\"%s\", s);",
                "    HH x = 0, f = 1;",
                "    for (LL i = 0; s[i]; i ++) ",
                "    {",
                "        if (s[i] == '-') f = -1;",
                "        else if (s[i] >= '0' && s[i] <= '9') x = x * 10 + s[i] - '0';",
                "    }",
                "    return x * f;",
                "}",
                "",
                "inline void phh(HH x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (s); return; }",
                "    if (x < 0) putchar('-');",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (s);",
                "}",
                "",
                "inline LL gll()",
                "{",
                "    char s[200];",
                "    scanf (\"%s\", s);",
                "    LL x = 0, f = 1;",
                "    for (LL i = 0; s[i]; i ++)",
                "    {",
                "        if (s[i] == '-') f = -1;",
                "        else if (s[i] >= '0' && s[i] <= '9') x = x * 10 + s[i] - '0';",
                "    }",
                "    return x * f;",
                "}",
                "",
                "inline void pll(LL x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (s); return; }",
                "    if (x < 0) putchar('-');",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (s);",
                "}",
            ]
        }
    }
    ```

## **sublime** 用户代码片段

??? note "Sublime\sublime\Data\Packages\User\snippet\code.sublime-snippet"

    ```html title"Sublime\sublime\Data\Packages\User\snippet\code.sublime-snippet"
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
    const LL N = (LL)(2e7 + 10);

    /*────────────────────────────────────────────────────────────────────*/

    ${0}

    void solve(void)
    {
        
    }

    /*────────────────────────────────────────────────────────────────────*/

    int main(void)
    {
        solve(); return 0;
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
        if (x < 0) putchar('-');
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
        if (x < 0) putchar('-');
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
    ]]></content>
        <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
        <!-- <tabTrigger>hello</tabTrigger> -->
        <!-- Optional: Set a scope to limit where the snippet will trigger -->
        <!-- <scope>source.python</scope> -->
        <tabTrigger>code</tabTrigger>
    </snippet>
    ```

## **sublime** g++ 配置

??? note "Sublime\sublime\Data\Packages\User\g++.sublime-build"

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

## **sublime** 配置文件

??? note "Sublime\sublime\Data\Packages\User\Preferences.sublime-settings"

    ```json
    {
        "ignored_packages":
        [
            "Vintage",
        ],
        "font_size": 15,
        "save_on_focus_lost": true,
        "update_check":false,
        "auto_complete": false,
        "theme": "Material-Theme-Darker.sublime-theme",
        "color_scheme": "Packages/Material Theme/schemes/Material-Theme-Darker.tmTheme",
    }

    ```

## 祝君万事顺意

```c++
/*
 *  .--,       .--,
 *   ( (  \.---./  ) )
 *    '.__/o   o\__.'
 *       {=  ^  =}
 *        >  -  <
 *       /       \
 *      //       \\
 *     //|   .   |\\
 *     "'\       /'"_.-~^`'-.
 *        \  _  /--'         `
 *      ___)( )(___
 *     (((__) (__)))    高山仰止,景行行止.虽不能至,心向往之。
 */
```