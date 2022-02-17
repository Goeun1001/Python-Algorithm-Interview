/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil || left == right {
            return head
        }
        let root = ListNode()
        var start = root
        root.next = head
        
        // start, end 지정
        for _ in 0..<left - 1 {
            start = start.next!
        }
        let end = start.next
        
        // 반복하면서 노드 차례대로 뒤집기
        for _ in 0..<right - left {
            let temp = start.next
            start.next = end?.next
            end?.next = end?.next?.next
            start.next?.next = temp
        }
        return root.next
    }
}
