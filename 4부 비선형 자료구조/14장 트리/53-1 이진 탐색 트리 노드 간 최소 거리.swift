class Solution {
    var prev = -100000
    var result = Int.max
    
    func minDiffInBST(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        if root!.left != nil {
            self.minDiffInBST(root!.left)
        }
        
        result = min(result, root!.val - self.prev)
        prev = root!.val
        
        if root!.right != nil {
            self.minDiffInBST(root!.right)
        }
        
        return self.result
    }
}
