import Foundation

class Solution {
    func fib(_ n: Int) -> Int {
        var x = 0, y = 1
        
        for _ in 0..<n {
            let temp = x
            x = y
            y = temp + y
        }
        
        return x
    }
}
