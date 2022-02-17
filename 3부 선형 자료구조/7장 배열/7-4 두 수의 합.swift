import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]() // 숫자: 인덱스
        
        for (i, num) in nums.enumerated() {
            if dict[target - num] != nil {
                return [dict[target - num]!, i]
            }
            dict[num] = i
        }
        
        return []
    }
}
