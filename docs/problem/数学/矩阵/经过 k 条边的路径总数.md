# 经过 k 条边的路径总数

=== "矩阵幂"

    ```java
	long[][] cnt(long[][] aa, int n, int k, long mod) {
		return mpow(aa, n, k, mod);
	}
    ```