import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count < k { return nums }
        
        var result = [Int]()
        var window = [Int]()
        var M = Int.min
        
        for (i, v) in nums.enumerated() {
            window.append(v)
            if i < k - 1 {
                continue
            }
            
            // 새로 추가된 값이 기존 최대값보다 큰 경우 교체
            if M == Int.min {
                M = window.max()!
            } else if v > M {
                M = v
            }
            
            result.append(M)
            
            // 최대값이 윈도우에서 빠지면 초기화
            if M == window.removeFirst() {
                M = Int.min
            }
        }
        return result
    }
}

Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3) // [3,3,5,5,6,7]
