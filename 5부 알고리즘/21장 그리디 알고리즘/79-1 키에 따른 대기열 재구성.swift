import Foundation

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var heap = [[Int]]()
        
        for person in people {
            heap.append(person)
        }
        
        heap.sort(by: { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] })
        
        var result = [[Int]]()
        
        while !heap.isEmpty {
            let person = heap.removeLast()
            result.insert(person, at: person[1])
        }
        
        return result
    }
}
