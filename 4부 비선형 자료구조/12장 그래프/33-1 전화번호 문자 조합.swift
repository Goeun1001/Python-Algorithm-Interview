import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let digits = Array(digits)
        var result = [String]()
        let dict: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl",
        "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        
        func dfs(index: Int, temp: String) {
            if temp.count == digits.count {
                result.append(temp)
                return
            }
            
            for i in index..<digits.count {
                for j in Array(dict[digits[i]]!) {
                    dfs(index: i + 1, temp: temp + String(j))
                }
            }
        }
        
        dfs(index: 0, temp: "")
        
        return result
    }
}

print(Solution().letterCombinations("23")) // ["ad","ae","af","bd","be","bf","cd","ce","cf"]
//print(Solution().letterCombinations(""))
//print(Solution().letterCombinations("2")) // ["a","b","c"]
