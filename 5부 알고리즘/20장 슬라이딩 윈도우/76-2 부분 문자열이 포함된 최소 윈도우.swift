import Foundation

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let s = Array(s)
        var dict = [Character: Int]()
        for str in t {
            if dict[str] == nil {
                dict[str] = 1
            } else {
                dict[str]! += 1
            }
        }
        
        var missing = t.count
        var left = 0, start = 0, end = 0
        
        // 오른쪽 포인터 이동
        for (right, char) in s.enumerated() {
            if dict[char] ?? -1 > 0 {
                missing -= 1
            }
            dict[char]? -= 1
            
//            print(left, right, missing)
            // 필요 문자가 0이면 왼쪽 포인터 이동 판단
            if missing == 0 {
                while left < right && dict[s[left]] != 0 {
                    dict[s[left]]? += 1
                    left += 1
                }
                
                if end == 0 || right - left <= end - start - 1 {
                    start = left
                    end = right + 1
                }
                dict[s[left]]? += 1
                missing += 1
                left += 1
            }
        }
        return String(s[start..<end])
    }
}

//Solution().minWindow("ADOBECODEBANC", "ABC") // "BANC"
//Solution().minWindow("a", "a") // "a"
//Solution().minWindow("a", "b") // ""
//Solution().minWindow("a", "aa") // ""
Solution().minWindow("cabwefgewcwaefgcf", "cae") // "cwae"
