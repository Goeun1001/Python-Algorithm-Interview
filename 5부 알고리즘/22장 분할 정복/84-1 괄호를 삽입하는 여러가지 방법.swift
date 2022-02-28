import Foundation

class Solution {
    func compute(_ left: [Int], _ right: [Int], _ op: Character) -> [Int] {
        var results = [Int]()
        
        for l in left {
            for r in right {
                if op == "+" {
                    results.append(l + r)
                } else if op == "-" {
                    results.append(l - r)
                } else if op == "*" {
                    results.append(l * r)
                }
            }
        }
        
        return results
    }
    
    func diffWaysToCompute(_ expression: String) -> [Int] {
        if Int(expression) != nil {
            return [Int(expression)!]
        }

        var results = [Int]()
        let expression = Array(expression)
        
        for (index, value) in expression.enumerated() {
            if "-+*".contains(value) {
                let left = self.diffWaysToCompute(String(expression[0..<index]))
                let right = self.diffWaysToCompute(String(expression[index + 1..<expression.count]))

                compute(left, right, value).forEach { results.append($0) }
            }
        }
        return results
    }
}
