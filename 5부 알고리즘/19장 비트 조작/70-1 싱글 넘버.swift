import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}

//Solution().singleNumber([2,2,1])
Solution().singleNumber([4,1,2,1,2])
