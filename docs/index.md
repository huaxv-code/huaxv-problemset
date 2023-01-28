# 简介

我的名字叫 **北白川玉子**，我不仅喜欢 *糕饼类小吃*，还喜欢在空余时间 *刷题*，建立这个仓库就是方便存放我刷的题目进去。

或许我刷的题目过于简单，但是{==请不要笑话我==}，相反，你应该{==教教我==}，看在我那么 **可爱** 的份上。

<img src="./img/北白川玉子.jpg" alt="北白川玉子" style="display:block;margin:0 auto;">

---

## **vscode** 刷题时的默认代码片段：

??? note "代码片段"

    ```c++ title="c++ 代码片段"
    #include <iostream>
    #include <fstream>

    using namespace std;
    typedef long long LL;
    const LL N = (LL)(1e6 + 10);



    void solve(void)
    {
        
    }

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
    ```

---

## **vscode** 配置文件内容：

??? note "settings.json"

    ```json title="settings.json"
    {
        "workbench.colorTheme": "Visual Studio Dark - C++",
        "workbench.startupEditor": "none",
        "editor.fontSize": 20, // 字体大小
        "files.autoSave": "afterDelay", // 自动保存
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
            "cpp": "cd $dir && g++ $fileName -o $fileNameWithoutExt && start cmd /c $dir$fileNameWithoutExt",
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
        // gcc 的位置
        "C_Cpp.default.compilerPath": "C:/huaxv-home/CP-Editor/mingw64/bin/gcc",
        "C_Cpp.default.cppStandard": "c++20",
        "C_Cpp.default.cStandard": "c17"
    }
    ```

## **vscode** 配置用户代码片段

??? note "cpp.json"

    ```json title="cpp.json"
    {
        "file": {
            "prefix": "file",
            "body": [
                "#include <iostream>",
                "#include <fstream>",
                "",
                "using namespace std;",
                "typedef long long LL;",
                "typedef long double DD;",
                "typedef __int128_t HH;",
                "inline HH ghh();",
                "inline void phh(HH x);",
                "inline LL gll();",
                "const LL N = (LL)(1e6 + 10);",
                "",
                "/*────────────────────────────────────────────────────────────────────*/",
                "",
                "$1",
                "",
                "void solve(void)",
                "{",
                "\t",
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
                "inline void phh(HH x)",
                "{",
                "    if (x < 0) { putchar('-'); x *= -1; }",
                "    if (x == 0) { putchar('0'); return; }",
                "    if (x / 10) phh(x / 10);",
                "    putchar((x % 10) + '0');",
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
            ],
            "description": "init file"
        },
        "code": {
            "prefix": "code",
            "description": "init file",
            "body": [
                "#include <iostream>",
                "",
                "using namespace std;",
                "typedef long long LL;",
                "typedef long double DD;",
                "typedef __int128_t HH;",
                "inline HH ghh();",
                "inline void phh(HH x);",
                "inline LL gll();",
                "const LL N = (LL)(1e6 + 10);",
                "",
                "/*────────────────────────────────────────────────────────────────────*/",
                "",
                "$1",
                "",
                "void solve(void)",
                "{",
                "\t",
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
                "inline void phh(HH x)",
                "{",
                "    if (x < 0) { putchar('-'); x *= -1; }",
                "    if (x == 0) { putchar('0'); return; }",
                "    if (x / 10) phh(x / 10);",
                "    putchar((x % 10) + '0');",
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
            ]
        }
    }
    ```

## 祝君万事顺意

```
.--,       .--,
 ( (  \.---./  ) )
  '.__/o   o\__.'
     {=  ^  =}
      >  -  <
     /       \
    //       \\
   //|   .   |\\
   "'\       /'"_.-~^`'-.
      \  _  /--'         `
    ___)( )(___
   (((__) (__)))    高山仰止,景行行止.虽不能至,心向往之。


/*
 * ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐
 * │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐
 * └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘
 * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐
 * │~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │
 * ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤
 * │ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │
 * ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │
 * │ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" '│ Enter  │               │ 4 │ 5 │ 6 │   │
 * ├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤
 * │ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │
 * ├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││
 * │ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│
 * └─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘
 */
```