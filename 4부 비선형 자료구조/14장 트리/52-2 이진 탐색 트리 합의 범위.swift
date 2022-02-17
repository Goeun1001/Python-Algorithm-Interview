class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        if root == nil {
            return 0
        }
        
        if root!.val < low {
            return rangeSumBST(root!.right, low, high)
        } else if root!.val > high {
            return rangeSumBST(root!.left, low, high)
        }
        return root!.val + rangeSumBST(root!.right, low, high) + rangeSumBST(root!.left, low, high)
    }
}
