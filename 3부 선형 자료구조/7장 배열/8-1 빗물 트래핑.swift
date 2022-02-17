import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty { return 0 }
        
        var result = 0
        var left = 0
        var right = height.count - 1
        var leftMax = height[left]
        var rightMax = height[right]
        
        while left < right {
            leftMax = max(height[left], leftMax)
            rightMax = max(height[right], rightMax)
            // 더 높은 쪽을 향해 투 포인터 이동
            if leftMax <= rightMax {
                result += leftMax - height[left]
                left += 1
            } else {
                result += rightMax - height[right]
                right -= 1
            }
        }
        
        return result
    }
}

print(Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])) // 6
print(Solution().trap([4,2,0,3,2,5])) // 9
