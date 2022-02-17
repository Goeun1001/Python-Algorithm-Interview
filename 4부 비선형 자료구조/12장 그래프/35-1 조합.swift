import Foundation

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        let nums = Array((1...n))
        var result = [[Int]]()
        
        func combination(_ index: Int, _ nowCombi: [Int]) {
            if nowCombi.count == k {
                result.append(nowCombi)
                return
            }
            for i in index..<nums.count {
                combination(i + 1, nowCombi + [nums[i]])
            }
        }
        
        combination(0, [])
        
        return result
    }
}
