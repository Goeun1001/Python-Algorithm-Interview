import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        func combination(_ index: Int, _ nowCombi: [Int]) {
            result.append(nowCombi)
            
            if nowCombi.count == nums.count {
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
