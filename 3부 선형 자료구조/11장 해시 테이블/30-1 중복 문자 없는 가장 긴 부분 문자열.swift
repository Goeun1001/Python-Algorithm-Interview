import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        let array = Array(s)
        var used = [Character: Int]()
        var start = 0
        
        for (index, char) in s.enumerated() {
            if used[char] != nil && start <= used[char]! {
                start = used[char]! + 1
            } else {
                result = max(result, index - start + 1)
            }
            
            used[char] = index
        }
        
        return result
    }
}
