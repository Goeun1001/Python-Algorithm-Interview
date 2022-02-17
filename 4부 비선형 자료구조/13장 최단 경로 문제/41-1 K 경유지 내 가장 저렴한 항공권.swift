import Foundation

class Solution {
    public struct Heap<Element: Equatable> {
        var elements: [Element] = []
        let sort: (Element, Element) -> Bool
        
        init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
            self.sort = sort
            self.elements = elements
            buildHeap()
        }
        
        var isEmpty: Bool {
            elements.isEmpty
        }
        
        var count: Int {
            elements.count
        }
        
        func peek() -> Element? {
            elements.first
        }
        
        mutating public func buildHeap() {
            if !elements.isEmpty {
                for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                    siftDown(from: i)
                }
            }
        }
        
        func leftChildIndex(ofParentAt index: Int) -> Int {
            (2 * index) + 1
        }
        
        func rightChildIndex(ofParentAt index: Int) -> Int {
            (2 * index) + 2
        }
        
        func parentIndex(ofChildAt index: Int) -> Int {
            (index - 1) / 2
        }
        
        mutating func remove() -> Element? {
            guard !isEmpty else {
                return nil
            }
            elements.swapAt(0, count - 1)
            defer {
                siftDown(from: 0)
            }
            return elements.removeLast()
        }
        
        mutating func siftDown(from index: Int) {
            var parent = index
            while true {
                let left = leftChildIndex(ofParentAt: parent)
                let right = rightChildIndex(ofParentAt: parent)
                var candidate = parent
                if left < count && sort(elements[left], elements[candidate]) {
                    candidate = left
                }
                if right < count && sort(elements[right], elements[candidate]) {
                    candidate = right
                }
                if candidate == parent {
                    return
                }
                elements.swapAt(parent, candidate)
                parent = candidate
            }
        }
        
        mutating func insert(_ element: Element) {
            elements.append(element)
            siftUp(from: elements.count - 1)
        }
        
        mutating func siftUp(from index: Int) {
            var child = index
            var parent = parentIndex(ofChildAt: child)
            while child > 0 && sort(elements[child], elements[parent]) {
                elements.swapAt(child, parent)
                child = parent
                parent = parentIndex(ofChildAt: child)
            }
        }
        
        mutating func remove(at index: Int) -> Element? {
            guard index < elements.count else {
                return nil // 1
            }
            if index == elements.count - 1 {
                return elements.removeLast() // 2
            } else {
                elements.swapAt(index, elements.count - 1) // 3
                defer {
                    siftDown(from: index) // 5
                    siftUp(from: index)
                }
                return elements.removeLast() // 4
            }
        }
        
        func index(of element: Element, startingAt i: Int) -> Int? {
            if i >= count {
                return nil
            }
            if sort(element, elements[i]) {
                return nil
            }
            if element == elements[i] {
                return i
            }
            if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
                return j
            }
            if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
                return j
            }
            return nil
        }
    }
    
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let start = src
        // 각 노드에 연결되어 있는 노드에 대한 정보를 담는 리스트를 만들기
        var graph = Array(repeating: [[Int]](), count: n)
        var weight = Array(repeating: [Int.max, k], count: n)
        for flight in flights {
            graph[flight[0]].append([flight[1], flight[2]])
        }
        
        // 시작 노드로 가기 위한 최단 경로는 0으로 설정하여, 큐에 삽입
        var queue = Heap(sort: { $0.first! < $1.first! }, elements: [[Int]]())
        queue.insert([0, start, 0]) // 비용 지점 카운트
        
        while !queue.isEmpty {
            let value = queue.remove()!
            let dist = value[0]
            let now = value[1]
            let count = value[2]
            
            if now == dst {
                return dist
            }
            
            if count <= k {
                // 현재 노드와 연결된 다른 인접한 노드들을 확인
                for i in graph[now] {
                    let cost = dist + i[1]
                    if cost < weight[i[0]][0] || count + 1 <= weight[i[0]][1] {
                        weight[i[0]] = [cost, count + 1]
                        queue.insert([cost, i[0], count + 1])
                    }
                }
            }
        }
        
        return -1
    }
}
