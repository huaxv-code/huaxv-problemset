# 简介

我的名字叫 **北白川玉子**，我不仅喜欢 *糕饼类小吃*，还喜欢在空余时间 *刷题*，建立这个仓库就是方便存放我刷的题目进去。

或许我刷的题目过于简单，但是{==请不要笑话我==}，相反，你应该{==教教我==}，看在我那么 **可爱** 的份上。

<img src="./img/北白川玉子.jpg" alt="北白川玉子" style="display:block;margin:0 auto;">

---

## vscode 配置

=== "settings.json"

    ```json
    {
        "editor.fontSize": 24,
        "terminal.integrated.fontSize": 24,
        "workbench.iconTheme": "material-icon-theme",
        "workbench.colorTheme": "Visual Studio Dark - C++",
        "code-runner.executorMapByFileExtension": {
            ".yml": "push setting",
            ".md": "push $fileName",
            ".vb": "cd $dir && vbc /nologo $fileName && $dir$fileNameWithoutExt",
            ".vbs": "cscript //Nologo",
            ".scala": "scala",
            ".jl": "julia",
            ".cr": "crystal",
            ".ml": "ocaml",
            ".zig": "zig run",
            ".exs": "elixir",
            ".hx": "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt",
            ".rkt": "racket",
            ".scm": "csi -script",
            ".ahk": "autohotkey",
            ".au3": "autoit3",
            ".kt": "cd $dir && kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
            ".kts": "kotlinc -script",
            ".dart": "dart",
            ".pas": "cd $dir && fpc $fileName && $dir$fileNameWithoutExt",
            ".pp": "cd $dir && fpc $fileName && $dir$fileNameWithoutExt",
            ".d": "cd $dir && dmd $fileName && $dir$fileNameWithoutExt",
            ".hs": "runhaskell",
            ".nim": "nim compile --verbosity:0 --hints:off --run",
            ".csproj": "dotnet run --project",
            ".fsproj": "dotnet run --project",
            ".lisp": "sbcl --script",
            ".kit": "kitc --run",
            ".v": "v run",
            ".vsh": "v run",
            ".sass": "sass --style expanded",
            ".cu": "cd $dir && nvcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            ".ring": "ring",
            ".sml": "cd $dir && sml $fileName"
        },
        "code-runner.executorMap": {

            "javascript": "node",

            // "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
            // "c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            // "cpp": "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            // "python": "python -u",

            "java": "running_code.bat $dir java $fileNameWithoutExt",
            "c": "running_code.bat $dir c $fileNameWithoutExt",
            "cpp": "running_code.bat $dir cpp $fileNameWithoutExt",
            "python": "running_code.bat $dir py $fileNameWithoutExt",

            "zig": "zig run",
            "objective-c": "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            "php": "php",
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
            "haskell": "runghc",
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
        "terminal.integrated.defaultProfile.windows": "Command Prompt",
        "code-runner.runInTerminal": true,
        "redhat.telemetry.enabled": true,
        "code-runner.languageIdToFileExtensionMap": {

            "bat": ".bat",
            "powershell": ".ps1",
            "typescript": ".ts"
        },
        "workbench.startupEditor": "none",
    }
    ```

=== "cpp.json"

    ```json
    {
        // Place your snippets for cpp here. Each snippet is defined under a snippet name and has a prefix, body and 
        // description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
        // $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
        // same ids are connected.
        // Example:
        "Print to console": {
            "prefix": "code",
            "body": [
                "#include <bits/stdc++.h>",
                "",
                "typedef long long ll;",
                "using namespace std;",
                "#define endl '\\n'",
                "const ll N = 2000000;",
                "",
                "",
                "",
                "",
                "",
                "void solve()",
                "{",
                "	",
                "	",
                "	",
                "}",
                "",
                "int main()",
                "{",
                "	ios::sync_with_stdio(0);",
                "	cin.tie(0); cout.tie(0);",
                "	",
                "	solve();",
                "	return 0;",
                "}",
            ],
            "description": "Log output to console"
        }
    }
    ```

=== "java.json"

    ```json
    {
        // Place your snippets for java here. Each snippet is defined under a snippet name and has a prefix, body and 
        // description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
        // $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
        // same ids are connected.
        // Example:
        "Print to console": {
            "prefix": "code",
            "body": [
                "import java.util.*;",
                "import java.io.*;",
                "import java.math.*;",
                "",
                "public class Main",
                "{",
                "	",
                "	",
                "	",
                "    void solve() throws Exception",
                "    {",
                "		",
                "		",
                "		",
                "    }",
                "",
                "    public static void main(String[] args) throws Exception",
                "    {",
                "        Main cmd = new Main();",
                "        cmd.solve();",
                "        cout.flush();",
                "    }",
                "",
                "    public static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));",
                "    public static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));",
                "    public static String space = \"\\\\\\s+\";",
                "",
                "    public static String[] gss() throws Exception",
                "    {",
                "        return cin.readLine().split(space);",
                "    }",
                "",
                "    public static int gii(String s)",
                "    {",
                "        return Integer.parseInt(s);",
                "    }",
                "",
                "    public static long gll(String s)",
                "    {",
                "        return Long.parseLong(s);",
                "    }",
                "",
                "    public static double gff(String s)",
                "    {",
                "        return Double.parseDouble(s);",
                "    }",
                "    ",
                "}",
            ],
            "description": "Log output to console"
        }
    }
    ```

