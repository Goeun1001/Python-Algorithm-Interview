class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty { return nil }
        
        let mid = nums.count / 2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(Array(nums[0..<mid]))
        node.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        
        return node
    }
}
