import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var answer = Int.min
        var current = 0
        
        for num in nums {
            current = max(num, current + num)
            answer = max(answer, current)
        }
        
        return answer
    }
}
