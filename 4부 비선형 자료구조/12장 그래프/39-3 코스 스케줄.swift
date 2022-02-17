import Foundation

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var degrees = Array(repeating: 0, count: numCourses)
        var graph = Array(repeating: [Int](), count: numCourses)
        var queue = [Int]()
        
        for prerequisite in prerequisites {
            degrees[prerequisite[0]] += 1
            graph[prerequisite[1]].append(prerequisite[0])
        }
        
        for i in 0..<degrees.count {
            if degrees[i] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            for next in graph[node] {
                degrees[next] -= 1
                if degrees[next] == 0 {
                    queue.append(next)
                }
            }
        }
        
        return degrees.reduce(0, +) == 0
    }
}
