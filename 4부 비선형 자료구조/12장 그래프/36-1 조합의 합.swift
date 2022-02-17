import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func combination(_ index: Int, _ nowCombi: [Int]) {
            if nowCombi.reduce(0, +) == target {
                result.append(nowCombi)
                return
            } else if nowCombi.reduce(0, +) > target {
                return
            }
            
            for i in index..<candidates.count {
                combination(i, nowCombi + [candidates[i]])
            }
        }
        
        combination(0, [])
        
        return result
    }
}
