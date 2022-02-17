class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        var depth = 0
        guard let root = root else { return 0 }
        var queue = [root]
        
        while !queue.isEmpty {
            depth += 1
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
        }
        return depth
    }
}
