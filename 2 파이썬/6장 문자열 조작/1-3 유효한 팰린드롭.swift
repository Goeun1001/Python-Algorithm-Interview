import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let str = s.lowercased().filter { "0123456789abcdefghijklmnopqrstuvwxyz".contains($0) }
        
        if str.isEmpty { return true }
        
        return str == String(str.reversed())
    }
}
