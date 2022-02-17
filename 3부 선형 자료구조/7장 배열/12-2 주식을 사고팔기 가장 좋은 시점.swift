import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        var m = Int.max
        
        for price in prices {
            m = min(m, price)
            result = max(result, price - m)
        }
        
        return result
    }
}

print(Solution().maxProfit([7,1,5,3,6,4])) // 5
print(Solution().maxProfit([7,6,4,3,1])) // 0
