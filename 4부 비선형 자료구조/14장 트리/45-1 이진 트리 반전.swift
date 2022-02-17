class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root != nil {
            let temp = root!.left
            root!.left = self.invertTree(root!.right)
            root!.right = self.invertTree(temp)
            return root
        }
        return nil
    }
}
