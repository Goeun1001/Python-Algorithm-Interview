import Foundation

public struct Heap {
    var elements: [(Int, ListNode)] = []
    let sort: ((Int, ListNode), (Int, ListNode)) -> Bool
    
    init(sort: @escaping ((Int, ListNode), (Int, ListNode)) -> Bool, elements: [(Int, ListNode)] = []) {
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
    
    func peek() -> (Int, ListNode)? {
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
    
    mutating func remove() -> (Int, ListNode)? {
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
    
    mutating func insert(_ element: (Int, ListNode)) {
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
    
    mutating func remove(at index: Int) -> (Int, ListNode)? {
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
    
    func index(of element: (Int, ListNode), startingAt i: Int) -> Int? {
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

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap(sort: { $0.0 < $1.0 })
        let root = ListNode()
        var result = root
        
        for list in lists {
            if list != nil {
                heap.insert((list!.val, list!))
            }
        }
        
        while !heap.isEmpty {
            let node = heap.remove()!
            result.next = node.1
            result = result.next!
            
            if result.next != nil {
                heap.insert((result.next!.val, result.next!))
            }
        }
        
        return root.next
    }
}

