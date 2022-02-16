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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        
        if (list1 == nil) || (list2 != nil && list1!.val > list2!.val) {
            let temp = list1
            list1 = list2
            list2 = temp
        }
        
        if list1 != nil {
            list1!.next = self.mergeTwoLists(list1!.next, list2)
        }
        
        return list1
    }
}
