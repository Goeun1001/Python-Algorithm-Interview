import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        
        for str in strs {
            let key = String(str.sorted())
            
            if dict[key] == nil {
                dict[key] = [str]
            } else {
                dict[key]!.append(str)
            }
        }
        
        return Array(dict.values)
    }
}

print(Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"])) // [["bat"],["nat","tan"],["ate","eat","tea"]]
print(Solution().groupAnagrams([""]))
print(Solution().groupAnagrams(["a"]))
print(Solution().groupAnagrams(["ddddddddddg","dgggggggggg"]))
