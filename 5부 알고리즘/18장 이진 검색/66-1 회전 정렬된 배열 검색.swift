import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        let pivot = left
        
        left = 0
        right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            let midPivot = (mid + pivot) % nums.count
            
            if nums[midPivot] == target {
                return midPivot
            } else if nums[midPivot] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
}

Solution().search([4,5,6,7,0,1,2], 0) // 4
