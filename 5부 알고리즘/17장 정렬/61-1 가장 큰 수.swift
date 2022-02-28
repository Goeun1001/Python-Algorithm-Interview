import Foundation

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        if nums.allSatisfy({ $0 == 0 }) {
            return "0"
        }
        
        let new: [Int] = nums.sorted(by: { Int(String($0) + String($1))! > Int(String($1) + String($0))! })
        
        return new.map { String($0) }.joined()
    }
}
