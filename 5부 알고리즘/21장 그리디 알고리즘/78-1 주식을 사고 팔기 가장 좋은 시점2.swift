import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        // 값이 오르는 경우 매 번 그리디 계산
        for i in 0..<prices.count - 1 {
            if prices[i + 1] > prices[i] {
                result += prices[i + 1] - prices[i]
            }
        }
        return result
    }
}
