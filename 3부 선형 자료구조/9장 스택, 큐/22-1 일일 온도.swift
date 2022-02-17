
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        
        for (i, cur) in temperatures.enumerated() {
            // 현재 온도가 스택 값보다 높다면 정답 처리
            while !stack.isEmpty && cur > temperatures[stack.last!] {
                let last = stack.removeLast()
                answer[last] = i - last
            }
            stack.append(i)
        }
        
        return answer
    }
}
