class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        
        func dfs(node: TreeNode?) -> Int {
            if node == nil { return -1 }
            
            let left = dfs(node: node?.left)
            let right = dfs(node: node?.right)
            
            result = max(result, left + right + 2)
            
            return max(left, right) + 1
        }
        
        dfs(node: root)
        return result
    }
}

