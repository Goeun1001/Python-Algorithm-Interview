import Foundation

class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        let array = Array(s)
        
        // 집합으로 정렬
        for char in Set(s).sorted() {
            var index = 0
            inn: for i in 0..<s.count {
                if array[i] == char {
                    index = i
                    break inn
                }
            }
            
            let char = String(char)
            let suffix = String(array[index..<s.count])
            
            // 전체 집합과 접미사 집합이 일치할때 분리 진행
            if Set(s) == Set(suffix) {
                return char + self.removeDuplicateLetters(suffix.replacingOccurrences(of: char, with: ""))
            }
        }
            
        return ""
    }
}

print(Solution().removeDuplicateLetters("bcabc"))
print(Solution().removeDuplicateLetters("cbacdcbc"))
