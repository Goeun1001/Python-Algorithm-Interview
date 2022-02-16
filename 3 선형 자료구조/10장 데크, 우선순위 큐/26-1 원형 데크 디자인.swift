
class MyCircularDeque {
    var front: Int = 0
    var rear: Int = 0
    var queue: [Int?]
    let capacity: Int

    init(_ k: Int) {
        self.queue = Array(repeating: nil, count: k)
        self.capacity = k
    }
    
    func insertFront(_ value: Int) -> Bool {
        if queue[(front - 1 + capacity) % capacity] == nil {
            front = (front - 1 + capacity) % capacity
            queue[front] = value
            return true
        } else {
            return false
        }
    }
    
    func insertLast(_ value: Int) -> Bool {
        if queue[rear] == nil {
            queue[rear] = value
            rear = (rear + 1) % capacity
            return true
        } else {
            return false
        }
    }
    
    func deleteFront() -> Bool {
        if queue[front] == nil {
            return false
        } else {
            queue[front] = nil
            front = (front + 1) % capacity
            return true
        }
    }
    
    func deleteLast() -> Bool {
        if queue[(rear - 1 + capacity) % capacity] == nil {
            return false
        } else {
            rear = (rear - 1 + capacity) % capacity
            queue[rear] = nil
            return true
        }
    }
    
    func getFront() -> Int {
        return queue[front] ?? -1
    }
    
    func getRear() -> Int {
        return queue[(rear - 1 + capacity) % capacity] ?? -1
    }
    
    func isEmpty() -> Bool {
        return front == rear && queue[front] == nil
    }
    
    func isFull() -> Bool {
        return front == rear && queue[front] != nil
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
