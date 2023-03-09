# 我的日程安排表 II

https://leetcode.cn/problems/my-calendar-ii/description/

??? success "代码参考"

    ```java
    class MyCalendarTwo {

        final static int left = 0, right = 1000000000;

        class Node {
            int sum; // 定义为这个区间的最大日程
            int tag; // 懒惰修改
            Node lc, rc;
            public Node(int x, Node l, Node r) {
                sum = x; tag = 0; lc = l; rc = r;
            }
            public Node(int x) {
                this(x, null, null);
            }
            public Node() {
                this(0);
            }
        }

        Node rt = null;

        void push_up(Node p, int l, int r) {
            if (l == r) return;
            if (p == null) return;

            int res = 0;

            if (p.lc != null) res = Math.max(res, p.lc.sum);
            if (p.rc != null) res = Math.max(res, p.rc.sum);

            p.sum = res;
        }

        // void set(Node p, int l, int r) {
        //     if (p == null) return;
        //     if (l == r) {
        //         p.sum += p.tag;
        //         p.tag = 0;
        //     }
        // }

        void push_down(Node p, int l, int r) {
            if (p == null) return;
            if (p.tag == 0) return;
            if (l == r) return;

            if (p.lc == null) p.lc = new Node();
            if (p.rc == null) p.rc = new Node();

            p.lc.tag += p.tag;
            p.rc.tag += p.tag;

            p.lc.sum += p.tag;
            p.rc.sum += p.tag;

            p.tag = 0;

            push_up(p, l, r);
        }

        Node add(Node p, int l, int r, int ll, int rr, int x) {
            if (p == null) p = new Node();

            if (ll <= l && r <= rr) {
                p.sum += x;
                p.tag += x;
                return p;
            }

            push_down(p, l, r);

            int mid = (l + r) >> 1;

            if (ll <= mid) {
                p.lc = add(p.lc, l, mid, ll, rr, x);
            }
            if (rr > mid) {
                p.rc = add(p.rc, mid + 1, r, ll, rr, x);
            }

            push_up(p, l, r);
            return p;
        }

        int query(Node p, int l, int r, int ll, int rr) {
            if (p == null) return 0;
            if (ll <= l && r <= rr) return p.sum;

            push_down(p, l, r);

            int mid = (l + r) >> 1;
            int res = 0;

            if (ll <= mid)
                res = Math.max(res, query(p.lc, l, mid, ll, rr));
            if (rr > mid)
                res = Math.max(res, query(p.rc, mid + 1, r, ll, rr));

            push_up(p, l, r);
            
            return res;
        }

        public MyCalendarTwo() {
            ;
        }
        
        public boolean book(int start, int end) {
            if (query(rt, left, right, start, end - 1) == 2) 
                return false;
            rt = add(rt, left, right, start, end - 1, 1);
            return true;
        }
    }

    /**
    * Your MyCalendarTwo object will be instantiated and called as such:
    * MyCalendarTwo obj = new MyCalendarTwo();
    * boolean param_1 = obj.book(start,end);
    */
    ```