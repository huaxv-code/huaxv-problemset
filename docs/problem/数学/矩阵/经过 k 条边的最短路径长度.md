# 经过 k 条边的最短路径长度

=== "矩阵幂+广义矩阵乘"

    ```java
	long[][] mmul(long[][] a, long[][] b, int x, int y, int z) {
		
		long[][] res = new long[x + 1][z + 1];
		
		for (int i = 1; i <= x; i ++) {
			for (int j = 1; j <= z; j ++) {
				res[i][j] = inf;
			}
		}
		
		// 如果已经知道了长度为 2 的最短路径和长度为 2 的最短路径
		// 那么长度为 4 的最短路径也可以推导出来了
		for (int i = 1; i <= x; i ++) {
			for (int j = 1; j <= z; j ++) {
				for (int k = 1; k <= y; k ++) {
					res[i][j] = Math.min(res[i][j], a[i][k] + b[k][j]);
				}
			}
		}
		
		return res;
	}
	
	long[][] mpow(long[][] a, int n, long x) {
		if (x == 0) {
			long[][] res = new long[n + 1][n + 1];
			
			for (int i = 1; i <= n; i ++) {
				res[i][i] = 1L;
			}
			
			return res;
		}
		
		if (x == 1L) return a;
		
		long[][] res = mpow(a, n, x >> 1);
		res = mmul(res, res, n, n, n);
		if ((x & 1L) == 1L) res = mmul(res, a, n, n, n);
		return res;
	}
	
	long[][] mmin(long[][] a, int n, int k) {
		return mpow(a, n, k);
	}
    ```