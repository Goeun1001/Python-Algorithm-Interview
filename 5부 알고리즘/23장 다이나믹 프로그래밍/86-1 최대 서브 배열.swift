import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        
        var sums: [Int] = [nums[0]]
        
        for i in 1...nums.count - 1 {
            sums.append(max(0, sums[i-1]) + nums[i])
        }
        
        return sums.max()!
    }
}
