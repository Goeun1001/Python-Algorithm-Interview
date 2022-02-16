
class MyQueue {
    var input = [Int]()
    var output = [Int]()
    
    init() {}
    
    func push(_ x: Int) {
        input.append(x)
    }
    
    func pop() -> Int {
        self.peek()
        
        return output.removeLast()
    }
    
    func peek() -> Int {
        if output.isEmpty {
            while !input.isEmpty {
                output.append(input.removeLast())
            }
        }
        return self.output.last ?? -1
    }
    
    func empty() -> Bool {
        return input.isEmpty && output.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
