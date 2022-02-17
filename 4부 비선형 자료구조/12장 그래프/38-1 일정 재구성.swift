import Foundation

class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var result = [String]()
        let tickets = tickets.sorted(by: { $0[1] < $1[1] })
        var visited = [Bool](repeating: false, count: tickets.count)
        
        func dfs(start: String) {
            if result.count == tickets.count {
                result.append(start)
                return
            }
            
            for i in 0..<tickets.count {
                if tickets[i][0] == start && !visited[i] {
                    visited[i] = true
                    result.append(start)
                    dfs(start: tickets[i][1])
                    // 정답을 이미 구했다면 return
                    if result.count == tickets.count + 1 {
                        return
                    }
                    result.removeLast()
                    visited[i] = false
                }
            }
        }
        
        dfs(start: "JFK")
        
        return result
    }
}

print(Solution().findItinerary([["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]])) // ["JFK","MUC","LHR","SFO","SJC"]
print(Solution().findItinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])) // ["JFK","ATL","JFK","SFO","ATL","SFO"]
