# [路径总和 II](https://leetcode.cn/problems/path-sum-ii/description/)

=== "方法一"

    ```java
    /**
    * Definition for a binary tree node.
    * public class TreeNode {
    *     int val;
    *     TreeNode left;
    *     TreeNode right;
    *     TreeNode() {}
    *     TreeNode(int val) { this.val = val; }
    *     TreeNode(int val, TreeNode left, TreeNode right) {
    *         this.val = val;
    *         this.left = left;
    *         this.right = right;
    *     }
    * }
    */
    class Solution {

        public static final int N = 50010;
        List<List<Integer>> res = new ArrayList<>();
        int[] dres = new int[N];
        int cur;

        public List<List<Integer>> pathSum(TreeNode root, int targetSum) {
            dfs(root, targetSum);
            return res;
        }

        void dfs(TreeNode root, int num) {
            if (root == null) return;

            dres[++ cur] = root.val;
            num -= root.val;

            if (root.left == null && root.right == null) {
                if (num == 0) {
                    List<Integer> aa = new ArrayList<>();

                    for (int i = 1; i <= cur; i ++) {
                        aa.add(dres[i]);
                    }

                    res.add(aa);
                }
            }

            if (root.left != null) dfs(root.left, num);
            if (root.right != null) dfs(root.right, num);

            cur --;
        }
    }
    ```