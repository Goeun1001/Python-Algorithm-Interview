class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var cur = ListNode(0)
        let parent = cur
        var head = head
        
        while head != nil {
            while cur.next != nil && cur.next!.val < head!.val {
                cur = cur.next!
            }
            
            let temp1 = cur.next
            let temp2 = head!.next
            cur.next = head
            head!.next = temp1
            head = temp2
            
            // 필요한 경우에만 cur 포인터가 되돌아가도록 처리
            if head != nil && cur.val > head!.val {
                cur = parent
            }
        }
        return parent.next
    }
}
