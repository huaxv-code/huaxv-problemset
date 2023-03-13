# 简介

我的名字叫 **北白川玉子**，我不仅喜欢 *糕饼类小吃*，还喜欢在空余时间 *刷题*，建立这个仓库就是方便存放我刷的题目进去。

或许我刷的题目过于简单，但是{==请不要笑话我==}，相反，你应该{==教教我==}，看在我那么 **可爱** 的份上。

<img src="./img/北白川玉子.jpg" alt="北白川玉子" style="display:block;margin:0 auto;">

---

## **vscode** 刷 **java** 的代码片段

??? note "Java"

    ```java
    import java.io.* ;
    import java.math.* ;
    import java.util.* ;



    public class Main {
        final static int N = 3000000;
        
        
        
        public void solve() throws Exception {
            
            
            
            cout.flush();
        }
        
        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            
        }

        static BufferedReader cin = 
        new BufferedReader (
            new InputStreamReader (System.in)
        );

        static PrintWriter cout = new PrintWriter (
            new OutputStreamWriter (System.out)
        );
        
        static Scanner next = new Scanner(System.in);

        int nextInt() throws Exception {
            int x = 0, f = 1;
            char c = (char)cin.read();
            while (c > '9' || c < '0') {
                if (c == '-') f = -1;
                c = (char)cin.read();
            }
            while (c <= '9' && c >= '0') {
                x = x * 10 + (int)c - (int)'0';
                c = (char)cin.read();
            }
            return x * f;
        }

        long nextLong() throws Exception {
            long x = 0, f = 1;
            char c = (char)cin.read();
            while (c > '9' || c < '0') {
                if (c == '-') f = -1L;
                c = (char)cin.read();
            }
            while (c <= '9' && c >= '0') {
                x = x * 10 + (long)c - (long)'0';
                c = (char)cin.read();
            }
            return x * f;
        }

        double nextDouble() throws Exception {
            double x = 0, f = 1;
            char c = (char)cin.read();
            while (c > '9' || c < '0') {
                if (c == '-') f = -1.0;
                c = (char)cin.read();
            }
            long h = 0;
            while (c <= '9' && c >= '0') {
                h = h * 10 + (long)c - (long)'0';
                c = (char)cin.read();
            }
            double p = 0.1, e = 0;
            if (c == '.') {
                c = (char)cin.read();
                while (c <= '9' && c >= '0') {
                    e += p * ((double)c - (double)'0');
                    p *= 0.1;
                    c = (char)cin.read();
                }
            }
            return ((double)h + e) * f;
        }
    }
    ```

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
    template <typename T> T min(vector<T> tmp);
    template <typename T> T max(vector<T> tmp);
    const LL lnf = 0x3f3f3f3f3f3f3f3f;
    const int inf = 0x3f3f3f3f;
    const char cnf = 0x3f;
    const LL N = (LL)(5e6 + 10);

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
    ```

---

## **vscode** 配置文件内容：

??? note "settings.json"

    ```json title="settings.json"
    {
        "workbench.startupEditor": "none",
        "editor.fontSize": 18, // 自动保存
        "explorer.compactFolders": false,
        "security.workspace.trust.untrustedFiles": "open",
        "explorer.confirmDelete": false,
        "git.autofetch": true,
        "files.exclude": {
            "*.exe": true // 隐藏 .exe 文件
        },
        // code-runner:
        // $workspaceRoot: The path of the folder opened in VS Code
        // $dir: The directory of the code file being run
        // $dirWithoutTrailingSlash: The directory of the code file being run without a trailing slash
        // $fullFileName: The full name of the code file being run
        // $fileName: The base name of the code file being run, that is the file without the directory
        // $fileNameWithoutExt: The base name of the code file being run without its extension
        // $driveLetter: The drive letter of the code file being run (Windows only)
        // $pythonPath: The path of Python interpreter (set by Python: Select Interpreter command)
        "explorer.confirmDragAndDrop": false,
        "code-runner.executorMapByGlob": {
            "*.md": "cd $workspaceRoot && push $fileName",
            "mkdocs.yml": "cd $workspaceRoot && push $fileName"
        },
        // C:\Program Files\Java\jdk1.6.0_45
        // C:\Huaxv-Home\Tools\Jdk-19\jdk-19.0.2
        "code-runner.executorMap": {
            "javascript": "node",
            // "java": "fsutil file setCaseSensitiveInfo $workspaceRoot  disable && cd $dir && javac $fileName && java $fileNameWithoutExt",
            // "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
            // "java": "cd $dir && javac -encoding utf8 $fileName && java $fileName < task_cin_cout_files\\in.txt > task_cin_cout_files\\out.txt",
            // "java": "cd $dir && javac -encoding utf8 $fileName && java $fileName",
            "java": "cd $workspaceRoot && create_files && cd $dir && copy-item $fileName $workspaceRoot\\.task_cin_cout_files\\Main.java && cd $workspaceRoot\\.task_cin_cout_files && javac -encoding utf8 Main.java && Get-Content in.txt  | java Main | Out-File -Filepath out.txt",
            // "c": "cls && cd $dir && gcc $fileName -o $fileNameWithoutExt && start cmd.exe \"/c runcode $dir$fileNameWithoutExt\"",
            // "cpp": "cls && cd $dir && g++ -std=c++20 $fileName -o $fileNameWithoutExt && start cmd.exe \"/c runcode $dir$fileNameWithoutExt\"",
            "c": "cd $workspaceRoot && create_files && cd $dir && copy-item $fileName $workspaceRoot\\.task_cin_cout_files\\a.c && cd $workspaceRoot\\.task_cin_cout_files && gcc -std=c17 a.c -o a && Get-Content in.txt  | .\\a | Out-File -Filepath out.txt",
            "cpp": "cd $workspaceRoot && create_files && cd $dir && copy-item $fileName $workspaceRoot\\.task_cin_cout_files\\a.cpp && cd $workspaceRoot\\.task_cin_cout_files && g++ -std=c++20 -static a.cpp -o a -O3 -Wall -Wextra \"-Wl,--stack=536870912\" && Get-Content in.txt  | .\\a | Out-File -Filepath out.txt",
            "objective-c": "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            "php": "php",
            // "python": "python -u",
            "python": "cd $workspaceRoot && create_files && cd $dir && copy-item $fileName $workspaceRoot\\.task_cin_cout_files\\a.py && cd $workspaceRoot\\.task_cin_cout_files && Get-Content in.txt  | python -u a.py | Out-File -Filepath out.txt",
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
        "C_Cpp.default.compilerPath": "C:\\Huaxv-Home\\Tools\\Mingw64\\mingw64\\bin\\gcc",
        "C_Cpp.default.cppStandard": "c++20",
        "C_Cpp.default.cStandard": "c17",
        "editor.unicodeHighlight.allowedLocales": {
            "ja": true,
            "zh-hant": true
        },
        "files.autoSave": "onFocusChange",
        "editor.stickyScroll.enabled": true,
        "code-runner.runInTerminal": true,
        "editor.linkedEditing": true,
        "terminal.integrated.defaultProfile.windows": "PowerShell",
        "[python]": {
            "editor.formatOnType": true
        },
        "java.errors.incompleteClasspath.severity": "ignore",
        "java.configuration.maven.notCoveredPluginExecutionSeverity": "ignore",
        "leetcode.endpoint": "leetcode-cn",
        "leetcode.workspaceFolder": "C:\\Users\\huaxv\\Desktop\\Code\\LC",
        "leetcode.showLocked": true,
        "leetcode.defaultLanguage": "java",
        "leetcode.hint.configWebviewMarkdown": false,
        "leetcode.hint.commentDescription": false,
        "json.schemaDownload.enable": false,
        
        //background 的相关配置
        "update.enableWindowsBackgroundUpdates": false,
        "workbench.iconTheme": "eq-material-theme-icons-light",
        "extensions.ignoreRecommendations": true,
        // "background.customImages": [
        //     "file:///C:/Huaxv-Home/Image/vscbgc.png"//图片地址
        // ],
        // "background.style": {
        //     "content":"''",
        //     "pointer-events":"none",
        //     "position":"fixed",//图片位置居中
        //     "width":"100%",
        //     "height":"100%",
        //     "z-index":"99999",
        //     "top":"0px",
        //     "left":"0px",
        //     "background.repeat":"no-repeat",
        //     "background-size":"cover",//图片大小为全屏
        //     "opacity":0.2 //透明度
        // },
        // "background.useFront": true,
        // "background.useDefault": false,
        "workbench.colorTheme": "onehalf-light",
        "C_Cpp.errorSquiggles": "disabled",
        "java.compile.nullAnalysis.mode": "disabled",
        "vsintellicode.java.completionsEnabled": false,
        "maven.dependency.enableConflictDiagnostics": false //是否使用默认图片
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
                "inline bool phh(HH x, const char *s = \"\\n\");",
                "inline bool pll(LL x, const char *s = \"\\n\");",
                "inline LL gll();",
                "inline HH qpow(HH x, HH y, HH m);",
                "const LL N = (LL)(5e6 + 10);",
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
                "inline bool phh(HH x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (\"%s\", s); return true; }",
                "    if (x < 0) { putchar('-'); x *= -1; }",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (\"%s\", s);",
                "    return true;",
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
                "inline bool pll(LL x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (s); return true; }",
                "    if (x < 0) { putchar('-'); x *= -1; }",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (\"%s\", s);",
                "    return true;",
                "}",
                "",
                "inline HH qpow(HH x, HH y, HH m)",
                "{",
                "    if (y == 0) return 1;",
                "    HH res = qpow(x, y / 2, m);",
                "    res *= res; res %= m;",
                "    if (y & 1) { res *= x; res %= m; }",
                "    return res;",
                "}"
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
                "inline bool phh(HH x, const char *s = \"\\n\");",
                "inline bool pll(LL x, const char *s = \"\\n\");",
                "inline LL gll();",
                "inline HH qpow(HH x, HH y, HH m);",
                "const LL N = (LL)(5e6 + 10);",
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
                "inline bool phh(HH x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (\"%s\", s); return true; }",
                "    if (x < 0) { putchar('-'); x *= -1; }",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (\"%s\", s);",
                "    return true;",
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
                "inline bool pll(LL x, const char *s)",
                "{",
                "    if (x == 0) { putchar('0'); printf (s); return true; }",
                "    if (x < 0) { putchar('-'); x *= -1; }",
                "    char tmp[200];",
                "    LL cr = 0;",
                "    while (x)",
                "    {",
                "        tmp[++ cr] = char ((x % 10) + '0'); x /= 10;",
                "    }",
                "    for (LL i = cr; i; i --) putchar(tmp[i]);",
                "    printf (\"%s\", s);",
                "    return true;",
                "}",
                "",
                "inline HH qpow(HH x, HH y, HH m)",
                "{",
                "    if (y == 0) return 1;",
                "    HH res = qpow(x, y / 2, m);",
                "    res *= res; res %= m;",
                "    if (y & 1) { res *= x; res %= m; }",
                "    return res;",
                "}"
            ]
        }
    }
    ```

## **sublime** 用户代码片段

??? note "Sublime\sublime\Data\Packages\User\snippet\code.sublime-snippet"

    ```html title="Sublime\sublime\Data\Packages\User\snippet\code.sublime-snippet"
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