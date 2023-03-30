# [Good Game, GG](https://ac.nowcoder.com/acm/contest/17797/G)

=== "贪心"

    如果只有两个数，分别是偶数和奇数，那么 Alice 选择奇数切割时，要尽可能的切割成两个奇数，这样才能保留更多的切割次数，但事实上给奇数切一刀必定只能切成一个小偶数和小奇数，那怎么样才能保证后续的切割次数尽可能多？

    如果对于奇数，我切一刀，分成一个 2 和一个几乎数值上和原奇数很逼近的较大奇数，就能使得切割的次数尽可能的多，并且还能逼得对方切割 2 时分出更多的 1.

    如果对于偶数，我切一刀，我得尽可能多的分成更多的偶数，你整么切都是可以的，只要不切割成两个奇数，但最终切割了很多次之后，该偶数会被切割成连续的 2，如果偶数都变成 2 时，还没有分出胜负，那么 Bob 必输，因为剩下能切割的偶数只剩 2，切割一次 2，机会少 1，而对方机会多 2，陷入必输的死局。

    ```java

    import java.util.* ;
    import java.io.* ;
    import java.math.* ;

    public class Main {

        int N = 1000000;

        int n, t;
        long[] as = new long[N];

        long one, two, odd, even;

        public void solve() throws Exception {
            t = gii();

            while (t -- > 0) {
                n = gii();

                one = two = odd = even = 0;

                for (int i = 1; i <= n; i ++) {
                    as[i] = gii();

                    if (as[i] == 1) {
                        one ++; continue;
                    }
                    if (as[i] == 2) {
                        two ++; continue;
                    }

                    if (as[i] % 2 == 0) {
                        even += as[i] / 2 - 1;
                    } else {
                        odd += (as[i] - 1) / 2;
                        odd ++;
                    }
                }

                if (one + odd <= even) cout.println("Bob");
                else {
                    cout.println("Alice");
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

