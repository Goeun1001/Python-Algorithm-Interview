import Foundation

class Solution {
    var dp = [Int: Int]()

    func fib(_ n: Int) -> Int {
        if n <= 1 { return n }
        
        if dp[n] != nil {
            return dp[n]!
        }
        dp[n] = fib(n - 1) + fib(n - 2)
        return dp[n]!
    }
}
