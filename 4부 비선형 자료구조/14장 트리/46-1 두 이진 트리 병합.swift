class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 != nil && root2 != nil {
            let node = TreeNode(root1!.val + (root2?.val ?? 0))
            node.left = mergeTrees(root1?.left, root2?.left)
            node.right = mergeTrees(root1?.right, root2?.right)
            return node
        } else {
            if root1 == nil {
                return root2
            } else {
                return root1
            }
        }
    }
}
