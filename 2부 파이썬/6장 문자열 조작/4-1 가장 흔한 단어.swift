import Foundation

class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var dict = [String: Int]()
        let words = paragraph.split( omittingEmptySubsequences: true, whereSeparator: { ", ".contains($0) })
        
        for word in words {
            let word = word.lowercased().filter { "abcdefghijklmnopqrstuvwxyz".contains($0) }
            
            if !banned.contains(word) {
                if dict[word] == nil {
                    dict[word] = 1
                } else {
                    dict[word]! += 1
                }
            }
        }
        
        for word in dict.sorted(by: { $0.value > $1.value }) {
            return word.key
        }
        
        return ""
    }
}
