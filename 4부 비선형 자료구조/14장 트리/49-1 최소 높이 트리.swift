class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n <= 1 {
            return [0]
        }
        
        var n = n

        // 양방향 그래프 구성
        var graph = Array(repeating: [Int](), count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
    
        // 첫 번째 리프 노드 추가
        var leaves = [Int]()
        for i in 0..<n {
            if graph[i].count == 1 {
                leaves.append(i)
            }
        }

        // 루트 노드만 남을 때까지 반복 제거
        while n > 2 {
            n -= leaves.count
            var new_leaves = [Int]()
            for leaf in leaves {
                let neighbor = graph[leaf].removeLast()
                
                for i in 0..<graph[neighbor].count {
                    if graph[neighbor][i] == leaf {
                        graph[neighbor].remove(at: i)
                        break
                    }
                }

                if graph[neighbor].count == 1 {
                    new_leaves.append(neighbor)
                }
            }

            leaves = new_leaves
        }

        return leaves
    }
}
