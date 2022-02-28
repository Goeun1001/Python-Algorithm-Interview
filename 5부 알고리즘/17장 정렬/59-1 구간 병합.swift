import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        for i in intervals.sorted(by: { $0[0] < $1[0] }) {
            if !result.isEmpty && i[0] <= result.last![1] {
                result[result.count - 1][1] = max(result[result.count - 1][1], i[1])
            } else {
                result.append(i)
            }
        }
        
        return result
    }
}
