import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty { return false }
                
                let last = stack.removeLast()
                
                if last == "(" && char == ")" {
                    continue
                } else if last == "{" && char == "}" {
                    continue
                } else if last == "[" && char == "]" {
                    continue
                } else {
                    return false
                }
            }
        }
        
        return stack.count == 0
    }
}
