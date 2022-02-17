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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var olim = 0
        var l1 = l1
        var l2 = l2
        let root = ListNode(0)
        var head = root
        
        while l1 != nil || l2 != nil ||  olim != 0 {
            var value = 0
            
            if l1 != nil {
                value += l1!.val
            }
            if l2 != nil {
                value += l2!.val
            }
            
            if olim != 0 {
                value += olim
                olim = 0
            }
            
            if value >= 10 {
                olim = value / 10
                value %= 10
            }
            
            head.next = ListNode(value)
            head = head.next!
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return root.next
    }
}
