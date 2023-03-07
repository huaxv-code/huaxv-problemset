# 我的日程安排表 I

??? success "按需开点"

    ```java
    class MyCalendar {
        class Node {
            int sum;
            Node lc, rc;
            public Node() {
                this(0, null, null);
            }
            public Node(int x) {
                this(x, null, null);
            }
            public Node(int x, Node l, Node r) {
                sum = x;
                lc = l;
                rc = r;
            }
        }

        Node root = null;

        // 查询区间 [ll, rr] 是否有交集, 有为 false，无为 true
        boolean query(Node nd, int l, int r, int ll, int rr) {
            if (nd == null) {
                return true;
            }

            if (nd.sum > 0 && (l <= ll && ll <= r || l <= rr && rr <= r || l <= ll && rr <= r) || ll <= l && r <= rr)
                return false;
            
            int mid = (l + r) >> 1;
            if (ll <= mid) {
                if (!query(nd.lc, l, mid, ll, rr))
                    return false;
            }

            if (rr > mid) {
                if (!query(nd.rc, mid + 1, r, ll, rr))
                    return false;
            }

            return true;
        }

        Node update(Node nd, int l, int r, int ll, int rr, int x) {
            if (nd == null) {
                nd = new Node();
            }

            if (ll <= l && r <= rr) {
                nd.sum = x;
                return nd;
            }

            int mid = (l + r) >> 1;
            if (ll <= mid) {
                nd.lc = update(nd.lc, l, mid, ll, rr, x);
            }

            if (rr > mid) {
                nd.rc = update(nd.rc, mid + 1, r, ll, rr, x);
            }

            return nd;
        }

        static final int left = 0;
        static final int right = 1000000001;

        public MyCalendar() {
            ;
        }
        
        public boolean book(int start, int end) {
            if (query(root, left, right, start, end - 1))
            {
                root = update(root, left, right, start, end - 1, 1);
                return true;
            }
            return false;
        }
    }

    /**
    * Your MyCalendar object will be instantiated and called as such:
    * MyCalendar obj = new MyCalendar();
    * boolean param_1 = obj.book(start,end);
    */
    ```