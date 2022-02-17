
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        func check(_ root: TreeNode?) -> Int {
            if root == nil {
                return 0
            }
            
            let left = check(root!.left)
            let right = check(root!.right)
            // 높이 차이가 나는 경우 -1, 이외에는 높이에 따라 1 증가
            if left == -1 || right == -1 || abs(left - right) > 1 {
                return -1
            }
            return max(left, right) + 1
        }
        
        return check(root) != -1
    }
}
