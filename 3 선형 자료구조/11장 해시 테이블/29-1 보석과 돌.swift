import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var result = 0
        var dict = [Character: Int]()
        
        for stone in stones {
            if dict[stone] == nil {
                dict[stone] = 1
            } else {
                dict[stone]! += 1
            }
        }
        
        for jewel in jewels {
            if dict[jewel] != nil {
                result += dict[jewel]!
            }
        }
        
        return result
    }
}
