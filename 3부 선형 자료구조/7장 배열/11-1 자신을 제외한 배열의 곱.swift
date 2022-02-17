import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var out = [Int]()
        var p = 1
        
        // 왼쪽 곱셈
        for i in 0..<nums.count {
            out.append(p)
            p = p * nums[i]
        }
        p = 1
        
        // 왼쪽 곱셈 결과에 오른쪽 값을 차례대로 곱셈
        for i in (0...nums.count - 1).reversed() {
            out[i] = out[i] * p
            p = p * nums[i]
        }
        return out
    }
}

print(Solution().productExceptSelf([1,2,3,4])) // [24,12,8,6]
