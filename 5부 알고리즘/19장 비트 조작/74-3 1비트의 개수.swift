import Foundation

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var targetNum = n
        var count = 0
        for i in 0..<32 {
            count += (targetNum & 1)
            targetNum = targetNum >> 1
        }
        return count
    }
}
