import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return -1
        }
        if nums.count == 1 {
            return nums[0]
        }

        let half = nums.count / 2
        let a = self.majorityElement(Array(nums[0..<half]))
        let b = self.majorityElement(Array(nums[half..<nums.count]))

        return [b, a][nums.filter { $0 == a }.count > half ? 1 : 0]
    }
}

print(Solution().majorityElement([2,2,1,1,1,2,2])) // 2
