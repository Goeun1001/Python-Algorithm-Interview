import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 { return [] }
        
        var result = [[Int]]()
        let nums = nums.sorted()
        
        for i in 0..<nums.count - 2 {
            // 중복된 값 건너뛰기
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                var sum = nums[i] + nums[left] + nums[right]
                if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    result.append([nums[i], nums[left], nums[right]])
                    
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    
                    left += 1
                    right -= 1
                }
            }
        }
        
        return result
    }
}

print(Solution().threeSum([-1,0,1,2,-1,-4])) // [[-1,-1,2],[-1,0,1]]
print(Solution().threeSum([])) // []
print(Solution().threeSum([0])) // []
