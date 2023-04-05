# DFS 序笔记

=== "DFS 序"

    ![](./img/DFS序.png)

    上述图形的 **DFS 序** 是：

    > ` A B D D E I I E B C F F G G H H C A `

    用 `dfs 序` 可以快速的寻找以某节点为根节点的子树节点。

    代码参考如下：

    ```java
    int N = 1000000;
    
    int n, m;
    int[] g = new int[N];
    int[] e = new int[N];
    int[] ne = new int[N];
    int cur;

    int[] DFS = new int[N];     int cnt;

    void dfs(int v, int u) {
        DFS[++ cnt] = v;
        for (int i = g[v]; i > 0; i = ne[i]) {
            if (e[i] == u) continue;
            dfs(e[i], v);
        }
        DFS[++ cnt] = v;
    }
    ```

