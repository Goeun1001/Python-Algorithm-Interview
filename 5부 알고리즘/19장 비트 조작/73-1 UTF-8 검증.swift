import Foundation

class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        // 문자 바이트 만큼 10으로 시작 판별
        func check(_ size: Int) -> Bool {
            for i in start + 1..<start + size + 1 {
                if i >= data.count || (data[i] >> 6) != 0b10 {
                    return false
                }
            }
            return true
        }
        
        var start = 0
        
        while start < data.count {
            // 첫 바이트 기준 총 문자 바이트 판별
            let first = data[start]
            if (first >> 3) == 0b11110 && check(3) {
                start += 4
            } else if (first >> 4) == 0b1110 && check(2) {
                start += 3
            } else if (first >> 5) == 0b110 && check(1) {
                start += 2
            } else if (first >> 7) == 0 {
                start += 1
            } else {
                return false
            }
        }
        return true
    }
}
