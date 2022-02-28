import Foundation

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        let MASK = 0xFFFFFFFF
        let INT_MAX = 0x7FFFFFFF
        var newA = a
        var newB = b
        
        // 합, 자릿수 처리
        while newB != 0 {
            let tempA = newA
            let tempB = newB
            newA = (tempA ^ tempB) & MASK
            newB = ((tempA & tempB) << 1) & MASK
        }

        // 음수 처리
        if newA > INT_MAX {
            newA = ~(newA ^ MASK)
        }
        return newA
    }
}
