import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    // 두 정렬 리스트 병합
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        
        if l1 != nil && l2 != nil {
            if l1!.val > l2!.val {
                let temp = l1
                l1 = l2
                l2 = temp
            }
            l1!.next = mergeTwoLists(l1!.next, l2)
        }
        
        return l1 == nil ? l2 : l1
    }
    
    func sortList(_ head: ListNode?) -> ListNode? {
        if !(head != nil && head!.next != nil) {
            return head
        }
        
        // 런너 기법 활용
        var half: ListNode? = nil
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while (fast != nil && fast!.next != nil) {
            half = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        half?.next = nil
        
        // 분할 재귀 호출
        let l1 = self.sortList(head)
        let l2 = self.sortList(slow)
        
        return self.mergeTwoLists(l1, l2)
    }
}
