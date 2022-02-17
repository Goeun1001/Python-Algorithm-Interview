class Solution {
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        var result = 0
        
        func dfs(node: TreeNode?) -> Int {
            if node == nil { return 0 }
            
            var left = dfs(node: node?.left)
            var right = dfs(node: node?.right)
            
            if node!.left != nil && node!.left!.val == node!.val {
                left += 1
            } else {
                left = 0
            }
            if node!.right != nil && node!.right!.val == node!.val {
                right += 1
            } else {
                right = 0
            }
            
            result = max(result, left + right)
            
            return max(left, right)
        }
        
        dfs(node: root)
        return result
    }
}

