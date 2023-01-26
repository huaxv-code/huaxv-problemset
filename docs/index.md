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

## **vscode** 的配置文件内容：

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
                "const LL N = (LL)(1e6 + 10);",
                "",
                "",
                "",
                "void solve(void)",
                "{",
                "\t$1",
                "}",
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
                "}"
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
                "const LL N = (LL)(1e6 + 10);",
                "",
                "",
                "",
                "void solve(void)",
                "{",
                "\t$1",
                "}",
                "",
                "int main(void)",
                "{",
                "    solve(); return 0;",
                "}"
            ]
        }
    }
    ```