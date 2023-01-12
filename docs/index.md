# 简介

我的名字叫 **北白川玉子**，我不仅喜欢 *糕饼类小吃*，还喜欢在空余时间 *刷题*，建立这个仓库就是方便存放我刷的题目进去。

或许我刷的题目过于简单，但是{==请不要笑话我==}，相反，你应该{==教教我==}，看在我那么 **可爱** 的份上。

<img src="./img/北白川玉子.jpg" alt="北白川玉子" style="display:block;margin:0 auto;">

---

下面是我用 **vscode** 刷题时的默认代码片段：

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

下面是我的 **vscode** 的配置文件内容：

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
    "explorer.confirmDragAndDrop": false
}
```