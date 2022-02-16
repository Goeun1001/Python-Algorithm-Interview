import Foundation

class Node {
    var key: Int
    var value: Int
    var next: Node?
    
    init(key: Int, value: Int, next: Node? = nil) {
        self.key = key
        self.value = value
        self.next = next
    }
}

class MyHashMap {
    let size = 1000
    var table = [Int: Node]()
    
    init() {}
    
    func put(_ key: Int, _ value: Int) {
        let index = key % size
        
        if table[index] == nil {
            table[index] = Node(key: key, value: value)
        } else {
            var p =  table[index]
            while p != nil {
                if p!.key == key {
                    p!.value = value
                    return
                }
                if p!.next == nil {
                    break
                }
                p = p!.next
            }
            p!.next = Node(key: key, value: value)
        }
    }
    
    func get(_ key: Int) -> Int {
        let index = key % size
        
        if table[index] == nil {
            return -1
        } else {
            var p =  table[index]
            while p != nil {
                if p!.key == key {
                    return p!.value
                }
                p = p!.next
            }
            return -1
        }
    }
    
    func remove(_ key: Int) {
        let index = key % size
        
        if table[index] == nil {
            return
        } else {
            var p = table[index]
            
            if p!.key == key {
                if p!.next == nil {
                    table[index] = nil
                    return
                } else {
                    table[index] = p!.next
                    return
                }
            }
            
            var prev = p
            while p != nil {
                if p!.key == key {
                    prev!.next = p!.next
                    return
                }
                prev = p
                p = p?.next
            }
        }
    }
}
