class Solution {
    var value = 0
    
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        if root != nil {
            bstToGst(root!.right)
            value += root!.val
            root!.val = value
            bstToGst(root!.left)
        }
        
        return root
    }
}
