import Foundation

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var result = 0
        
        for i in stride(from: 0, to: nums.count, by: 2) {
            result += min(nums[i], nums[i + 1])
        }
        
        return result
    }
}
