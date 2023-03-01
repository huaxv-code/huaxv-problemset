# KMP

定义 `ne[i]` 代表下标为 $i$ 的字符前面那段子串的最大前后缀匹配长度，例如：

> ` aabcaabc`
> `-101001234`

假设我是在上面下标为 $6$ 的字符 `b` 处匹配失败，但是前面部分是匹配成功的，前面部分的最长前后缀也是能匹配的，此时我们只需要跳到最长前后缀的下一个字符，也就 `b` 处重新开始就好（可以优化，但少用）.

??? note "代码参考"

    ```c++
    int i = -1, j = 0;
    ne[0] = -1;

    while (j < n) {
        if (i == -1 || c.charAt(i) == c.charAt(j)) {
            ne[++ j] = ++ i;
        } else {
            i = ne[i];
        }
    }

    i = 0; j = 0;
    while (j < m) {
        if (i == -1 || c.charAt(i) == s.charAt(j)) {
            if (i == n - 1) {
                cout.print(j - i + " ");
                i = ne[i]; continue;
            }
            i ++; j ++;
        } else {
            i = ne[i];
        }
    }
    ```