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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        var prev: ListNode?
        
        while node != nil {
            let next = node!.next
            node!.next = prev
            prev = node
            node = next
        }
        
        return prev
    }
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var count = 1
        var current = head
        var part: ListNode? // 그 부분
        var prev: ListNode? // 연결해줘야 하는 부분들
        var next: ListNode?
        var head = head
        
        if left == 1 {
            prev = nil
            part = current
            current = nil
        }
        
        while current != nil {
            if count + 1 == left {
                prev = current
                part = current!.next
                prev?.next = nil
                count += 1
                break
            }
            count += 1
            current = current!.next
        }
        
        current = part
        
        while current != nil {
            if count == right {
                next = current!.next
                current!.next = nil
                break
            }
            count += 1
            current = current!.next
        }
        
//        print(prev, part, next)
        
        let reverse = reverseList(part)
        if prev == nil {
            prev = reverse
            head = prev
        } else {
            prev?.next = reverse
        }
        current = reverse
        
        while current != nil {
            if current!.next == nil {
                current!.next = next
                break
            }
            current = current!.next
        }
        
//        print(prev, part, next)
        
        return head
    }
}
