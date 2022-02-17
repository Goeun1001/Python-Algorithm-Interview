import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        var result = [Int]()
        var k = k
        
        for num in nums {
            if dict[num] == nil {
                dict[num] = 1
            } else {
                dict[num]! += 1
            }
        }
        
        for d in dict.sorted(by: { $0.value > $1.value }) {
            if k == 0 {
                return result
            } else {
                result.append(d.key)
            }
            k -= 1
        }
        
        return result
    }
}
