class Solution {
    func buildTree(_ preorder: inout [Int], _ inorder: [Int]) -> TreeNode? {
        if !inorder.isEmpty {
            // 전위 순회 결과는 중위 순회 분할 인덱스
            var index = 0
            let root = preorder.removeFirst()
            for i in 0..<inorder.count {
                if inorder[i] == root {
                    index = i
                    break
                }
            }
            
            // 중위 순회 결과 분할 정복
            let node = TreeNode(inorder[index])
            node.left = self.buildTree(&preorder, Array(inorder[0..<index]))
            node.right = self.buildTree(&preorder, Array(inorder[index + 1..<inorder.count]))
            
            return node
        }
        
        return nil
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorder = preorder
        
        return buildTree(&preorder, inorder)
    }
}
