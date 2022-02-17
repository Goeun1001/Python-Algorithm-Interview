class MyCircularQueue {
    var queue: [Int?]
    let capacity: Int
    var front = 0
    var rear = 0
    
    init(_ k: Int) {
        self.queue = Array(repeating: nil, count: k)
        self.capacity = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        if queue[rear] == nil {
            queue[rear] = value
            rear = (rear + 1) % capacity
            return true
        } else {
            return false
        }
    }
    
    func deQueue() -> Bool {
        if queue[front] == nil {
            return false
        } else {
            queue[front] = nil
            front = (front + 1) % capacity
            return true
        }
    }
    
    func Front() -> Int {
        return queue[front] ?? -1
    }
    
    func Rear() -> Int {
        return queue[rear - 1 < 0 ? capacity - 1 : rear - 1] ?? -1
    }
    
    func isEmpty() -> Bool {
        return front == rear && queue[front] == nil
    }
    
    func isFull() -> Bool {
        return front == rear && queue[front] != nil
    }
}
