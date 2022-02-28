import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count <= 2 { return nums.max()! }
        
        var dp = [nums[0], max(nums[0], nums[1])]
        
        for i in 2..<nums.count {
            dp.append(max(dp[i - 1], dp[i - 2] + nums[i]))
        }
        
        return dp.last!
    }
}
