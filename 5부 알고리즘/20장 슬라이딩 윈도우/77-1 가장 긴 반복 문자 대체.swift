import Foundation

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var left = 0, right = 0
        var dict = [Character: Int]()
        let s = Array(s)
        
        for r in 1...s.count {
            right = r
            
            if dict[s[r - 1]] == nil {
                dict[s[r - 1]] = 1
            } else {
                dict[s[r - 1]]! += 1
            }
           
            // 가장 흔하게 등장하는 문자 탐색
            let maxChar = dict.sorted(by: { $0.value > $1.value }).first!.value
            
            // k 초과시 왼쪽 포인터 이동
            if right - left - maxChar > k {
                dict[s[left]]! -= 1
                left += 1
            }
        }
        return right - left
    }
}

Solution().characterReplacement("AAABC", 2) // 5
Solution().characterReplacement("ABAB", 2) // 4
Solution().characterReplacement("AABABBA", 1) // 4
