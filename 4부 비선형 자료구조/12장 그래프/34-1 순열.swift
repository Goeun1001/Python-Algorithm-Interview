import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        let targetNum = nums.count
        var result = [[Int]]()
        var visited = [Bool](repeating: false, count: nums.count)
        
        func permutation(_ nowPermute: [Int]) {
            if nowPermute.count == targetNum {
                result.append(nowPermute)
                return
            }
            for i in 0..<nums.count {
                if visited[i] == true {
                    continue
                }
                else {
                    visited[i] = true
                    permutation(nowPermute + [nums[i]])
                    visited[i] = false
                }
            }
        }
        
        permutation([])
        
        return result
    }
}
