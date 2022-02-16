import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        return jewels.map { j in stones.filter { $0 == j }.count }.reduce(0, +)
    }
}
