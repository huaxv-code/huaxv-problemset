# [An Easy Problem](https://ac.nowcoder.com/acm/contest/17797/A)

=== "堆模拟"

    在区间 $x \in [1, n]，y \in [1, m]$ 的网格点中，求 $x * y$ 的第 $k$ 大。

    对于点 $(n, m)$ 来说，其面积一定是最大的，那么比 $(n, m)$ 次小的点一定在 $(n - 1, m)$ 和 $(n, m - 1)$ 之间，不可能两个都减 $1$ 甚至减去更多吧。

    取其中最大的，点将该点的左边和下方的点有丢人堆中寻找在次小的点。

    我们按照此规律去模拟，会发现，如果我取出了靠中间的点 $(x, y)$ 时，那么该点的上方或者右边的点：$(x + 1, y)$ 、$(x, y + 1)$ 的点一定会先于该点取出，

    所以：正上方的点一定比正下方的点先取出，正右边的点一定比正左边的点先取出。

    为了避免取出的点有重复，我们先将最上方的所有点(或者最右方的所有点)放入到堆中，取出最小的点就将正下方的邻居(或者正左边的邻居)放入堆中，这样可以保证取出的顺序是上方优先(或者右方优先)，还保证了可以不重复连续遍历一整图。

    时间复杂度取决于 $k$， $O(klog(k))$

    ```java
    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {

        long n, m, k;

        java.util.Queue<long[]> qu = new PriorityQueue<>((x, y) -> {
            long a = x[0] * x[1];
            long b = y[0] * y[1];
            if (a > b) return -1;
            if (a < b) return 1;
            return 0;
        });

        long cur;

        public void solve() throws Exception {
            n = gll();
            m = gll();
            k = gll();

            for (int i = (int)n; i > 0; i --) {
                qu.offer(new long[]{i, m}); 
            }

            while (qu.size() > 0) {
                long[] aa = qu.poll();
                cur ++;
                if (cur == k) {
                    cout.println(aa[0] * aa[1]);
                    return;
                }

                // if (aa[0] - 1 > 0) {
                //     qu.offer(new long[]{aa[0] - 1, aa[1]});
                // }
                if (aa[1] - 1 > 0) {
                    qu.offer(new long[]{aa[0], aa[1] - 1});
                }
            }
        }

        public static void main(String[] args) throws Exception {
            
            Main cmd = new Main();
            cmd.solve();
            cout.flush();
        }

        public static BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
        public static PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));
        public static StreamTokenizer next = new StreamTokenizer(cin);

        int gii() throws Exception {
            next.nextToken();
            return (int)next.nval;
        }

        long gll() throws Exception {
            next.nextToken();
            return (long)next.nval;
        }

        double gff() throws Exception {
            next.nextToken();
            return (double)next.nval;
        }
    }
    ```